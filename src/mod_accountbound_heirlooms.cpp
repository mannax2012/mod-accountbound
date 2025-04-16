#include "mod_accountbound.h"
#include "Player.h"
#include "Item.h"
#include "DatabaseEnv.h" // Needed for LoginDatabase

void AccountBound::SaveHeirloom(Player* player, uint32 itemId)
{
    if (!player || !itemId)
        return;

    uint32 accountId = player->GetSession()->GetAccountId();

    LoginDatabase.Execute(
        "REPLACE INTO `account_bound_heirlooms` (`account_id`, `item_id`) VALUES ({}, {})",
        accountId, itemId
    );
}
