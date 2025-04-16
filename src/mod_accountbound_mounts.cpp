#include "mod_accountbound.h"
#include "Player.h"
#include "DatabaseEnv.h"
#include "Log.h"
#include "StringFormat.h"

void AccountBound::LoadMounts()
{
    QueryResult result = LoginDatabase.Query(
        "SELECT `spell_id`, `allowable_race`, `allowable_class`, `required_level`, "
        "`required_skill`, `required_skill_rank` FROM `account_bound_mount_template`");

    if (!result)
    {
        LOG_INFO("server.loading", ">> Loaded 0 mount templates.");
        return;
    }

    accountMounts.clear();
    uint32 count = 0;

    do
    {
        Field* fields = result->Fetch();
        AccountMounts mount;
        mount.SpellId = fields[0].Get<uint32>();
        mount.AllowableRace = fields[1].Get<uint32>();
        mount.AllowableClass = fields[2].Get<uint32>();
        mount.RequiredLevel = fields[3].Get<uint32>();
        mount.RequiredSkill = fields[4].Get<uint32>();
        mount.RequiredSkillRank = fields[5].Get<uint32>();

        accountMounts.push_back(mount);
        ++count;
    } while (result->NextRow());

    LOG_INFO("server.loading", ">> Loaded {} mount templates.", count);
}

void AccountBound::LoadFactionSpecificMounts()
{
    QueryResult result = LoginDatabase.Query(
        "SELECT `alliance_id`, `horde_id` "
        "FROM `account_bound_factionchange_spells` AS pfs "
        "LEFT JOIN `account_bound_mount_template` AS abt ON pfs.`alliance_id` = abt.`spell_id` "
        "WHERE abt.`allowable_race` = 1101");

    if (!result)
    {
        LOG_INFO("server.loading", ">> Loaded 0 faction-specific mount templates.");
        return;
    }

    factionSpecificAccountMounts.clear();
    uint32 count = 0;

    do
    {
        Field* fields = result->Fetch();
        FactionSpecificAccountMounts entry;
        entry.AllianceId = fields[0].Get<uint32>();
        entry.HordeId = fields[1].Get<uint32>();
        factionSpecificAccountMounts.push_back(entry);
        ++count;
    } while (result->NextRow());

    LOG_INFO("server.loading", ">> Loaded {} faction-specific mount templates.", count);
}

void AccountBound::SaveMounts(Player* player, uint32 spellID)
{
    std::string data;
    uint32 accountId = player->GetSession()->GetAccountId();

    for (const auto& mount : accountMounts)
    {
        if (!player->HasSpell(mount.SpellId))
            continue;

        data += Acore::StringFormat("({}, {}, {}, {}, {}, {}, {}),",
            accountId,
            mount.SpellId,
            mount.AllowableRace,
            mount.AllowableClass,
            mount.RequiredLevel,
            mount.RequiredSkill,
            mount.RequiredSkillRank
        );

        uint32 factionSpellId = FindFactionSpecificMount(mount.SpellId);
        if (factionSpellId > 0)
        {
            uint32 oppositeRace = (mount.AllowableRace == 690) ? 1101 : 690;
            data += Acore::StringFormat("({}, {}, {}, {}, {}, {}, {}),",
                accountId,
                factionSpellId,
                oppositeRace,
                mount.AllowableClass,
                mount.RequiredLevel,
                mount.RequiredSkill,
                mount.RequiredSkillRank
            );
        }
    }

    if (!data.empty())
    {
        data.pop_back(); // Remove last comma
        LoginDatabase.Execute(
            "REPLACE INTO `account_bound_mounts` (`account_id`, `spell_id`, `allowable_race`, "
            "`allowable_class`, `required_level`, `required_skill`, `required_skill_rank`) VALUES {}", data);
    }
}

void AccountBound::LearnMounts(Player* player)
{
    QueryResult result = LoginDatabase.Query(Acore::StringFormat(
        "SELECT `spell_id` FROM `account_bound_mounts` "
        "WHERE `account_id` = {} AND `allowable_race` & {} "
        "AND `allowable_class` & {} AND `required_level` <= {} "
        "AND (`required_skill` = 0 OR `required_skill_rank` <= {})",
        player->GetSession()->GetAccountId(),
        player->getRaceMask(),
        player->getClassMask(),
        player->GetLevel(),
        player->GetSkillValue(SKILL_RIDING)
    ));

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

int AccountBound::FindFactionSpecificMount(uint32 spell_id)
{
    for (const auto& entry : factionSpecificAccountMounts)
    {
        if (entry.AllianceId == spell_id)
            return entry.HordeId;
        else if (entry.HordeId == spell_id)
            return entry.AllianceId;
    }

    return 0;
}

