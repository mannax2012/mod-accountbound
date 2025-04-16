#include "mod_accountbound.h"
#include "Player.h"
#include "DatabaseEnv.h"
#include "Log.h"
#include "StringFormat.h"

void AccountBound::LoadCompanions()
{
    QueryResult result = LoginDatabase.Query("SELECT `spell_id`, `allowable_race` FROM `account_bound_companion_template`");

    if (!result)
    {
        LOG_INFO("server.loading", ">> Loaded 0 companion templates.");
        return;
    }

    accountCompanions.clear();

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();
        AccountCompanions companion;
        companion.SpellId = fields[0].Get<uint32>();
        companion.AllowableRace = fields[1].Get<uint32>();
        accountCompanions.push_back(companion);
        ++count;
    } while (result->NextRow());

    LOG_INFO("server.loading", ">> Loaded {} companion templates.", count);
}

void AccountBound::LoadFactionSpecificCompanions()
{
    QueryResult result = LoginDatabase.Query(
        "SELECT `alliance_id`, `horde_id` "
        "FROM `account_bound_factionchange_spells` AS pfs "
        "LEFT JOIN `account_bound_companion_template` AS abt "
        "ON pfs.`alliance_id` = abt.`spell_id` "
        "WHERE abt.`allowable_race` = 1101");

    if (!result)
    {
        LOG_INFO("server.loading", ">> Loaded 0 faction-specific companion templates.");
        return;
    }

    factionSpecificAccountCompanions.clear();

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();
        FactionSpecificAccountCompanions entry;
        entry.AllianceId = fields[0].Get<uint32>();
        entry.HordeId = fields[1].Get<uint32>();
        factionSpecificAccountCompanions.push_back(entry);
        ++count;
    } while (result->NextRow());

    LOG_INFO("server.loading", ">> Loaded {} faction-specific companion templates.", count);
}

void AccountBound::SaveCompanion(Player* player, uint32 /*spellId*/)
{
    std::string data;
    uint32 accountId = player->GetSession()->GetAccountId();

    for (const auto& companion : accountCompanions)
    {
        if (!player->HasSpell(companion.SpellId))
            continue;

        data += Acore::StringFormat("({}, {}, {}),", accountId, companion.SpellId, companion.AllowableRace);

        uint32 factionSpellId = FindFactionSpecificCompanion(companion.SpellId);
        if (factionSpellId > 0)
        {
            uint32 oppositeRace = (companion.AllowableRace == 690) ? 1101 : 690;
            data += Acore::StringFormat("({}, {}, {}),", accountId, factionSpellId, oppositeRace);
        }
    }

    if (!data.empty())
    {
        data.pop_back(); // Remove last comma
        LoginDatabase.Execute("REPLACE INTO `account_bound_companions` (`account_id`, `spell_id`, `allowable_race`) VALUES {}", data);
    }
}

void AccountBound::LearnCompanions(Player* player)
{
    QueryResult result = LoginDatabase.Query(Acore::StringFormat(
        "SELECT `spell_id` FROM `account_bound_companions` WHERE `account_id` = {} AND `allowable_race` & {}",
        player->GetSession()->GetAccountId(),
        player->getRaceMask()));

    if (!result)
        return;

    do
    {
        Field* fields = result->Fetch();
        uint32 spellId = fields[0].Get<uint32>();

        if (!player->HasSpell(spellId))
            player->learnSpell(spellId);
    } while (result->NextRow());
}

int AccountBound::FindFactionSpecificCompanion(uint32 spellId)
{
    for (const auto& entry : factionSpecificAccountCompanions)
    {
        if (entry.AllianceId == spellId)
            return entry.HordeId;
        if (entry.HordeId == spellId)
            return entry.AllianceId;
    }

    return 0;
}
