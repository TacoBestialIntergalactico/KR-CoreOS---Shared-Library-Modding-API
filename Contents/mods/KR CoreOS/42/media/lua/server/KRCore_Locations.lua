-- ==========================================================================
-- KR CoreOS - Location Groups v1.1.0 B42 (Server)
-- Copyright (C) 2026 D4RK-C0MP4N1. Licensed under the MIT License (see LICENSE).
-- ==========================================================================
--
-- Defines the location groups (ProceduralDistributions containers) that the
-- KR mods use to register their items.
--
-- All names verified against ProceduralDistributions.lua from the B42.19
-- install. Names that don't exist in future versions are skipped silently in
-- KRCore_Server (processDistributions).
--
-- KRCore.COMBO (at the end) defines combined groups: a name that expands to
-- the union of several KRCore.LOC groups, with automatic dedupe. Used just
-- like a normal group in KRCore.dist.add().
-- ==========================================================================

KRCore.LOC = {

    -- =========================================================
    -- MILITARY
    -- Military, police, prison and security storage
    -- =========================================================
    MILITARY = {
        "ArmyStorageElectronics",
        "ArmyStorageOutfit",
        "ArmyHangarTools",
        "ArmyHangarMechanics",
        "ArmyStorageMedical",
        "ArmySurplusTools",
        "ArmySurplusMisc",
        "ArmySurplusCases",
        "ArmySurplusBackpacks",
        "ArmyBunkerLockers",
        "ArmyBunkerStorage",
        "PoliceStorageMechanics",
        "PoliceLockers",
        "FireStorageTools",
        "SecurityLockers",
        "PrisonGuardLockers",
        "RangerLockers",
    },

    -- =========================================================
    -- SURVIVAL
    -- Camping, hunting and survival-gear stores
    -- =========================================================
    SURVIVAL = {
        "SurvivalGear",
        "CampingStoreGear",
        "CampingStoreTools",
        "CampingStoreLighting",
        "CampingStoreCases",
        "CampingStoreBackpacks",
        "CampingLockers",
        "Hunter",
        "HuntingLockers",
        "RangerTools",
    },

    -- =========================================================
    -- ELECTRONIC
    -- Electronics stores and tech containers
    -- =========================================================
    ELECTRONIC = {
        "ElectronicStoreAppliances",
        "ElectronicStoreHAMRadio",
        "ElectronicStoreMisc",
        "ElectronicStoreCases",
        "ElectronicStoreComputers",
        "ElectronicStorePhones",
        "ElectronicStoreLights",
        "GigamartHouseElectronics",
        "GigamartLightbulb",
        "StoreShelfElectronics",
        "CrateGenerator",
        "GeneratorRoom",
        "ElectricianTools",
        "WireFactoryElectric",
    },

    -- =========================================================
    -- MEDICAL
    -- Medical and hospital storage
    -- =========================================================
    MEDICAL = {
        "MedicalStorageDrugs",
        "MedicalStorageTools",
        "MedicalClinicTools",
        "HospitalLockers",
        "ArmyBunkerMedical",
        "SafehouseMedical",
    },

    -- =========================================================
    -- INDUSTRIAL
    -- Workshops, factories and industrial storage
    -- =========================================================
    INDUSTRIAL = {
        "FactoryLockers",
        "GarageMechanics",
        "GigamartTools",
        "ToolStoreTools",
        "ToolStoreMisc",
        "ToolFactoryTools",
        "GarageTools",
        "MetalShopTools",
        "WeldingWorkshopTools",
        "CabinetFactoryTools",
        "WireFactoryTools",
        "RailYardTools",
        "BarnTools",
        "ConstructionWorkerTools",
    },

    -- =========================================================
    -- MECHANIC
    -- Auto shops and car-part stores
    -- (ideal for car-battery-related items)
    -- =========================================================
    MECHANIC = {
        "CarSupplyBatteries",
        "CarSupplyTools",
        "CarSupplyGasCans",
        "MechanicShelfElectric",
        "MechanicShelfTools",
        "MechanicShelfMisc",
        "MechanicSpecial",
        "MechanicTools",
        "CrateMechanics",
        "StoreShelfMechanics",
        "ToolCabinetMechanics",
        "GarageMechanics",
    },

    -- =========================================================
    -- CRATES
    -- Generic storage crates
    -- =========================================================
    CRATES = {
        "CrateElectronics",
        "CrateFishing",
        "CrateCamping",
        "CrateFarming",
        "CrateBatteries",
        "CrateTools",
        "CrateToolsOld",
        "CrateMechanics",
        "CrateMetalLockers",
        "CrateOfficeSupplies",
        "GroceryStorageCrate1",
        "GroceryStorageCrate2",
        "GroceryStorageCrate3",
    },

    -- =========================================================
    -- SPECIAL
    -- Special and rare locations (includes mid/late-phase safehouses:
    -- curated loot the engine places in shelters)
    -- =========================================================
    SPECIAL = {
        "SafehouseArmor",
        "SafehouseArmor_Mid",
        "SafehouseArmor_Late",
        "SafehouseLighting",
        "SafehouseLighting_Late",
        "PostOfficeBoxes",
        "PawnShopCases",
        "PawnShopTools",
        "GunStoreCounter",
        "GunStoreCases",
        "SchoolLockers",
    },

    -- =========================================================
    -- STORES
    -- General stores and big-box stores
    -- =========================================================
    STORES = {
        "GigamartHousewares",
        "GigamartBBQ",
        "WildWestGeneralStore",
        "GardenStoreMisc",
        "GardenStoreTools",
        "GrillStoreBlackBBQ",
        "GrillStoreRedBBQ",
        "FishingStoreGear",
        "FishingStoreBait",
    },

    -- =========================================================
    -- BREAKROOM
    -- Break rooms and offices
    -- =========================================================
    BREAKROOM = {
        "BreakRoomCounter",
        "BreakRoomShelves",
        "OfficeShelfSupplies",
    },

    -- =========================================================
    -- BAR
    -- Bars, theatres and entertainment
    -- =========================================================
    BAR = {
        "BarCounterMisc",
        "BarShelfLiquor",
        "TheatreDrinks",
        "TheatreSnacks",
    },

    -- =========================================================
    -- FRIDGE
    -- Residential and commercial refrigerators
    -- =========================================================
    FRIDGE = {
        "FridgeGeneric",
        "FridgeRich",
        "FridgeOther",
        "FridgeTrailerPark",
        "FridgeBeer",
        "FridgeBottles",
        "FridgeBreakRoom",
        "FridgeDrugLab",
        "FridgeFarmStorage",
        "FridgeGarage",
        "FridgeMedical",
        "FridgeOffice",
        "FridgeSnacks",
        "FridgeSoda",
        "FridgeVIPLounge",
        "FridgeWater",
        "FridgeHoarder",
        "FridgeHunter",
        "BackstageFridge",
        "BakeryKitchenFridge",
        "BandPracticeFridge",
        "BurgerKitchenFridge",
        "CafeDiningFridge",
        "CafeKitchenFridge",
        "CafeteriaKitchenFridge",
        "CatfishKitchenFridge",
        "ChineseKitchenFridge",
        "CrepeKitchenFridge",
        "DeepFryKitchenFridge",
        "DinerKitchenFridge",
        "FishChipsKitchenFridge",
        "HospitalRoomFridge",
        "ItalianKitchenFridge",
        "JaysKitchenFridge",
        "JuiceStandFridge",
        "MexicanKitchenFridge",
        "MotelFridge",
        "NolansFridge",
        "PizzaKitchenFridge",
        "RestaurantKitchenFridge",
        "SafehouseFridge",
        "SafehouseFridge_Mid",
        "SafehouseFridge_Late",
        "SeafoodKitchenFridge",
        "SpiffosKitchenFridge",
        "SushiKitchenFridge",
        "UniversityFridge",
        "WesternKitchenFridge",
    },

    -- =========================================================
    -- FREEZER
    -- Residential and commercial freezers
    -- =========================================================
    FREEZER = {
        "FreezerGeneric",
        "FreezerRich",
        "FreezerTrailerPark",
        "FreezerDrugLab",
        "FreezerFarmStorage",
        "FreezerGarage",
        "FreezerHoarder",
        "FreezerHunter",
        "FreezerFrozenFood",
        "FreezerIceCream",
        "CrateChestFreezer",
        "ArenaKitchenFreezer",
        "BakeryKitchenFreezer",
        "BurgerKitchenFreezer",
        "ButcherFreezer",
        "CafeteriaKitchenFreezer",
        "CatfishKitchenFreezer",
        "ChineseKitchenFreezer",
        "DeepFryKitchenFreezer",
        "DinerKitchenFreezer",
        "FishChipsKitchenFreezer",
        "ItalianKitchenFreezer",
        "JaysKitchenFreezer",
        "MexicanKitchenFreezer",
        "PizzaKitchenFreezer",
        "RestaurantKitchenFreezer",
        "SafehouseFreezer",
        "SafehouseFreezer_Mid",
        "SafehouseFreezer_Late",
        "SeafoodKitchenFreezer",
        "SpiffosKitchenFreezer",
        "SushiKitchenFreezer",
        "TheatreKitchenFreezer",
        "WesternKitchenFreezer",
    },

    -- =========================================================
    -- STOVE
    -- Residential and commercial stoves
    -- =========================================================
    STOVE = {
        "StoveGeneric",
        "StoveClassy",
        "StoveRedneck",
        "StoveSpiffos",
        "DerelictHouseStove",
        "SafehouseStove",
        "SafehouseStove_Mid",
        "SafehouseStove_Late",
        "WildWestWoodStove",
        "CrateAntiqueStove",
    },

    -- =========================================================
    -- KITCHEN
    -- Kitchens (utensils, dishes, basic storage)
    -- =========================================================
    KITCHEN = {
        "ArenaKitchenCutlery",
        "ArmyBunkerKitchen",
        "BakeryKitchenBaking",
        "BakeryKitchenCutlery",
        "BakeryKitchenStorage",
        "BurgerKitchenCutlery",
        "CafeKitchenSupplies",
        "ChineseKitchenBaking",
        "ChineseKitchenCutlery",
        "CrepeKitchenBaking",
        "ItalianKitchenBaking",
        "JaysKitchenBaking",
        "KitchenBaking",
        "KitchenBreakfast",
        "KitchenDishes",
        "KitchenPots",
        "KitchenRandom",
        "MexicanKitchenBaking",
        "MexicanKitchenButcher",
        "MexicanKitchenSauce",
        "PizzaKitchenBaking",
        "SpiffosKitchenBaking",
        "SpiffosKitchenSpecial",
        "StoreKitchenBaking",
        "StoreKitchenCutlery",
        "StoreKitchenPots",
        "SushiKitchenBaking",
        "SushiKitchenCutlery",
        "WesternKitchenBaking",
        "WildWestKitchen",
    },

    -- =========================================================
    -- KITCHEN_SAUCES
    -- Kitchens (sauces, meats, specific goods)
    -- =========================================================
    KITCHEN_SAUCES = {
        "ArenaKitchenSauce",
        "BurgerKitchenSauce",
        "BurgerKitchenButcher",
        "CafeKitchenCoffee",
        "CatfishKitchenButcher",
        "ChineseKitchenSauce",
        "ChineseKitchenButcher",
        "DinerBackRoomCounter",
        "FishChipsKitchenSauce",
        "FishChipsKitchenButcher",
        "ItalianKitchenSauce",
        "ItalianKitchenButcher",
        "JaysKitchenSauce",
        "JaysKitchenButcher",
        "KitchenBottles",
        "KitchenCannedFood",
        "KitchenDryFood",
        "PizzaKitchenSauce",
        "PizzaKitchenButcher",
        "PizzaKitchenCheese",
        "SeafoodKitchenSauce",
        "SeafoodKitchenButcher",
        "SpiffosKitchenSauce",
        "SpiffosKitchenButcher",
        "StoreKitchenSauce",
        "StoreKitchenButcher",
        "StoreKitchenCafe",
        "StoreKitchenDishes",
        "SushiKitchenSauce",
        "SushiKitchenButcher",
        "WesternKitchenSauce",
        "WesternKitchenButcher",
    },

    -- =========================================================
    -- CAFETERIA
    -- Cafeterias and dining spaces
    -- =========================================================
    CAFETERIA = {
        "CafeteriaDrinks",
        "CafeteriaSnacks",
    },

    -- =========================================================
    -- SAFEHOUSE_FOOD
    -- Shelters (food and supplies, includes mid/late phases)
    -- =========================================================
    SAFEHOUSE_FOOD = {
        "SafehouseFood",
        "SafehouseFood_Mid",
        "SafehouseFood_Late",
    },

}

-- ==========================================================================
-- COMBINED GROUPS
-- A combo expands to the union of several KRCore.LOC groups (automatic dedupe
-- in KRCore_Server). Used with the same name in dist.add():
--     KRCore.dist.add("Base.MyItem", { POWER = 0.2 })
-- ==========================================================================

KRCore.COMBO = {

    -- Electronics + mechanic shops: everything power-, battery- and
    -- appliance-related (ideal for KR SolarOS)
    POWER = { "ELECTRONIC", "MECHANIC" },

    -- Military + survival: field gear (ideal for KR TacticalOS)
    TACTICAL = { "MILITARY", "SURVIVAL" },

    -- Fridges + freezers: all cold storage (ideal for KR FoodOS)
    COLD_STORAGE = { "FRIDGE", "FREEZER" },

    -- Kitchens + stoves: the whole cooking environment
    COOKING = { "KITCHEN", "STOVE" },

}
