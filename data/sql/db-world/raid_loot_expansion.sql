-- === RAID LOOT EXPANSION - Full Cross-Expansion Scaling (60 / 70 / 80) ===
-- Creates NEW item copies only (original raid items are untouched)
-- Classic + TBC + WotLK raids only

-- Tier 80 (WotLK power) - used by level 80 players
INSERT INTO item_template 
(entry, class, subclass, SoundOverrideSubclass, name, displayid, Quality, Flags, FlagsExtra, BuyCount, BuyPrice, SellPrice, InventoryType, AllowableClass, AllowableRace, ItemLevel, RequiredLevel, RequiredSkill, RequiredSkillRank, requiredspell, requiredhonorrank, RequiredCityRank, RequiredReputationFaction, RequiredReputationRank, maxcount, stackable, ContainerSlots, StatsCount, stat_type1, stat_value1, stat_type2, stat_value2, stat_type3, stat_value3, stat_type4, stat_value4, stat_type5, stat_value5, stat_type6, stat_value6, stat_type7, stat_value7, stat_type8, stat_value8, stat_type9, stat_value9, stat_type10, stat_value10, ScalingStatDistribution, ScalingStatValue, dmg_min1, dmg_max1, dmg_type1, dmg_min2, dmg_max2, dmg_type2, armor, holyRes, fireRes, natureRes, frostRes, shadowRes, arcaneRes, delay, ammo_type, RangedModRange, spellid_1, spelltrigger_1, spellcharges_1, spellppmRate_1, spellcooldown_1, spellcategory_1, spellcategorycooldown_1, spellid_2, spelltrigger_2, spellcharges_2, spellppmRate_2, spellcooldown_2, spellcategory_2, spellcategorycooldown_2, spellid_3, spelltrigger_3, spellcharges_3, spellppmRate_3, spellcooldown_3, spellcategory_3, spellcategorycooldown_3, spellid_4, spelltrigger_4, spellcharges_4, spellppmRate_4, spellcooldown_4, spellcategory_4, spellcategorycooldown_4, spellid_5, spelltrigger_5, spellcharges_5, spellppmRate_5, spellcooldown_5, spellcategory_5, spellcategorycooldown_5, bonding, description, PageText, LanguageID, PageMaterial, startquest, lockid, Material, sheath, RandomProperty, RandomSuffix, block, itemset, MaxDurability, area, Map, BagFamily, TotemCategory, socketColor_1, socketContent_1, socketColor_2, socketContent_2, socketColor_3, socketContent_3, socketBonus, GemProperties, armorDamageModifier, duration, ItemLimitCategory, HolidayId, ScriptName, DisenchantID, FoodType, minMoneyLoot, maxMoneyLoot, flagsCustom, VerifiedBuild)
SELECT 
    850000 + entry, class, subclass, SoundOverrideSubclass, CONCAT(name, ' (Level 80)'), displayid, Quality, Flags, FlagsExtra, BuyCount, BuyPrice, SellPrice, InventoryType, AllowableClass, AllowableRace,
    ItemLevel + 70, 80, RequiredSkill, RequiredSkillRank, requiredspell, requiredhonorrank, RequiredCityRank, RequiredReputationFaction, RequiredReputationRank, maxcount, stackable, ContainerSlots, StatsCount,
    stat_type1, ROUND(stat_value1 * 3.5), stat_type2, ROUND(stat_value2 * 3.5), stat_type3, ROUND(stat_value3 * 3.5), stat_type4, ROUND(stat_value4 * 3.5),
    stat_type5, ROUND(stat_value5 * 3.5), stat_type6, ROUND(stat_value6 * 3.5), stat_type7, ROUND(stat_value7 * 3.5), stat_type8, ROUND(stat_value8 * 3.5),
    stat_type9, ROUND(stat_value9 * 3.5), stat_type10, ROUND(stat_value10 * 3.5), ScalingStatDistribution, ScalingStatValue,
    ROUND(dmg_min1 * 3.5), ROUND(dmg_max1 * 3.5), dmg_type1, ROUND(dmg_min2 * 3.5), ROUND(dmg_max2 * 3.5), dmg_type2,
    ROUND(armor * 3.5), holyRes, fireRes, natureRes, frostRes, shadowRes, arcaneRes, delay, ammo_type, RangedModRange,
    spellid_1, spelltrigger_1, spellcharges_1, spellppmRate_1, spellcooldown_1, spellcategory_1, spellcategorycooldown_1,
    spellid_2, spelltrigger_2, spellcharges_2, spellppmRate_2, spellcooldown_2, spellcategory_2, spellcategorycooldown_2,
    spellid_3, spelltrigger_3, spellcharges_3, spellppmRate_3, spellcooldown_3, spellcategory_3, spellcategorycooldown_3,
    spellid_4, spelltrigger_4, spellcharges_4, spellppmRate_4, spellcooldown_4, spellcategory_4, spellcategorycooldown_4,
    spellid_5, spelltrigger_5, spellcharges_5, spellppmRate_5, spellcooldown_5, spellcategory_5, spellcategorycooldown_5,
    bonding, description, PageText, LanguageID, PageMaterial, startquest, lockid, Material, sheath, RandomProperty, RandomSuffix, block, itemset, MaxDurability, area, Map, BagFamily, TotemCategory,
    socketColor_1, socketContent_1, socketColor_2, socketContent_2, socketColor_3, socketContent_3, socketBonus, GemProperties, armorDamageModifier, duration, ItemLimitCategory, HolidayId, ScriptName, DisenchantID, FoodType, minMoneyLoot, maxMoneyLoot, flagsCustom, VerifiedBuild
FROM item_template
WHERE entry IN (
    SELECT DISTINCT item FROM creature_loot_template 
    WHERE entry IN (SELECT id FROM creature WHERE map IN (249,309,409,469,509,531,533,532,534,544,548,550,564,565,568,585,603,615,616,624,631,649,724))
    UNION
    SELECT DISTINCT item FROM gameobject_loot_template 
    WHERE entry IN (SELECT id FROM gameobject_template WHERE data1 IN (SELECT guid FROM gameobject WHERE map IN (249,309,409,469,509,531,533,532,534,544,548,550,564,565,568,585,603,615,616,624,631,649,724)))
)
AND NOT EXISTS (SELECT 1 FROM item_template WHERE entry = 850000 + item_template.entry);

-- Tier 70 (TBC power) - used by level 70 players
INSERT INTO item_template 
(entry, class, subclass, SoundOverrideSubclass, name, displayid, Quality, Flags, FlagsExtra, BuyCount, BuyPrice, SellPrice, InventoryType, AllowableClass, AllowableRace, ItemLevel, RequiredLevel, RequiredSkill, RequiredSkillRank, requiredspell, requiredhonorrank, RequiredCityRank, RequiredReputationFaction, RequiredReputationRank, maxcount, stackable, ContainerSlots, StatsCount, stat_type1, stat_value1, stat_type2, stat_value2, stat_type3, stat_value3, stat_type4, stat_value4, stat_type5, stat_value5, stat_type6, stat_value6, stat_type7, stat_value7, stat_type8, stat_value8, stat_type9, stat_value9, stat_type10, stat_value10, ScalingStatDistribution, ScalingStatValue, dmg_min1, dmg_max1, dmg_type1, dmg_min2, dmg_max2, dmg_type2, armor, holyRes, fireRes, natureRes, frostRes, shadowRes, arcaneRes, delay, ammo_type, RangedModRange, spellid_1, spelltrigger_1, spellcharges_1, spellppmRate_1, spellcooldown_1, spellcategory_1, spellcategorycooldown_1, spellid_2, spelltrigger_2, spellcharges_2, spellppmRate_2, spellcooldown_2, spellcategory_2, spellcategorycooldown_2, spellid_3, spelltrigger_3, spellcharges_3, spellppmRate_3, spellcooldown_3, spellcategory_3, spellcategorycooldown_3, spellid_4, spelltrigger_4, spellcharges_4, spellppmRate_4, spellcooldown_4, spellcategory_4, spellcategorycooldown_4, spellid_5, spelltrigger_5, spellcharges_5, spellppmRate_5, spellcooldown_5, spellcategory_5, spellcategorycooldown_5, bonding, description, PageText, LanguageID, PageMaterial, startquest, lockid, Material, sheath, RandomProperty, RandomSuffix, block, itemset, MaxDurability, area, Map, BagFamily, TotemCategory, socketColor_1, socketContent_1, socketColor_2, socketContent_2, socketColor_3, socketContent_3, socketBonus, GemProperties, armorDamageModifier, duration, ItemLimitCategory, HolidayId, ScriptName, DisenchantID, FoodType, minMoneyLoot, maxMoneyLoot, flagsCustom, VerifiedBuild)
SELECT 
    851000 + entry, class, subclass, SoundOverrideSubclass, CONCAT(name, ' (Level 70)'), displayid, Quality, Flags, FlagsExtra, BuyCount, BuyPrice, SellPrice, InventoryType, AllowableClass, AllowableRace,
    ItemLevel + 45, 70, RequiredSkill, RequiredSkillRank, requiredspell, requiredhonorrank, RequiredCityRank, RequiredReputationFaction, RequiredReputationRank, maxcount, stackable, ContainerSlots, StatsCount,
    stat_type1, ROUND(stat_value1 * 2.6), stat_type2, ROUND(stat_value2 * 2.6), stat_type3, ROUND(stat_value3 * 2.6), stat_type4, ROUND(stat_value4 * 2.6),
    stat_type5, ROUND(stat_value5 * 2.6), stat_type6, ROUND(stat_value6 * 2.6), stat_type7, ROUND(stat_value7 * 2.6), stat_type8, ROUND(stat_value8 * 2.6),
    stat_type9, ROUND(stat_value9 * 2.6), stat_type10, ROUND(stat_value10 * 2.6), ScalingStatDistribution, ScalingStatValue,
    ROUND(dmg_min1 * 2.6), ROUND(dmg_max1 * 2.6), dmg_type1, ROUND(dmg_min2 * 2.6), ROUND(dmg_max2 * 2.6), dmg_type2,
    ROUND(armor * 2.6), holyRes, fireRes, natureRes, frostRes, shadowRes, arcaneRes, delay, ammo_type, RangedModRange,
    spellid_1, spelltrigger_1, spellcharges_1, spellppmRate_1, spellcooldown_1, spellcategory_1, spellcategorycooldown_1,
    spellid_2, spelltrigger_2, spellcharges_2, spellppmRate_2, spellcooldown_2, spellcategory_2, spellcategorycooldown_2,
    spellid_3, spelltrigger_3, spellcharges_3, spellppmRate_3, spellcooldown_3, spellcategory_3, spellcategorycooldown_3,
    spellid_4, spelltrigger_4, spellcharges_4, spellppmRate_4, spellcooldown_4, spellcategory_4, spellcategorycooldown_4,
    spellid_5, spelltrigger_5, spellcharges_5, spellppmRate_5, spellcooldown_5, spellcategory_5, spellcategorycooldown_5,
    bonding, description, PageText, LanguageID, PageMaterial, startquest, lockid, Material, sheath, RandomProperty, RandomSuffix, block, itemset, MaxDurability, area, Map, BagFamily, TotemCategory,
    socketColor_1, socketContent_1, socketColor_2, socketContent_2, socketColor_3, socketContent_3, socketBonus, GemProperties, armorDamageModifier, duration, ItemLimitCategory, HolidayId, ScriptName, DisenchantID, FoodType, minMoneyLoot, maxMoneyLoot, flagsCustom, VerifiedBuild
FROM item_template
WHERE entry IN (
    SELECT DISTINCT item FROM creature_loot_template 
    WHERE entry IN (SELECT id FROM creature WHERE map IN (249,309,409,469,509,531,533,532,534,544,548,550,564,565,568,585,603,615,616,624,631,649,724))
    UNION
    SELECT DISTINCT item FROM gameobject_loot_template 
    WHERE entry IN (SELECT id FROM gameobject_template WHERE data1 IN (SELECT guid FROM gameobject WHERE map IN (249,309,409,469,509,531,533,532,534,544,548,550,564,565,568,585,603,615,616,624,631,649,724)))
)
AND NOT EXISTS (SELECT 1 FROM item_template WHERE entry = 851000 + item_template.entry);

-- Tier 60 (Classic power) - used by level 60 players
INSERT INTO item_template 
(entry, class, subclass, SoundOverrideSubclass, name, displayid, Quality, Flags, FlagsExtra, BuyCount, BuyPrice, SellPrice, InventoryType, AllowableClass, AllowableRace, ItemLevel, RequiredLevel, RequiredSkill, RequiredSkillRank, requiredspell, requiredhonorrank, RequiredCityRank, RequiredReputationFaction, RequiredReputationRank, maxcount, stackable, ContainerSlots, StatsCount, stat_type1, stat_value1, stat_type2, stat_value2, stat_type3, stat_value3, stat_type4, stat_value4, stat_type5, stat_value5, stat_type6, stat_value6, stat_type7, stat_value7, stat_type8, stat_value8, stat_type9, stat_value9, stat_type10, stat_value10, ScalingStatDistribution, ScalingStatValue, dmg_min1, dmg_max1, dmg_type1, dmg_min2, dmg_max2, dmg_type2, armor, holyRes, fireRes, natureRes, frostRes, shadowRes, arcaneRes, delay, ammo_type, RangedModRange, spellid_1, spelltrigger_1, spellcharges_1, spellppmRate_1, spellcooldown_1, spellcategory_1, spellcategorycooldown_1, spellid_2, spelltrigger_2, spellcharges_2, spellppmRate_2, spellcooldown_2, spellcategory_2, spellcategorycooldown_2, spellid_3, spelltrigger_3, spellcharges_3, spellppmRate_3, spellcooldown_3, spellcategory_3, spellcategorycooldown_3, spellid_4, spelltrigger_4, spellcharges_4, spellppmRate_4, spellcooldown_4, spellcategory_4, spellcategorycooldown_4, spellid_5, spelltrigger_5, spellcharges_5, spellppmRate_5, spellcooldown_5, spellcategory_5, spellcategorycooldown_5, bonding, description, PageText, LanguageID, PageMaterial, startquest, lockid, Material, sheath, RandomProperty, RandomSuffix, block, itemset, MaxDurability, area, Map, BagFamily, TotemCategory, socketColor_1, socketContent_1, socketColor_2, socketContent_2, socketColor_3, socketContent_3, socketBonus, GemProperties, armorDamageModifier, duration, ItemLimitCategory, HolidayId, ScriptName, DisenchantID, FoodType, minMoneyLoot, maxMoneyLoot, flagsCustom, VerifiedBuild)
SELECT 
    852000 + entry, class, subclass, SoundOverrideSubclass, CONCAT(name, ' (Level 60)'), displayid, Quality, Flags, FlagsExtra, BuyCount, BuyPrice, SellPrice, InventoryType, AllowableClass, AllowableRace,
    ItemLevel + 15, 60, RequiredSkill, RequiredSkillRank, requiredspell, requiredhonorrank, RequiredCityRank, RequiredReputationFaction, RequiredReputationRank, maxcount, stackable, ContainerSlots, StatsCount,
    stat_type1, ROUND(stat_value1 * 1.8), stat_type2, ROUND(stat_value2 * 1.8), stat_type3, ROUND(stat_value3 * 1.8), stat_type4, ROUND(stat_value4 * 1.8),
    stat_type5, ROUND(stat_value5 * 1.8), stat_type6, ROUND(stat_value6 * 1.8), stat_type7, ROUND(stat_value7 * 1.8), stat_type8, ROUND(stat_value8 * 1.8),
    stat_type9, ROUND(stat_value9 * 1.8), stat_type10, ROUND(stat_value10 * 1.8), ScalingStatDistribution, ScalingStatValue,
    ROUND(dmg_min1 * 1.8), ROUND(dmg_max1 * 1.8), dmg_type1, ROUND(dmg_min2 * 1.8), ROUND(dmg_max2 * 1.8), dmg_type2,
    ROUND(armor * 1.8), holyRes, fireRes, natureRes, frostRes, shadowRes, arcaneRes, delay, ammo_type, RangedModRange,
    spellid_1, spelltrigger_1, spellcharges_1, spellppmRate_1, spellcooldown_1, spellcategory_1, spellcategorycooldown_1,
    spellid_2, spelltrigger_2, spellcharges_2, spellppmRate_2, spellcooldown_2, spellcategory_2, spellcategorycooldown_2,
    spellid_3, spelltrigger_3, spellcharges_3, spellppmRate_3, spellcooldown_3, spellcategory_3, spellcategorycooldown_3,
    spellid_4, spelltrigger_4, spellcharges_4, spellppmRate_4, spellcooldown_4, spellcategory_4, spellcategorycooldown_4,
    spellid_5, spelltrigger_5, spellcharges_5, spellppmRate_5, spellcooldown_5, spellcategory_5, spellcategorycooldown_5,
    bonding, description, PageText, LanguageID, PageMaterial, startquest, lockid, Material, sheath, RandomProperty, RandomSuffix, block, itemset, MaxDurability, area, Map, BagFamily, TotemCategory,
    socketColor_1, socketContent_1, socketColor_2, socketContent_2, socketColor_3, socketContent_3, socketBonus, GemProperties, armorDamageModifier, duration, ItemLimitCategory, HolidayId, ScriptName, DisenchantID, FoodType, minMoneyLoot, maxMoneyLoot, flagsCustom, VerifiedBuild
FROM item_template
WHERE entry IN (
    SELECT DISTINCT item FROM creature_loot_template 
    WHERE entry IN (SELECT id FROM creature WHERE map IN (249,309,409,469,509,531,533,532,534,544,548,550,564,565,568,585,603,615,616,624,631,649,724))
    UNION
    SELECT DISTINCT item FROM gameobject_loot_template 
    WHERE entry IN (SELECT id FROM gameobject_template WHERE data1 IN (SELECT guid FROM gameobject WHERE map IN (249,309,409,469,509,531,533,532,534,544,548,550,564,565,568,585,603,615,616,624,631,649,724)))
)
AND NOT EXISTS (SELECT 1 FROM item_template WHERE entry = 852000 + item_template.entry);