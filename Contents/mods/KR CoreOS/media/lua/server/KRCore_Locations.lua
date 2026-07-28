-- ==========================================================================
-- KR CoreOS - Location Groups v1.1.0 B41.78.7 (Server)
-- Copyright (C) 2026 D4RK-C0MP4N1. Licensed under the MIT License (see LICENSE).
-- ==========================================================================
--
-- Defines the location groups (ProceduralDistributions containers) that the
-- KR mods use to register their items.
--
-- Container reference: ProceduralDistributions.lua (B41.78.7)
-- Locations that don't exist in the current game version are skipped silently
-- in KRCore_Server (processDistributions).
-- ==========================================================================

KRCore.LOC = {

    -- =========================================================
    -- MILITARY
    -- Military, police and fire storage
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
        "ArmyBunkerLockers",     -- B42
        "ArmyBunkerStorage",     -- B42
        "PoliceStorageMechanics",
        "PoliceLockers",
        "FireStorageTools",
        "MilitaryPoliceLockers", -- B41
        "SecurityLockers",       -- B42
        "PrisonGuardLockers",    -- B42
        "RangerLockers",         -- B42
    },

    -- =========================================================
    -- SURVIVAL
    -- Camping stores and survival gear
    -- =========================================================
    SURVIVAL = {
        "SurvivalGear",
        "CampingStoreGear",
        "CampingStoreTools",
        "CampingStoreLighting",  -- B42
        "CampingStoreCases",     -- B42
        "CampingStoreBackpacks",
        "CampingLockers",        -- B42
        "Hunter",
        "HuntingLockers",        -- B42
        "RangerTools",           -- B42
    },

    -- =========================================================
    -- ELECTRONIC
    -- Electronics stores and tech containers
    -- =========================================================
    ELECTRONIC = {
        "ElectronicsStoreAppliances",  -- B41: "ElectronicsStore..." (with 's'), B42: "ElectronicStore..."
        "ElectronicStoreAppliances",   -- B42 coverage
        "ElectronicStoreHAMRadio",
        "ElectronicStoreMisc",
        "ElectronicStoreCases",
        "ElectronicStoreComputers",
        "ElectronicStorePhones",
        "GigamartHouseElectronics",
        "GigamartLightbulb",        -- B42
        "StoreShelfElectronics",
        "ElectronicStoreLights",    -- B42
        "CrateGenerator",
        "GeneratorRoom",
        "ElectricianTools",         -- B42
        "WireFactoryElectric",      -- B42
    },

    -- =========================================================
    -- MEDICAL
    -- Medical and hospital storage
    -- =========================================================
    MEDICAL = {
        "MedicalStorageDrugs",
        "MedicalStorageTools",
        "MedicalClinicTools",   -- B42
        "HospitalLockers",
        "ArmyBunkerMedical",    -- B42
        "SafehouseMedical",     -- B42
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
        "ToolFactoryTools",         -- B42
        "GarageTools",
        "MetalShopTools",
        "WeldingWorkshopTools",     -- B42
        "CabinetFactoryTools",      -- B42
        "WireFactoryTools",         -- B42
        "RailYardTools",            -- B42
        "BarnTools",                -- B42
        "ConstructionSite",         -- B41
        "ConstructionWorkerTools",  -- B42
        "WarehouseMetalShelves",    -- B41
    },

    -- =========================================================
    -- MECHANIC
    -- Auto shops and car-part stores
    -- (ideal for car-battery-related items)
    -- =========================================================
    MECHANIC = {
        "CarSupplyBatteries",    -- B42
        "CarSupplyTools",        -- B42
        "CarSupplyGasCans",      -- B42
        "MechanicShelfElectric",
        "MechanicShelfTools",
        "MechanicShelfMisc",
        "MechanicSpecial",
        "MechanicTools",
        "CrateMechanics",
        "StoreShelfMechanics",
        "ToolCabinetMechanics",  -- B42
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
        "CrateToolsOld",       -- B42
        "CrateMechanics",
        "CrateMetalLockers",   -- B42
        "CrateOfficeSupplies", -- B42
        "GroceryStorageCrate1",
        "GroceryStorageCrate2",
        "GroceryStorageCrate3",
    },

    -- =========================================================
    -- SPECIAL
    -- Special and rare locations
    -- =========================================================
    SPECIAL = {
        "SafehouseArmor",
        "SafehouseArmor_Mid",     -- B42
        "SafehouseArmor_Late",    -- B42
        "SafehouseLighting",      -- B42
        "SafehouseLighting_Late", -- B42
        "PostOfficeBoxes",
        "PawnShopCases",
        "PawnShopTools",
        "GunStoreCounter",
        "GunStoreCases",          -- B42
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
    -- Residential and commercial refrigerators (includes B41 and B42 variants)
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
    -- Residential and commercial freezers (includes B41 and B42 variants)
    -- =========================================================
    FREEZER = {
        "FreezerGeneric",
        "FreezerRich",
        "FreezerOther",
        "FreezerTrailerPark",
        "FreezerDrugLab",
        "FreezerFarmStorage",
        "FreezerGarage",
        "FreezerHoarder",
        "FreezerHunter",
        "FreezerFrozenFood",
        "FreezerIceCream",
        -- B41 variants that don't exist in B42 (skipped silently on B42):
        "FreezerBeer",
        "FreezerBottles",
        "FreezerBreakRoom",
        "FreezerMedical",
        "FreezerOffice",
        "FreezerSnacks",
        "FreezerSoda",
        "FreezerVIPLounge",
        "FreezerWater",
        "BackstageFreezer",
        "BandPracticeFreezer",
        "CafeDiningFreezer",
        "CafeKitchenFreezer",
        "CrepeKitchenFreezer",
        "HospitalRoomFreezer",
        "MotelFreezer",
        "NolansFreezer",
        "UniversityFreezer",
        -- B42 variants:
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
        "MexicanKitchenStove",  -- B41
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
    -- Shelters (food and supplies)
    -- =========================================================
    SAFEHOUSE_FOOD = {
        "SafehouseFood",
        "SafehouseFood_Mid",   -- B42
        "SafehouseFood_Late",  -- B42
        "HoarderKitchenFood",  -- B41
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
