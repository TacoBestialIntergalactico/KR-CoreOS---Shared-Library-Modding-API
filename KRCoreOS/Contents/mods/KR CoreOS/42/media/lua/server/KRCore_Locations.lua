-- ==========================================================================
-- KR CoreOS - Grupos de Ubicaciones v1.1.0 B42 (Servidor)
-- Copyright (C) 2026 D4RK-C0MP4N1. Licensed under the MIT License (see LICENSE).
-- ==========================================================================
--
-- Define los grupos de ubicaciones (containers de ProceduralDistributions)
-- que los mods KR usan para registrar sus items.
--
-- Todos los nombres verificados contra ProceduralDistributions.lua de la
-- instalación B42.19. Los que no existan en versiones futuras se omiten
-- silenciosamente en KRCore_Server (processDistributions).
--
-- KRCore.COMBO (al final) define grupos combinados: un nombre que expande a
-- la unión de varios grupos de KRCore.LOC, con dedupe automático. Se usan
-- igual que un grupo normal en KRCore.dist.add().
-- ==========================================================================

KRCore.LOC = {

    -- =========================================================
    -- MILITARY
    -- Almacenes militares, policiales, prisiones y seguridad
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
    -- Tiendas de camping, caza y equipo de supervivencia
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
    -- Tiendas de electrónica y contenedores tecnológicos
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
    -- Almacenes médicos y hospitalarios
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
    -- Talleres, fábricas y almacenes industriales
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
    -- Talleres mecánicos y tiendas de repuestos de coche
    -- (ideal para items relacionados con baterías de coche)
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
    -- Cajas de almacenamiento genéricas
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
    -- Ubicaciones especiales y raras (incluye safehouses de fases
    -- media/tardía: loot curado que el engine coloca en refugios)
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
    -- Neveras residenciales y comerciales
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
    -- Congeladores residenciales y comerciales
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
    -- Refugios (comida y suministros, incluye fases media/tardía)
    -- =========================================================
    SAFEHOUSE_FOOD = {
        "SafehouseFood",
        "SafehouseFood_Mid",
        "SafehouseFood_Late",
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
