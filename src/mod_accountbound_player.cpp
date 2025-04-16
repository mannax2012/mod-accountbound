#include "mod_accountbound.h"
#include "Player.h"
#include "DatabaseEnv.h"
#include "Log.h"

// Make sure you have proper definitions for these, either from your core or here:
#ifndef RACEMASK_ALLIANCE
#define RACEMASK_ALLIANCE 1101
#endif

#ifndef RACEMASK_HORDE
#define RACEMASK_HORDE 690
#endif

void AccountBound::SaveMounts(Player* player, uint32 spell_id)
{
    if (!EnableAccountMounts)
        return;

    // Loop through account-bound mount templates to find the matching one
    for (const auto& mount : accountMounts)
    {
        if (mount.SpellId != spell_id)
            continue;

        uint32 accountId = player->GetSession()->GetAccountId();
        uint32 altSpellId = FindFactionSpecificMount(mount.SpellId);  // Returns 0 if no alt mount exists

        if (altSpellId == 0)
        {
            // No faction-specific mount: save a single record
            LoginDatabase.Execute("REPLACE INTO `account_bound_mounts` "
                "(`account_id`, `spell_id`, `allowable_race`, `allowable_class`, `required_level`, `required_skill`, `required_skill_rank`) "
                "VALUES ({}, {}, {}, {}, {}, {}, {})",
                accountId,
                spell_id,
                mount.AllowableRace,
                mount.AllowableClass,
                mount.RequiredLevel,
                mount.RequiredSkill,
                mount.RequiredSkillRank);
        }
        else
        {
            // Faction-specific mount found: insert two rows, one for Alliance and one for Horde.
            LoginDatabase.Execute("REPLACE INTO `account_bound_mounts` "
                "(`account_id`, `spell_id`, `allowable_race`, `allowable_class`, `required_level`, `required_skill`, `required_skill_rank`) "
                "VALUES ({}, {}, {}, {}, {}, {}, {}), "
                "({}, {}, {}, {}, {}, {}, {})",
                accountId,
                mount.SpellId,      // Primary mount spell for one faction
                RACEMASK_ALLIANCE,  // For Alliance
                mount.AllowableClass,
                mount.RequiredLevel,
                mount.RequiredSkill,
                mount.RequiredSkillRank,
                accountId,
                altSpellId,         // Alternate faction mount spell
                RACEMASK_HORDE,     // For Horde
                mount.AllowableClass,
                mount.RequiredLevel,
                mount.RequiredSkill,
                mount.RequiredSkillRank);
        }
        // Found the mount—exit the loop.
        break;
    }
}


void AccountBound::OnPlayerAchievementComplete(Player* player, AchievementEntry const* achievement)
{
    if (player->IsGameMaster() && !EnableGamemasters)
        return;

    if (achievement->ID == ACHIEVEMENT_APPRENTICE || achievement->ID == ACHIEVEMENT_JOURNEYMAN || achievement->ID == ACHIEVEMENT_EXPERT || achievement->ID == ACHIEVEMENT_ARTISAN)
        LearnMounts(player);
}

void AccountBound::OnPlayerAfterStoreOrEquipNewItem(Player* player, uint32 /*vendorslot*/, Item* item, uint8 /*count*/, uint8 /*bag*/, uint8 /*slot*/, ItemTemplate const* /*pProto*/, Creature* /*pVendor*/, VendorItem const* /*crItem*/, bool /*bStore*/)
{
    if (player->IsGameMaster() && !EnableGamemasters)
        return;

    if (!item || !item->GetTemplate() || !EnableAccountHeirlooms)
        return;

    if (item->GetTemplate()->Quality == ITEM_QUALITY_HEIRLOOM && item->GetEntry() != 49177)
    {
        SaveHeirloom(player, item->GetEntry());
        item->SetNotRefundable(player);
    }
}

void AccountBound::OnPlayerLearnSpell(Player* player, uint32 spellID)
{
    if (player->IsGameMaster() && !EnableGamemasters)
        return;

    SaveCompanion(player, spellID);
    SaveMounts(player, spellID);
    if (!EnableAccountMounts)
        return;

    // Check if this spell is one of the account-bound mount spells
    for (auto const& mount : accountMounts)
    {
        if (mount.SpellId == spellID)
        {
            SaveMounts(player, spellID);
            return;
        }
    }

    // Optionally check faction-specific
    for (auto const& mount : factionSpecificAccountMounts)
    {
        if (mount.AllianceId == spellID || mount.HordeId == spellID)
        {
            SaveMounts(player, spellID);
            return;
        }
    }
}

void AccountBound::OnPlayerLevelChanged(Player* player, uint8 /*oldlevel*/)
{
    if (player->IsGameMaster() && !EnableGamemasters)
        return;

    LearnMounts(player);
}

void AccountBound::OnPlayerLogin(Player* player)
{
    if (player->IsGameMaster() && !EnableGamemasters)
        return;

    LearnCompanions(player);
    LearnMounts(player);
}

void AccountBound::SaveCompanion(Player* player, uint32 spell_id)
{
    if (!EnableAccountCompanions)
        return;

    for (auto& accountCompanion : accountCompanions)
    {
        if (accountCompanion.SpellId != spell_id)
            continue;

        int factionCompanionSpellId = FindFactionSpecificCompanion(accountCompanion.SpellId);
        if (factionCompanionSpellId == -1)
        {
            LoginDatabase.Execute("REPLACE INTO `account_bound_companions` (`account_id`, `spell_id`, `allowable_race`)"
                "VALUES ({}, {}, {})",
                player->GetSession()->GetAccountId(),
                spell_id,
                accountCompanion.AllowableRace);
            continue;
        }

        LoginDatabase.Execute("REPLACE INTO `account_bound_companions` (`account_id`, `spell_id`, `allowable_race`) "
            "VALUES ({}, {}, {}), ({}, {}, {})",
            player->GetSession()->GetAccountId(),
            factionSpecificAccountCompanions[factionCompanionSpellId].AllianceId,
            RACEMASK_ALLIANCE,
            player->GetSession()->GetAccountId(),
            factionSpecificAccountCompanions[factionCompanionSpellId].HordeId,
            RACEMASK_HORDE);
    }
}

void AccountBound::LearnCompanions(Player* player)
{
    if (!EnableAccountCompanions)
        return;

    QueryResult result = LoginDatabase.Query("SELECT `spell_id` FROM `account_bound_companions` WHERE `account_id`={} AND `allowable_race` & {}",
        player->GetSession()->GetAccountId(),
        player->getRaceMask());

    if (!result)
        return;

    do
    {
        Field* fields = result->Fetch();
        uint32 spell_id = fields[0].Get<uint32>();

        if (!player->HasSpell(spell_id))
            player->learnSpell(spell_id);

    } while (result->NextRow());
}

void AccountBound::SaveHeirloom(Player* player, uint32 item_id)
{
    LoginDatabase.Execute("REPLACE INTO `account_bound_heirlooms` (`account_id`, `item_id`) "
        "VALUES ({}, {})",
        player->GetSession()->GetAccountId(),
        item_id);
}

void AccountBound::LearnMounts(Player* player)
{
    if (!EnableAccountMounts)
        return;

    QueryResult result = LoginDatabase.Query("SELECT `spell_id` FROM `account_bound_mounts` WHERE `account_id` = {} AND `allowable_race` & {} "
            "AND `allowable_class` & {} AND `required_level` <= {} AND (`required_skill` = 0 OR `required_skill_rank` <= {})",
            player->GetSession()->GetAccountId(),
            player->getRaceMask(),
            player->getClassMask(),
            player->GetLevel(),
            player->GetSkillValue(SKILL_RIDING));

    if (!result)
        return;

    do
    {
        Field* fields = result->Fetch();
        uint32 spell_id = fields[0].Get<uint32>();

        if (!player->HasSpell(spell_id))
            player->learnSpell(spell_id);

    } while (result->NextRow());
}

