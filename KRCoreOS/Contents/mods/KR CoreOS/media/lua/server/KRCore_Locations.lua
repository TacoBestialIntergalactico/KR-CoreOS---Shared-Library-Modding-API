-- ==========================================================================
-- KR CoreOS - Grupos de Ubicaciones v1.1.0 B41.78.7 (Servidor)
-- Copyright (C) 2026 D4RK-C0MP4N1. Licensed under the MIT License (see LICENSE).
-- ==========================================================================
--
-- Define los grupos de ubicaciones (containers de ProceduralDistributions)
-- que los mods KR usan para registrar sus items.
--
-- Referencia de containers: ProceduralDistributions.lua (B41.78.7)
-- Las ubicaciones que no existen en la versión actual del juego se omiten
-- silenciosamente en KRCore_Server (processDistributions).
-- ==========================================================================

KRCore.LOC = {

    -- =========================================================
    -- MILITARY
    -- Almacenes militares, policiales y bomberos
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
    -- Tiendas de camping y equipo de supervivencia
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
    -- Tiendas de electrónica y contenedores tecnológicos
    -- =========================================================
    ELECTRONIC = {
        "ElectronicsStoreAppliances",  -- B41: "ElectronicsStore..." (con 's'), B42: "ElectronicStore..."
        "ElectronicStoreAppliances",   -- cobertura B42
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
    -- Almacenes médicos y hospitalarios
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
    -- Talleres, fábricas y almacenes industriales
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
    -- Talleres mecánicos y tiendas de repuestos de coche
    -- (ideal para items relacionados con baterías de coche)
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
    -- Cajas de almacenamiento genéricas
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
    -- Ubicaciones especiales y raras
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
    -- Tiendas generales y grandes superficies
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
    -- Salas de descanso y oficinas
    -- =========================================================
    BREAKROOM = {
        "BreakRoomCounter",
        "BreakRoomShelves",
        "OfficeShelfSupplies",
    },

    -- =========================================================
    -- BAR
    -- Bares, teatros y entretenimiento
    -- =========================================================
    BAR = {
        "BarCounterMisc",
        "BarShelfLiquor",
        "TheatreDrinks",
        "TheatreSnacks",
    },

    -- =========================================================
    -- FRIDGE
    -- Neveras residenciales y comerciales (incluye variantes B41 y B42)
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
    -- Congeladores residenciales y comerciales (incluye variantes B41 y B42)
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
        -- Variantes B41 que no existen en B42 (se omiten silenciosamente en B42):
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
        -- Variantes B42:
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
    -- Estufas residenciales y comerciales
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
    -- Cocinas (utensilios, vajilla, almacenamiento básico)
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
    -- Cocinas (salsas, carnes, productos específicos)
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
    -- Cafeterías y espacios de comedor
    -- =========================================================
    CAFETERIA = {
        "CafeteriaDrinks",
        "CafeteriaSnacks",
    },

    -- =========================================================
    -- SAFEHOUSE_FOOD
    -- Refugios (comida y suministros)
    -- =========================================================
    SAFEHOUSE_FOOD = {
        "SafehouseFood",
        "SafehouseFood_Mid",   -- B42
        "SafehouseFood_Late",  -- B42
        "HoarderKitchenFood",  -- B41
    },

}

-- ==========================================================================
-- GRUPOS COMBINADOS
-- Un combo expande a la unión de varios grupos de KRCore.LOC (dedupe
-- automático en KRCore_Server). Se usan con el mismo nombre en dist.add():
--     KRCore.dist.add("Base.MiItem", { POWER = 0.2 })
-- ==========================================================================

KRCore.COMBO = {

    -- Electrónica + talleres mecánicos: todo lo relacionado con energía,
    -- baterías y aparatos (ideal para KR SolarOS)
    POWER = { "ELECTRONIC", "MECHANIC" },

    -- Militar + supervivencia: equipamiento de campo (ideal para KR TacticalOS)
    TACTICAL = { "MILITARY", "SURVIVAL" },

    -- Neveras + congeladores: todo almacenamiento en frío (ideal para KR FoodOS)
    COLD_STORAGE = { "FRIDGE", "FREEZER" },

    -- Cocinas + estufas: todo el entorno de cocina
    COOKING = { "KITCHEN", "STOVE" },

}
