#include "ScriptMgr.h"
#include "Player.h"
#include "Item.h"
#include "Config.h"
#include "Log.h"
#include "Map.h"
#include <unordered_set>
#include <sstream>

class RaidLootExpansion_PlayerScript : public PlayerScript
{
public:
    RaidLootExpansion_PlayerScript() : PlayerScript("RaidLootExpansion_PlayerScript") { }

    bool IsEnabledRaidMap(uint32 mapId) const
    {
        if (!sConfigMgr->GetOption<bool>("RaidLootExpansion.Enable", true))
            return false;

        std::string mapsStr = sConfigMgr->GetOption<std::string>("RaidLootExpansion.EnabledMaps", "");
        std::unordered_set<uint32> enabledMaps;
        std::stringstream ss(mapsStr);
        std::string token;
        while (std::getline(ss, token, ','))
            if (!token.empty()) enabledMaps.insert(std::stoul(token));
        return enabledMaps.count(mapId) > 0;
    }

    uint32 GetScaledEntry(uint32 originalEntry, uint8 playerLevel) const
    {
        if (playerLevel >= 80) return 850000 + originalEntry;   // Tier 80
        if (playerLevel >= 70) return 851000 + originalEntry;   // Tier 70
        return 852000 + originalEntry;                           // Tier 60
    }

    void OnLootItem(Player* player, Item* item, uint32 count, Object* /*lootTarget*/) override
    {
        if (!IsEnabledRaidMap(player->GetMapId()))
            return;

        uint32 originalEntry = item->GetEntry();
        uint32 scaledEntry = GetScaledEntry(originalEntry, player->GetLevel());

        if (!sObjectMgr->GetItemTemplate(scaledEntry))
            return;

        player->DestroyItemCount(originalEntry, count, true);

        Item* scaledItem = Item::CreateItem(scaledEntry, count, player);
        if (scaledItem)
        {
            player->AddItem(scaledItem);

            if (sConfigMgr->GetOption<bool>("RaidLootExpansion.ShowMessage", true))
                player->SendSysMessage("|cff00ff00[Raid Loot Expansion]|r You received a level-appropriate scaled version of this item!");
        }
    }
};

class RaidLootExpansion_WorldScript : public WorldScript
{
public:
    RaidLootExpansion_WorldScript() : WorldScript("RaidLootExpansion_WorldScript") { }

    void OnStartup() override
    {
        uint32 targetExp = sConfigMgr->GetOption<uint32>("RaidLootExpansion.TargetExpansion", 2);
        std::string expName = (targetExp == 0) ? "Classic" : (targetExp == 1) ? "TBC" : "WotLK";
        TC_LOG_INFO("server.loading", ">> mod-raid-loot-expansion loaded - Classic/TBC/WotLK raid loot scaled for levels 60/70/80 (Server target: %s)", expName.c_str());
    }
};

void AddRaidLootExpansionScripts()
{
    new RaidLootExpansion_PlayerScript();
    new RaidLootExpansion_WorldScript();
}