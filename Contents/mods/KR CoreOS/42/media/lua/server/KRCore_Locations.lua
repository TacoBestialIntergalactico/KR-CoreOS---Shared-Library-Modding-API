-- ==========================================================================
-- KR CoreOS - Location Groups v1.2.1 B42.20.0 (Server)
-- Copyright (C) 2026 D4RK-C0MP4N1. Licensed under the MIT License (see LICENSE).
-- ==========================================================================
--
-- Defines the location groups (ProceduralDistributions containers) that the
-- KR mods use to register their items.
--
-- All names verified against ProceduralDistributions.lua from the B42.20.0
-- install (full container coverage: every B42.20.0 loot table is grouped). 
--
-- Names that don't exist in future versions are skipped silently in
-- KRCore_Server (processDistributions).
--
-- KRCore.COMBO (at the end) defines combined groups: a name that expands to
-- the union of several KRCore.LOC groups, with automatic dedupe. Used just
-- like a normal group in KRCore.dist.add().
--
-- ==========================================================================

KRCore.LOC = {

    -- =========================================================
    -- ARMY
    -- Armed-forces storage: bases, bunkers, hangars and surplus stores
    -- =========================================================
    ARMY = {
        "ArmyStorageElectronics",
        "ArmyStorageOutfit",
        "ArmyStorageMedical",
        "ArmyHangarTools",
        "ArmyHangarMechanics",
        "ArmyBunkerLockers",
        "ArmyBunkerStorage",
        "ArmySurplusTools",
        "ArmySurplusMisc",
        "ArmySurplusCases",
        "ArmySurplusBackpacks",
        "ArmySurplusSnacks",
        "ArmySurplusWater",
    },

    -- =========================================================
    -- POLICE
    -- Police stations and sheriff's offices (lockers, evidence)
    -- =========================================================
    POLICE = {
        "PoliceTools",
        "PoliceStateTools",
        "PoliceStorageMechanics",
        "PoliceLockers",
        "PoliceCaptainCabinet",
        "PoliceEvidence",
        "WildWestSheriffLocker",
    },

    -- =========================================================
    -- PRISON
    -- Prison cells, intake and guard/riot storage
    -- =========================================================
    PRISON = {
        "PrisonGuardLockers",
        "PrisonCellRandom",
        "PrisonCellRandomClassy",
        "PrisonIntakeLockers",
        "PrisonIntakePersonalObjects",
        "PrisonRiotStorage",
    },

    -- =========================================================
    -- SECURITY
    -- Private / building security storage
    -- =========================================================
    SECURITY = {
        "SecurityLockers",
        "SecurityStorage",
    },

    -- =========================================================
    -- FIREFIGHTER
    -- Fire department stations (lockers and tools)
    -- =========================================================
    FIREFIGHTER = {
        "FireStorageTools",
        "FireDeptLockers",
        "FiremanTools",
        "ForestFireTools",
    },

    -- =========================================================
    -- SURVIVAL_CAMPING
    -- Camping and hiking gear stores
    -- =========================================================
    SURVIVAL_CAMPING = {
        "SurvivalGear",
        "CampingStoreGear",
        "CampingStoreTools",
        "CampingStoreLighting",
        "CampingStoreCases",
        "CampingStoreBackpacks",
        "CampingStoreSleepingBags",
        "CampingStoreTents",
        "CampingLockers",
        "Hiker",
    },

    -- =========================================================
    -- SURVIVAL_HUNTING
    -- Hunting, trapping, fishing and park-ranger gear
    -- =========================================================
    SURVIVAL_HUNTING = {
        "FishingStoreGear",
        "FishingStoreBait",
        "SafehouseTraps",
        "Hunter",
        "HuntingLockers",
        "Trapper",
        "FishingLockers",
        "RangerTools",
        "RangerStorageTraps",
        "RangerLockers",
        "FishermanTools",
    },

    -- =========================================================
    -- ELECTRONIC_GENERAL
    -- Electronics-store shelves, home appliances, lights, TVs and music
    -- =========================================================
    ELECTRONIC_GENERAL = {
        "ElectronicStoreAppliances",
        "ElectronicStoreMisc",
        "ElectronicStoreCases",
        "ElectronicStoreLights",
        "ElectronicStoreMusic",
        "GigamartHouseElectronics",
        "GigamartLightbulb",
        "StoreShelfElectronics",
        "CarLightbars",
    },

    -- =========================================================
    -- ELECTRONIC_COMPUTER
    -- Computers: stores, cyber cafes and university/library computer labs
    -- =========================================================
    ELECTRONIC_COMPUTER = {
        "ElectronicStoreComputers",
        "CyberCafeDesk",
        "CyberCafeFilingCabinet",
        "LibraryComputer",
        "UniversityDesk_Computer",
        "UniversityFilingCabinet_Computer",
        "UniversityLibraryComputer",
    },

    -- =========================================================
    -- ELECTRONIC_PHONE
    -- Phones
    -- =========================================================
    ELECTRONIC_PHONE = {
        "ElectronicStorePhones",
    },

    -- =========================================================
    -- ELECTRONIC_RADIO
    -- HAM radio, radio components and electrical wire
    -- =========================================================
    ELECTRONIC_RADIO = {
        "ElectronicStoreHAMRadio",
        "RadioFactoryComponents",
        "WireFactoryElectric",
    },

    -- =========================================================
    -- ELECTRONIC_POWER
    -- Generators, generator rooms and electrician gear
    -- (ideal home for KR SolarOS power devices)
    -- =========================================================
    ELECTRONIC_POWER = {
        "GeneratorRoom",
        "ElectricianTools",
    },

    -- =========================================================
    -- MEDICAL_HOSPITAL
    -- Hospital and medical-office facilities (rooms, lockers, laundry, bins)
    -- =========================================================
    MEDICAL_HOSPITAL = {
        "HospitalLockers",
        "HospitalRoomCleaning",
        "HospitalRoomCounter",
        "HospitalRoomShelves",
        "BinHospital",
        "LaundryHospital",
        "MedicalOfficeCounter",
        "MedicalOfficeDesk",
    },

    -- =========================================================
    -- MEDICAL_TOOLS
    -- Medical instruments and supplies (doctor, nurse, ambulance, morgue,
    -- clinic/storage tools, military and university medical)
    -- =========================================================
    MEDICAL_TOOLS = {
        "MedicalStorageTools",
        "MedicalClinicTools",
        "NurseTools",
        "AmbulanceDriverTools",
        "DoctorTools",
        "MorgueTools",
        "ArmyBunkerMedical",
        "UniversityDesk_Medical",
        "UniversityFilingCabinet_Medical",
    },

    -- =========================================================
    -- MEDICAL_PHARMACY
    -- Medications and drugstore retail (drug storage, cabinets, pharmacy shelves)
    -- =========================================================
    MEDICAL_PHARMACY = {
        "MedicalStorageDrugs",
        "MedicalClinicDrugs",
        "MedicalCabinet",
        "PharmacyCosmetics",
        "StoreShelfMedical",
    },

    -- =========================================================
    -- MEDICAL_OPTOMETRY
    -- Optometrists and eyewear
    -- =========================================================
    MEDICAL_OPTOMETRY = {
        "OptometristDesk",
        "OptometristGlasses",
        "PharmacyGlasses",
    },

    -- =========================================================
    -- MEDICAL_SAFEHOUSE
    -- Survivor-shelter medical caches (mid/late phases)
    -- =========================================================
    MEDICAL_SAFEHOUSE = {
        "SafehouseMedical",
        "SafehouseMedical_Mid",
        "SafehouseMedical_Late",
    },

    -- =========================================================
    -- MEDICAL_DRUGLAB
    -- Illicit drug production: labs, drug shacks and stashes
    -- =========================================================
    MEDICAL_DRUGLAB = {
        "DerelictHouseDrugs",
        "DrugLabMoney",
        "DrugLabSupplies",
        "DrugShackDrugs",
        "DrugShackMisc",
        "DrugShackTools",
        "DrugShackWeapons",
    },

    -- =========================================================
    -- INDUSTRIAL_TOOLS
    -- General hardware/tool stores, tool cabinets and factory tool caches
    -- =========================================================
    INDUSTRIAL_TOOLS = {
        "PawnShopTools",
        "FactoryLockers",
        "GigamartTools",
        "ToolStoreTools",
        "ToolStoreMisc",
        "ToolStoreAccessories",
        "ToolStoreHandles",
        "ToolStoreKeymaking",
        "ToolFactoryTools",
        "ToolFactoryHandles",
        "GarageTools",
        "EngineerTools",
        "ConstructionWorkerTools",
        "BarnTools",
        "RailYardTools",
        "CabinetFactoryTools",
        "WireFactoryTools",
        "LoggingFactoryTools",
        "BurglarTools",
        "AnthropologyDisplayTools",
        "MedievalTools",
    },

    -- =========================================================
    -- INDUSTRIAL_METALWORK
    -- Blacksmithing, welding, metalworking and wire
    -- =========================================================
    INDUSTRIAL_METALWORK = {
        "BlacksmithMolds",
        "BlacksmithTools",
        "WildWestBlacksmith",
        "MetalShopTools",
        "MetalWorkerTools",
        "WeldingWorkshopTools",
        "WeldingWorkshopFuel",
        "WeldingWorkshopMetal",
        "ToolStoreMetalwork",
        "ToolFactoryBarStock",
        "ToolFactoryIngots",
        "ToolFactorySawBlades",
        "RailYardSpikes",
        "WireFactoryBarbed",
        "WireFactoryBasic",
    },

    -- =========================================================
    -- INDUSTRIAL_WOODWORK
    -- Carpentry, carving and furniture making
    -- =========================================================
    INDUSTRIAL_WOODWORK = {
        "CarpenterTools",
        "CarvingWorkshopMaterials",
        "CarvingWorkshopTools",
        "FurnitureFactoryTools",
        "ToolStoreCarpentry",
    },

    -- =========================================================
    -- INDUSTRIAL_CRAFTS
    -- Artisan trades: cobbler, jeweler, clockwork, leather, pottery, glass,
    -- tailoring, sewing, painting, mannequins and dye
    -- =========================================================
    INDUSTRIAL_CRAFTS = {
        "CobblerTools",
        "JewelerTools",
        "ClockRepairTools",
        "LeatherworkingTools",
        "PotteryStudioTools",
        "GlassWorkshopTools",
        "TailoringTools",
        "SewingStoreTools",
        "PaintStudioTools",
        "ToolStorePaint",
        "MannequinFactoryPaint",
        "MannequinFactoryTools",
        "KnappingTools",
    },

    -- =========================================================
    -- INDUSTRIAL_FACTORY
    -- Product factories: food processing, knives, bats, golf, sinks
    -- =========================================================
    INDUSTRIAL_FACTORY = {
        "BatFactoryBats",
        "DogFoodFactoryBags",
        "DogFoodFactoryBones",
        "DogFoodFactoryCans",
        "DogFoodFactoryEquipment",
        "FryFactoryPotatoes",
        "GolfFactoryTools",
        "JerkyFactoryMeat",
        "JerkyFactorySpices",
        "JerkyFactoryTools",
        "KnifeFactoryHandles",
        "KnifeFactoryMeatCleaver",
        "KnifeFactoryMeatCleaverBlades",
        "KnifeFactorySushiKnife",
        "KnifeFactoryTools",
    },

    -- =========================================================
    -- MECHANIC
    -- Auto shops and car-part stores
    -- (ideal for car-battery-related items)
    -- =========================================================
    MECHANIC = {
        "CarSupplyBatteries",
        "CarSupplyTools",
        "MechanicShelfElectric",
        "MechanicShelfTools",
        "MechanicShelfMisc",
        "MechanicSpecial",
        "MechanicTools",
        "StoreShelfMechanics",
        "ToolCabinetMechanics",
        "GarageMechanics",
        "GarageCarpentry",
        "GarageMetalwork",
        "CarDealerDesk",
        "CarDealerFilingCabinet",
        "FireStorageMechanics",
    },

    -- =========================================================
    -- MECHANIC_CARPARTS
    -- Replacement car parts: brakes, mufflers, suspension, tires, windows
    -- =========================================================
    MECHANIC_CARPARTS = {
        "CarBrakesModern1",
        "CarBrakesModern2",
        "CarBrakesModern3",
        "CarBrakesNormal1",
        "CarBrakesNormal2",
        "CarBrakesNormal3",
        "CarMufflerModern1",
        "CarMufflerModern2",
        "CarMufflerModern3",
        "CarMufflerNormal1",
        "CarMufflerNormal2",
        "CarMufflerNormal3",
        "CarSuspensionModern1",
        "CarSuspensionModern2",
        "CarSuspensionModern3",
        "CarSuspensionNormal1",
        "CarSuspensionNormal2",
        "CarSuspensionNormal3",
        "CarTiresModern1",
        "CarTiresModern2",
        "CarTiresModern3",
        "CarTiresNormal1",
        "CarTiresNormal2",
        "CarTiresNormal3",
        "CarWindows1",
        "CarWindows2",
        "CarWindows3",
        "MechanicShelfBrakes",
        "MechanicShelfMufflers",
        "MechanicShelfSuspension",
        "MechanicShelfWheels",
    },

    -- =========================================================
    -- MECHANIC_FUEL
    -- Fuel and gas storage (cans, pumps, garage gas stores)
    -- =========================================================
    MECHANIC_FUEL = {
        "CarSupplyGasCans",
        "GasStorageCombo",
        "GasStorageMechanics",
        "LaboratoryGasStorage",
    },

    -- =========================================================
    -- CRATES_CANFOOD
    -- Crates of canned/preserved food and humanitarian aid
    -- =========================================================
    CRATES_CANFOOD = {
        "CrateCannedFood",
        "CrateCannedFoodSpoiled",
        "CrateCannedTomato",
        "CrateTomatoPaste",
        "CrateHumanitarian",
    },

    -- =========================================================
    -- CRATES_FOOD
    -- Crates of dry food, baking, snacks, condiments and pantry goods
    -- =========================================================
    CRATES_FOOD = {
        "CrateBakingSoda",
        "CrateBunsBurger",
        "CrateBunsHotdog",
        "CrateButter",
        "CrateCandyPackage",
        "CrateCereal",
        "CrateChips",
        "CrateChocolate",
        "CrateChocolateChips",
        "CrateCocoaPowder",
        "CrateCoffee",
        "CrateCondiments",
        "CrateConesIceCream",
        "CrateCornflour",
        "CrateCrackers",
        "CrateEggs",
        "CrateFlour",
        "CrateGrahamCrackers",
        "CrateGravyMix",
        "CrateGum",
        "CrateHotsauce",
        "CrateMacaroni",
        "CrateMapleSyrup",
        "CrateMarinara",
        "CrateMarshmallows",
        "CrateOilOlive",
        "CrateOilVegetable",
        "CratePancakeMix",
        "CratePasta",
        "CratePeanuts",
        "CratePopcorn",
        "CrateRice",
        "CrateRiceVinegar",
        "CrateSeaweed",
        "CrateSoysauce",
        "CrateSugar",
        "CrateSugarBrown",
        "CrateTacoShells",
        "CrateTea",
        "CrateTortillaChips",
        "CrateYeast",
        "GroceryStorageCrate1",
        "GroceryStorageCrate2",
        "GroceryStorageCrate3",
        "JerkyFactoryCrate",
    },

    -- =========================================================
    -- CRATES_DRINKS
    -- Crates of soft drinks and water
    -- =========================================================
    CRATES_DRINKS = {
        "CrateCoke",
        "CrateSodaBottles",
        "CrateSodaCans",
        "CrateWaterBottle",
        "CrateWaterDispenserBottle",
    },

    -- =========================================================
    -- CRATES_LIQUOR
    -- Crates of beer, wine and liquor
    -- =========================================================
    CRATES_LIQUOR = {
        "CrateBeer",
        "CrateLiquor",
        "CrateWine",
    },

    -- =========================================================
    -- CRATES_KITCHEN
    -- Crates of kitchenware: dishes, trays, napkins, bags and cups
    -- =========================================================
    CRATES_KITCHEN = {
        "CrateDishes",
        "CrateFountainCups",
        "CrateNapkins",
        "CratePaperBagJays",
        "CratePaperNapkins",
        "CratePlasticTrays",
    },

    -- =========================================================
    -- CRATES_APPLIANCES
    -- Crates of appliances: ovens, stove, freezer, espresso machine
    -- =========================================================
    CRATES_APPLIANCES = {
        "CrateAntiqueStove",
        "CrateChestFreezer",
        "CrateEspressoMachine",
        "CrateGreenOven",
        "CrateGreyOven",
        "CrateModernOven",
        "CrateRedOven",
    },

    -- =========================================================
    -- CRATES_ELECTRONIC
    -- Crates of electronics: electronics, batteries, TV, PC, generator
    -- =========================================================
    CRATES_ELECTRONIC = {
        "CrateBatteries",
        "CrateComputer",
        "CrateElectronics",
        "CrateGenerator",
        "CrateTV",
        "CrateTVWide",
    },

    -- =========================================================
    -- CRATES_TOOLS
    -- Crates of tools and mechanics
    -- =========================================================
    CRATES_TOOLS = {
        "CrateMechanics",
        "CrateTools",
        "CrateToolsOld",
    },

    -- =========================================================
    -- CRATES_METAL
    -- Crates of metalwork: bars, pipes, sheet metal, sinks, chains
    -- =========================================================
    CRATES_METAL = {
        "CrateBlacksmithing",
        "CrateChromeSinks",
        "CrateHeavyChains",
        "CrateIndustrialSinks",
        "CrateMetalBars",
        "CrateMetalPipes",
        "CrateMetalwork",
        "CrateSheetMetal",
        "CrateWhiteSinks",
    },

    -- =========================================================
    -- CRATES_MATERIALS
    -- Crates of construction and craft materials (wood, stone, clay, paint, leather, fabric, dye, pottery)
    -- =========================================================
    CRATES_MATERIALS = {
        "CrateCarpentry",
        "CrateClayBags",
        "CrateClayBricks",
        "CrateConcrete",
        "CrateFabric_Cotton",
        "CrateFabric_DenimBlack",
        "CrateFabric_DenimBlue",
        "CrateFabric_DenimDarkBlue",
        "CrateFlintNodules",
        "CrateGravelBags",
        "CrateIndustrialDye",
        "CrateLargeStone",
        "CrateLeather",
        "CrateLeatherLarge",
        "CrateLimestoneCrushed",
        "CrateLongStick",
        "CrateLumber",
        "CrateMasonry",
        "CratePaint",
        "CratePlaster",
        "CratePottery",
        "CrateSandBags",
        "CrateStoneBlocks",
        "CrateStones",
        "CrateTailoring",
        "CrateWallFinish",
        "CrateWallpaper",
    },

    -- =========================================================
    -- CRATES_FURNITURE
    -- Crates of furniture: chairs, tables, linens, mannequins, toilets
    -- =========================================================
    CRATES_FURNITURE = {
        "CrateBlueComfyChair",
        "CrateBluePlasticChairs",
        "CrateBlueRattanChair",
        "CrateBrownComfyChair",
        "CrateBrownLowTables",
        "CrateDarkBlueChairs",
        "CrateDarkWoodenChairs",
        "CrateFancyBlackChairs",
        "CrateFancyDarkTables",
        "CrateFancyLowTables",
        "CrateFancyToilets",
        "CrateFancyWhiteChairs",
        "CrateFoldingChairs",
        "CrateGreenChairs",
        "CrateGreenComfyChair",
        "CrateGreyChairs",
        "CrateGreyComfyChair",
        "CrateLightRoundTable",
        "CrateLinens",
        "CrateLongTables",
        "CrateMannequins",
        "CrateMetalLockers",
        "CrateOakRoundTable",
        "CrateOfficeChairs",
        "CrateOrangeModernChair",
        "CratePlasticChairs",
        "CratePlasticLowTables",
        "CratePurpleRattanChair",
        "CratePurpleWoodenChairs",
        "CrateRedChairs",
        "CrateRedWoodenChairs",
        "CrateRoundTable",
        "CrateSkeletonDisplay",
        "CrateSmallTables",
        "CrateWhiteComfyChair",
        "CrateWhiteSimpleChairs",
        "CrateWhiteWoodenChairs",
        "CrateWoodenChairs",
        "CrateWoodenStools",
        "CrateYellowModernChair",
    },

    -- =========================================================
    -- CRATES_CLOTHING
    -- Crates of clothing and footwear
    -- =========================================================
    CRATES_CLOTHING = {
        "CrateBootsArmy",
        "CrateBootsArmyDesert",
        "CrateBootsOld",
        "CrateClothesRandom",
        "CrateCostume",
        "CrateFootwearRandom",
    },

    -- =========================================================
    -- CRATES_FARMING
    -- Crates of farming goods: feed, fertilizer, seeds, gardening, canning
    -- =========================================================
    CRATES_FARMING = {
        "CrateAnimalFeed",
        "CrateCanning",
        "CrateFarming",
        "CrateFertilizer",
        "CrateGardening",
        "CrateSunflowerSeeds",
    },

    -- =========================================================
    -- CRATES_MEDIA
    -- Crates of media: film, CDs, VHS, photos, instruments
    -- =========================================================
    CRATES_MEDIA = {
        "CrateCameraFilm",
        "CrateCompactDiscs",
        "CrateInstruments",
        "CratePhotos",
        "CrateVHSTapes",
    },

    -- =========================================================
    -- CRATES_BOOKS
    -- Crates of printed matter: books, comics, magazines, newspapers, bibles, maps
    -- =========================================================
    CRATES_BOOKS = {
        "CrateBibles",
        "CrateBooks",
        "CrateBooksSchool",
        "CrateComics",
        "CrateMagazines",
        "CrateMaps",
        "CrateMapsLarge",
        "CrateNewspapers",
        "CrateNewspapersNew",
    },

    -- =========================================================
    -- CRATES_SPORTS
    -- Crates of sports and games: balls, weights, golf, darts, pool
    -- =========================================================
    CRATES_SPORTS = {
        "BarCrateDarts",
        "BarCratePool",
        "CrateBaseballs",
        "CrateBasketballs",
        "CrateFitnessWeights",
        "CrateFootballs",
        "CrateGolfBalls",
        "CrateGolfClubs",
        "CrateSoccerBalls",
        "CrateSports",
    },

    -- =========================================================
    -- CRATES_MISC
    -- Miscellaneous crates: BBQ/charcoal, tobacco, hygiene, camping, fishing, pets, toys, office, merch
    -- =========================================================
    CRATES_MISC = {
        "CrateBlackBBQ",
        "CrateCamping",
        "CrateCharcoal",
        "CrateCigarettes",
        "CrateFishing",
        "CrateOfficeSupplies",
        "CratePetSupplies",
        "CratePropane",
        "CrateRedBBQ",
        "CrateSalonSupplies",
        "CrateToiletPaper",
        "CrateToys",
        "CrateWallets",
    },

    -- =========================================================
    -- CRATES_TRASH
    -- Trash crates: empty bottles/cans, junk
    -- =========================================================
    CRATES_TRASH = {
        "CrateEmptyBottles1",
        "CrateEmptyBottles2",
        "CrateEmptyMixed",
        "CrateEmptyTinCans",
        "CrateRandomJunk",
    },

    -- =========================================================
    -- SAFEHOUSE_GEAR
    -- Survivor-shelter survival caches: body armor, lighting and fireplaces
    -- (companion to SAFEHOUSE_FOOD / MEDICAL_SAFEHOUSE; mid/late phases)
    -- =========================================================
    SAFEHOUSE_GEAR = {
        "SafehouseArmor",
        "SafehouseArmor_Mid",
        "SafehouseArmor_Late",
        "SafehouseLighting",
        "SafehouseLighting_Late",
        "SafehouseFireplace",
        "SafehouseFireplace_Late",
    },

    -- =========================================================
    -- LOCKERS
    -- Generic personal-storage lockers and mailboxes (random personal effects)
    -- =========================================================
    LOCKERS = {
        "Locker",
        "LockerClassy",
        "PoolLockers",
        "SchoolLockers",
        "SeasonalWorkerLockers",
        "PostOfficeBoxes",
    },

    -- =========================================================
    -- STASH
    -- Hidden stashes and abandoned-house scavenge (plank stashes, derelict
    -- houses, pawned valuables)
    -- =========================================================
    STASH = {
        "MayorWestPointSafe",
        "PlankStashGold",
        "PlankStashMisc",
        "PlankStashMoney",
        "DerelictHouseCrime",
        "DerelictHouseParty",
        "DerelictHouseSquatter",
        "PawnShopCases",
    },

    -- =========================================================
    -- STORES
    -- General, convenience and gift stores (souvenirs, seasonal, checkout)
    -- =========================================================
    STORES = {
        "WildWestGeneralStore",
        "WildWestShelves",
        "WildWestSouveniers",
        "GasStoreEmergency",
        "GasStoreSpecial",
        "GiftStoreCards",
        "GiftStoreFancy",
        "Gifts",
        "HolidayStuff",
        "StoreCounterBags",
        "StoreCounterBagsFancy",
        "StoreCounterBagsPaper",
        "StoreCounterStrawsNapkins",
        "StoreShelfCombo",
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
        "WildWestBarCounter",
        "WildWestBarShelf",
        "BarCounterMisc",
        "BarShelfLiquor",
        "TheatreDrinks",
        "TheatreSnacks",
        "BarCounterGlasses",
        "BarCounterWeapon",
    },

    -- =========================================================
    -- FRIDGE_HOME
    -- Residential fridges
    -- =========================================================
    FRIDGE_HOME = {
        "FridgeBeer",
        "FridgeBottles",
        "FridgeBreakRoom",
        "FridgeFarmStorage",
        "FridgeGarage",
        "FridgeGeneric",
        "FridgeHoarder",
        "FridgeHunter",
        "FridgeOffice",
        "FridgeOther",
        "FridgeRich",
        "FridgeSnacks",
        "FridgeSoda",
        "FridgeTrailerPark",
        "FridgeVIPLounge",
        "FridgeWater",
        "MotelFridge",
        "NolansFridge",
        "UniversityFridge",
    },

    -- =========================================================
    -- FRIDGE_COMMERCIAL
    -- Commercial-kitchen and restaurant fridges
    -- =========================================================
    FRIDGE_COMMERCIAL = {
        "BakeryKitchenFridge",
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
        "ItalianKitchenFridge",
        "JaysKitchenFridge",
        "JuiceStandFridge",
        "MexicanKitchenFridge",
        "PizzaKitchenFridge",
        "RestaurantKitchenFridge",
        "SeafoodKitchenFridge",
        "SushiKitchenFridge",
        "WesternKitchenFridge",
    },

    -- =========================================================
    -- FRIDGE_SPECIAL
    -- Special fridges: medical, drug lab, safehouse, backstage
    -- =========================================================
    FRIDGE_SPECIAL = {
        "BackstageFridge",
        "BandPracticeFridge",
        "FridgeDrugLab",
        "FridgeMedical",
        "HospitalRoomFridge",
        "SafehouseFridge",
        "SafehouseFridge_Late",
        "SafehouseFridge_Mid",
    },

    -- =========================================================
    -- FREEZER (family)
    -- Freezers by context.
    -- =========================================================

    -- =========================================================
    -- FREEZER_HOME
    -- Residential and store freezers
    -- =========================================================
    FREEZER_HOME = {
        "FreezerFarmStorage",
        "FreezerFrozenFood",
        "FreezerGarage",
        "FreezerGeneric",
        "FreezerHoarder",
        "FreezerHunter",
        "FreezerIceCream",
        "FreezerRich",
        "FreezerTrailerPark",
    },

    -- =========================================================
    -- FREEZER_COMMERCIAL
    -- Commercial-kitchen and butcher freezers
    -- =========================================================
    FREEZER_COMMERCIAL = {
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
        "SeafoodKitchenFreezer",
        "SushiKitchenFreezer",
        "TheatreKitchenFreezer",
        "WesternKitchenFreezer",
    },

    -- =========================================================
    -- FREEZER_SPECIAL
    -- Special freezers: drug lab, safehouse
    -- =========================================================
    FREEZER_SPECIAL = {
        "FreezerDrugLab",
        "SafehouseFreezer",
        "SafehouseFreezer_Late",
        "SafehouseFreezer_Mid",
    },

    -- =========================================================
    -- STOVE
    -- Residential and commercial stoves
    -- =========================================================
    STOVE = {
        "StoveGeneric",
        "StoveClassy",
        "StoveRedneck",
        "DerelictHouseStove",
        "SafehouseStove",
        "SafehouseStove_Mid",
        "SafehouseStove_Late",
        "WildWestWoodStove",
        "BakeryKitchenStove",
    },

    -- =========================================================
    -- KITCHEN_COOKWARE
    -- Cooking implements: baking, cutlery, pots, knives
    -- =========================================================
    KITCHEN_COOKWARE = {
        "ArenaKitchenCutlery",
        "BakeryKitchenBaking",
        "BakeryKitchenCutlery",
        "BurgerKitchenCutlery",
        "ChefTools",
        "ChineseKitchenBaking",
        "ChineseKitchenCutlery",
        "CrepeKitchenBaking",
        "GigamartPots",
        "ItalianKitchenBaking",
        "JaysKitchenBaking",
        "KitchenBaking",
        "KitchenPots",
        "KnifeFactoryCutlery",
        "KnifeFactoryKitchenKnife",
        "KnifeFactoryKitchenKnifeBlades",
        "KnifeStoreCutlery",
        "MexicanKitchenBaking",
        "PizzaKitchenBaking",
        "StoreKitchenBaking",
        "StoreKitchenCutlery",
        "StoreKitchenPots",
        "SushiKitchenBaking",
        "SushiKitchenCutlery",
        "WesternKitchenBaking",
    },

    -- =========================================================
    -- KITCHEN_TABLEWARE
    -- Tableware: plates, cups, mugs, trays, dishwashers
    -- =========================================================
    KITCHEN_TABLEWARE = {
        "BakeryKitchenTrays",
        "CafeKitchenMugs",
        "DishCabinetGeneric",
        "DishCabinetLiquor",
        "DishCabinetVIPLounge",
        "DishwasherGeneric",
        "KitchenDishes",
        "StoreKitchenCups",
        "StoreKitchenDishes",
        "StoreKitchenGlasses",
        "StoreKitchenTrays",
    },

    -- =========================================================
    -- KITCHEN_SUPPLIES
    -- Kitchen supplies: bags, paper, cleaning, housewares, microwaves
    -- =========================================================
    KITCHEN_SUPPLIES = {
        "ArmyBunkerKitchen",
        "BakeryKitchenStorage",
        "CafeKitchenSupplies",
        "CafeteriaKitchenLaundry",
        "DinerBackRoomCounter",
        "GigamartHousewares",
        "GigamartPaper",
        "JaysKitchenBags",
        "KitchenBook",
        "KitchenMicrowave",
        "KitchenRandom",
        "StoreKitchenBags",
        "StoreKitchenCleaning",
        "WildWestKitchen",
    },

    -- =========================================================
    -- KITCHEN_PANTRY
    -- Kitchen pantry: bottles, canned goods, dry goods, breakfast
    -- =========================================================
    KITCHEN_PANTRY = {
        "KitchenBottles",
        "KitchenBreakfast",
        "KitchenCannedFood",
        "KitchenDryFood",
        "StoreKitchenPotatoes",
    },

    -- =========================================================
    -- KITCHEN_SAUCES
    -- Sauces and cheeses
    -- =========================================================
    KITCHEN_SAUCES = {
        "ArenaKitchenSauce",
        "BurgerKitchenSauce",
        "ChineseKitchenSauce",
        "CrepeKitchenSauce",
        "FishChipsKitchenSauce",
        "ItalianKitchenSauce",
        "JaysKitchenSauce",
        "MexicanKitchenSauce",
        "PizzaKitchenCheese",
        "PizzaKitchenSauce",
        "SeafoodKitchenSauce",
        "StoreKitchenSauce",
        "SushiKitchenSauce",
        "WesternKitchenSauce",
    },

    -- =========================================================
    -- KITCHEN_BUTCHER
    -- Butchery: meat, cuts, smoked goods, tools
    -- =========================================================
    KITCHEN_BUTCHER = {
        "BurgerKitchenButcher",
        "ButcherChicken",
        "ButcherChops",
        "ButcherFish",
        "ButcherGround",
        "ButcherLiterature",
        "ButcherSmoked",
        "ButcherSnacks",
        "ButcherSpices",
        "ButcherTools",
        "CatfishKitchenButcher",
        "ChineseKitchenButcher",
        "FishChipsKitchenButcher",
        "ItalianKitchenButcher",
        "JaysKitchenButcher",
        "MexicanKitchenButcher",
        "PizzaKitchenButcher",
        "SeafoodKitchenButcher",
        "StoreKitchenButcher",
        "SushiKitchenButcher",
        "WesternKitchenButcher",
    },

    -- =========================================================
    -- KITCHEN_BEVERAGE
    -- Coffee and tea
    -- =========================================================
    KITCHEN_BEVERAGE = {
        "CafeKitchenCoffee",
        "CafeKitchenTea",
        "StoreKitchenCafe",
    },

    -- =========================================================
    -- CAFETERIA
    -- Cafeterias and dining spaces
    -- =========================================================
    CAFETERIA = {
        "CafeteriaDrinks",
        "CafeteriaSnacks",
        "CafeteriaFruit",
        "CafeteriaSandwiches",
        "CafeteriaTrays",
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

    -- =========================================================
    -- AMMO
    -- Ammunition and reloading supplies
    -- =========================================================
    AMMO = {
        "ArmyStorageAmmunition",
        "ArmySurplusAmmoBoxes",
        "GunStoreAmmunition",
        "GunStoreMagsAmmo",
        "PoliceStorageAmmunition",
        "SWATStorageAmmunition",
    },

    -- =========================================================
    -- BOOKS_FICTION
    -- Genre fiction: crime, horror, literary, romance, thriller, western
    -- =========================================================
    BOOKS_FICTION = {
        "BookstoreCrimeFiction",
        "BookstoreHorror",
        "BookstoreLiteraryFiction",
        "BookstoreRomance",
        "BookstoreThriller",
        "BookstoreWestern",
        "LibraryCrimeFiction",
        "LibraryHorror",
        "LibraryLiteraryFiction",
        "LibraryRomance",
        "LibraryThriller",
        "LibraryWestern",
    },

    -- =========================================================
    -- BOOKS_SCIFI
    -- Science fiction and fantasy
    -- =========================================================
    BOOKS_SCIFI = {
        "BookstoreFantasySciFi",
        "LibraryFantasySciFi",
    },

    -- =========================================================
    -- BOOKS_NONFICTION
    -- Non-fiction / academic: science, history, business, legal, politics, philosophy, religion, occult, biography, reference
    -- =========================================================
    BOOKS_NONFICTION = {
        "AnthropologyBooks",
        "ArmySurplusLiterature",
        "BookstoreBiography",
        "BookstoreBusiness",
        "BookstoreGeneralReference",
        "BookstoreHistory",
        "BookstoreLegal",
        "BookstoreMilitaryHistory",
        "BookstoreNewAge",
        "BookstoreNonFiction",
        "BookstoreOccult",
        "BookstorePhilosophy",
        "BookstorePolitics",
        "BookstoreReligion",
        "BookstoreSchoolTextbook",
        "BookstoreScience",
        "BookstoreTravel",
        "LaboratoryBooks",
        "LibraryBiography",
        "LibraryBusiness",
        "LibraryGeneralReference",
        "LibraryHistory",
        "LibraryLegal",
        "LibraryMilitaryHistory",
        "LibraryNewAge",
        "LibraryNonFiction",
        "LibraryOccult",
        "LibraryPhilosophy",
        "LibraryPolitics",
        "LibraryReligion",
        "LibraryScience",
        "LibraryTravel",
        "MedievalBooks",
        "PoliceLibraryLegal",
        "UniversityLibraryBiography",
        "UniversityLibraryBusiness",
        "UniversityLibraryGeneralReference",
        "UniversityLibraryHistory",
        "UniversityLibraryLegal",
        "UniversityLibraryMilitaryHistory",
        "UniversityLibraryPhilosophy",
        "UniversityLibraryPolitics",
        "UniversityLibraryScience",
    },

    -- =========================================================
    -- BOOKS_HOBBIES
    -- Hobbies and trades: art, cinema, cooking, crafts, farming, sports, outdoors
    -- =========================================================
    BOOKS_HOBBIES = {
        "ArtStoreLiterature",
        "BookstoreArt",
        "BookstoreCinema",
        "BookstoreCooking",
        "BookstoreCrafts",
        "BookstoreFarming",
        "BookstoreHobbies",
        "BookstoreOutdoors",
        "BookstoreSports",
        "CampingStoreBooks",
        "GolfStoreLiterature",
        "HomeCinemaLiterature",
        "KnappingBooks",
        "LibraryArt",
        "LibraryCinema",
        "LibraryOutdoors",
        "LibrarySports",
        "PotteryBooks",
        "RangerBooks",
        "TailoringLiterature",
        "TheatreLiterature",
        "UniversityLibraryArt",
        "UniversityLibraryCinema",
        "UniversityLibrarySports",
    },

    -- =========================================================
    -- BOOKS_COMICS
    -- Comics, comic-store fantasy/sci-fi and tabletop games
    -- =========================================================
    BOOKS_COMICS = {
        "ComicStoreCounter",
        "ComicStoreDisplayBooks",
        "ComicStoreDisplayComics",
        "ComicStoreDisplayDice",
        "ComicStoreMagazines",
        "ComicStoreShelfComics",
        "ComicStoreShelfFantasy",
        "ComicStoreShelfGames",
        "ComicStoreShelfSciFi",
    },

    -- =========================================================
    -- BOOKS_NEWS
    -- Press: newspapers, magazines and magazine racks
    -- =========================================================
    BOOKS_NEWS = {
        "LibraryMagazines",
        "LiquorStoreMagazineRack",
        "MagazineRackAdult",
        "MagazineRackBrochure",
        "MagazineRackCards",
        "MagazineRackFancy",
        "MagazineRackMaps",
        "MagazineRackMixed",
        "MagazineRackNewspaper",
        "MagazineRackPaperback",
        "OutdoorSupplyMagazines",
        "PlankStashMagazine",
        "PostOfficeMagazines",
        "PostOfficeNewspapers",
        "RangerMagazines",
        "SalonMagazines",
        "UniversityLibraryMagazines",
    },

    -- =========================================================
    -- BOOKS_CHILDS
    -- Children books
    -- =========================================================
    BOOKS_CHILDS = {
        "BookstoreChilds",
        "LibraryChilds",
    },

    -- =========================================================
    -- BOOKS_GENERAL
    -- Generic books: counters, personal, stationery, misc, shelves
    -- =========================================================
    BOOKS_GENERAL = {
        "BookstoreBags",
        "BookstoreBooks",
        "BookStoreCounter",
        "BookstoreMisc",
        "BookstorePersonal",
        "BookstoreStationery",
        "CafeShelfBooks",
        "CortmanOfficeBooks",
        "GigamartLiterature",
        "LibraryBooks",
        "LibraryCounter",
        "LibraryPersonal",
        "MayorWestPointBooks",
        "PostOfficeBooks",
        "SafehouseBookShelf",
        "UniversityLibraryBooks",
    },

    -- =========================================================
    -- BOOKS_ELECTRONIC
    -- Electronics and computing manuals/magazines
    -- =========================================================
    BOOKS_ELECTRONIC = {
        "BookstoreComputer",
        "ElectronicStoreMagazines",
    },

    -- =========================================================
    -- BOOKS_MECHANIC
    -- Mechanics, automotive and trade manuals (DIY, blacksmithing, carpentry)
    -- =========================================================
    BOOKS_MECHANIC = {
        "BlacksmithLiterature",
        "BookstoreAutomotive",
        "BookstoreBlueCollar",
        "CarpentryBooks",
        "CarSupplyLiterature",
        "CarSupplyMagazines",
        "ClockRepairLiterature",
        "MechanicShelfBooks",
        "ToolStoreBooks",
    },

    -- =========================================================
    -- BOOKS_MEDICAL
    -- Medical literature
    -- =========================================================
    BOOKS_MEDICAL = {
        "BookstoreMedical",
        "HospitalMagazineRack",
        "LibraryMedical",
        "MedicalOfficeBooks",
        "UniversityLibraryMedical",
    },

    -- =========================================================
    -- CLOTHING_STORE
    -- Clothing store (racks and general shelving)
    -- =========================================================
    CLOTHING_STORE = {
        "BandMerchClothes",
        "ClothingPoor",
        "ClothingRack",
        "ClothingStorageAllJackets",
        "ClothingStorageAllShirts",
        "ClothingStorageLegwear",
        "ClothingStoresJackets",
        "ClothingStoresJacketsLeather",
        "ClothingStoresJeans",
        "ClothingStoresJumpers",
        "ClothingStoresOvershirts",
        "ClothingStoresPants",
        "ClothingStoresPantsLeather",
        "ClothingStoresShirts",
        "ClothingStoresSport",
        "ClothingStoresSummer",
        "ClothingStoresWoman",
        "GolfStoreClothingRack",
        "WildWestClothing",
        "ZippeeClothing",
    },

    -- =========================================================
    -- CLOTHING_FOOTWEAR
    -- Footwear: boots, shoes, sneakers
    -- =========================================================
    CLOTHING_FOOTWEAR = {
        "ArmySurplusFootwear",
        "BowlingAlleyShoes",
        "ClothingStorageFootwear",
        "ClothingStoresBoots",
        "ClothingStoresShoes",
        "ClothingStoresShoesLeather",
        "OutdoorSupplyBoots",
        "ToolStoreFootwear",
    },

    -- =========================================================
    -- CLOTHING_ACCESSORIES
    -- Accessories: gloves, eyewear, holsters, socks, headwear
    -- =========================================================
    CLOTHING_ACCESSORIES = {
        "ArmySurplusHeadwear",
        "CarSupplyGloves",
        "ClothingStorageHeadwear",
        "ClothingStoresEyewear",
        "ClothingStoresGloves",
        "ClothingStoresGlovesLeather",
        "ClothingStoresHeadwear",
        "ClothingStoresHolsters",
        "ClothingStoresSocks",
    },

    -- =========================================================
    -- CLOTHING_FORMAL
    -- Formal wear, dresses, suits and weddings
    -- =========================================================
    CLOTHING_FORMAL = {
        "ClothingStoresDress",
        "ClothingStoresJacketsFormal",
        "ClothingStoresPantsFormal",
        "ClothingStoresShirtsFormal",
        "LaundrySuits",
        "WeddingStoreDresses",
        "WeddingStoreSuits",
    },

    -- =========================================================
    -- CLOTHING_UNDERWEAR
    -- Underwear and lingerie
    -- =========================================================
    CLOTHING_UNDERWEAR = {
        "ClothingStoresUnderwearMan",
        "ClothingStoresUnderwearWoman",
        "LingerieStoreAccessories",
        "LingerieStoreBras",
        "LingerieStoreOutfits",
        "LingerieStoreUnderwear",
    },

    -- =========================================================
    -- CLOTHING_UNIFORM
    -- Uniforms and work outfits (professions)
    -- =========================================================
    CLOTHING_UNIFORM = {
        "AmbulanceDriverOutfit",
        "ArmyHangarOutfit",
        "ArmySurplusOutfit",
        "CarpenterOutfit",
        "ChefOutfit",
        "ConstructionWorkerOutfit",
        "DoctorOutfit",
        "DrugLabOutfit",
        "ElectricianOutfit",
        "FarmerOutfit",
        "FiremanOutfit",
        "FireStorageOutfit",
        "FishermanOutfit",
        "GardenerOutfit",
        "MechanicOutfit",
        "MechanicShelfOutfit",
        "MedicalClinicOutfit",
        "MedicalStorageOutfit",
        "MetalWorkerOutfit",
        "MorgueOutfit",
        "NurseOutfit",
        "PoliceOutfit",
        "PoliceStateOutfit",
        "PoliceStorageOutfit",
        "RangerOutfit",
        "ToolStoreOutfit",
    },

    -- =========================================================
    -- CLOTHING_ARMOR
    -- Protection: body armor, helmets and boxing gloves
    -- =========================================================
    CLOTHING_ARMOR = {
        "BoxingStorageGloves",
        "BoxingStorageHelmets",
        "PoliceStorageArmor",
        "PrisonStorageArmor",
        "SportStorageHelmets",
        "SWATStorageArmor",
    },

    -- =========================================================
    -- CLOTHING_HOME
    -- Residential wardrobes, dressers and closets
    -- =========================================================
    CLOTHING_HOME = {
        "BackstageDresser",
        "BedroomDresser",
        "BedroomDresserChild",
        "BedroomDresserClassy",
        "BedroomDresserRedneck",
        "DresserGeneric",
        "HospitalRoomWardrobe",
        "LivingRoomWardrobe",
        "StripClubDressers",
        "UniversityWardrobe",
        "WardrobeChild",
        "WardrobeClassy",
        "WardrobeGeneric",
        "WardrobeRedneck",
    },

    -- =========================================================
    -- CLOTHING_OUTDOOR
    -- Outdoor clothing: camping, winter, army-surplus cots
    -- =========================================================
    CLOTHING_OUTDOOR = {
        "ArmySurplusCots",
        "CampingStoreClothes",
        "CampingStoreLegwear",
        "ClothingStorageWinter",
        "OutdoorSupplyClothes",
    },

    -- =========================================================
    -- CLOTHING_MISC
    -- Miscellaneous: display, band, lost-and-found, fashion
    -- =========================================================
    CLOTHING_MISC = {
        "AnthropologyDisplayClothing",
        "BackstageClothingRack",
        "BandPracticeClothing",
        "BookstoreFashion",
        "CultistClothing",
        "LibraryFashion",
        "LostAndFoundClothing",
        "UniversityDesk_Fashion",
        "UniversityFilingCabinet_Fashion",
    },

    -- =========================================================
    -- FARMING
    -- Gardening, farming and homesteading
    -- =========================================================
    FARMING = {
        "GardenStoreMisc",
        "GardenStoreTools",
        "GigamartFarming",
        "FarmerTools",
        "GardenerTools",
        "ToolCabinetFarming",
        "ToolStoreFarming",
        "BeerGardenCounter",
        "Homesteading",
    },

    -- =========================================================
    -- GUNFIRE_STORE
    -- Gun stores (retail): counters, display cases, shelves, pistols/rifles/shotguns, accessories
    -- =========================================================
    GUNFIRE_STORE = {
        "GunStoreAccessories",
        "GunStoreBodyArmor",
        "GunStoreCases",
        "GunStoreCounter",
        "GunStoreDisplayCase",
        "GunStoreGuns",
        "GunStoreKnives",
        "GunStoreLiterature",
        "GunStoreMagazineRack",
        "GunStorePistols",
        "GunStoreRifles",
        "GunStoreShelf",
        "GunStoreShotguns",
    },

    -- =========================================================
    -- GUNFIRE_MILITARY
    -- Military armory
    -- =========================================================
    GUNFIRE_MILITARY = {
        "ArmyStorageGuns",
    },

    -- =========================================================
    -- GUNFIRE_POLICE
    -- Police armory
    -- =========================================================
    GUNFIRE_POLICE = {
        "PoliceStorageGuns",
    },

    -- =========================================================
    -- GUNFIRE_SWAT
    -- SWAT armory
    -- =========================================================
    GUNFIRE_SWAT = {
        "SWATStorageGuns",
    },

    -- =========================================================
    -- GUNFIRE_PRISON
    -- Prison armory
    -- =========================================================
    GUNFIRE_PRISON = {
        "PrisonArmoryShotguns",
        "PrisonStorageGuns",
    },

    -- =========================================================
    -- GUNFIRE_RANGER
    -- Park-ranger firearms
    -- =========================================================
    GUNFIRE_RANGER = {
        "RangerStorageGuns",
    },

    -- =========================================================
    -- GUNFIRE_CRIMINAL
    -- Illicit / black-market firearms: drug lab, pawn shop, garage, stashes
    -- =========================================================
    GUNFIRE_CRIMINAL = {
        "DrugLabGuns",
        "GarageFirearms",
        "PawnShopGuns",
        "PawnShopGunsSpecial",
        "PlankStashGun",
    },

    -- =========================================================
    -- GUNFIRE_GENERIC
    -- Generic firearm spawns (phased)
    -- =========================================================
    GUNFIRE_GENERIC = {
        "FirearmWeapons",
        "FirearmWeapons_Late",
        "FirearmWeapons_Mid",
    },

    -- =========================================================
    -- FURNITURE_BEDROOM
    -- Bedroom: nightstands, bedding, barracks lockers
    -- =========================================================
    FURNITURE_BEDROOM = {
        "BedroomSidetable",
        "BedroomSidetableChild",
        "BedroomSidetableClassy",
        "BedroomSidetableRedneck",
        "GigamartBedding",
        "LockerArmyBedroom",
        "LockerArmyBedroomHome",
        "MotelLinens",
        "MotelSideTable",
        "WildWestBedroom",
    },

    -- =========================================================
    -- FURNITURE_LIVING
    -- Living room: shelves, side tables, wall decor
    -- =========================================================
    FURNITURE_LIVING = {
        "LivingRoomShelf",
        "LivingRoomShelfClassy",
        "LivingRoomShelfNoTapes",
        "LivingRoomShelfRedneck",
        "LivingRoomSideTable",
        "LivingRoomSideTableClassy",
        "LivingRoomSideTableNoRemote",
        "LivingRoomSideTableRedneck",
        "RecRoomShelf",
        "WallDecor",
        "WildWestLivingRoom",
    },

    -- =========================================================
    -- FURNITURE_MISC
    -- Miscellaneous furniture: changing rooms, generic shelves and side tables
    -- =========================================================
    FURNITURE_MISC = {
        "ChangeroomCounters",
        "ClosetShelfGeneric",
        "ControlRoomCounter",
        "StudioPropShelf",
        "UniversitySideTable",
    },

    -- =========================================================
    -- GROCERY_PRODUCE
    -- Fresh fruit and vegetables (stands and produce storage)
    -- =========================================================
    GROCERY_PRODUCE = {
        "GroceryStandFruits1",
        "GroceryStandFruits2",
        "GroceryStandFruits3",
        "GroceryStandLettuce",
        "GroceryStandVegetables1",
        "GroceryStandVegetables2",
        "GroceryStandVegetables3",
        "GroceryStandVegetables4",
        "GroceryStandVegetables5",
        "ProduceStorageApples",
        "ProduceStorageBellPeppers",
        "ProduceStorageBroccoli",
        "ProduceStorageCabbages",
        "ProduceStorageCarrots",
        "ProduceStorageCauliflower",
        "ProduceStorageCherry",
        "ProduceStorageCorn",
        "ProduceStorageEggplant",
        "ProduceStorageEquipment",
        "ProduceStorageGrapes",
        "ProduceStorageGreenpeas",
        "ProduceStorageKale",
        "ProduceStorageLeeks",
        "ProduceStorageLettuce",
        "ProduceStorageLooseFruit",
        "ProduceStorageLooseVeg",
        "ProduceStorageOnions",
        "ProduceStoragePeaches",
        "ProduceStoragePears",
        "ProduceStoragePotatoes",
        "ProduceStorageRadishes",
        "ProduceStorageRottenFruit",
        "ProduceStorageRottenVeg",
        "ProduceStorageStrawberries",
        "ProduceStorageSweetPotatoes",
        "ProduceStorageTomatoes",
        "ProduceStorageWatermelons",
    },

    -- =========================================================
    -- GROCERY_MEAT
    -- Meat
    -- =========================================================
    GROCERY_MEAT = {
        "Meat",
    },

    -- =========================================================
    -- GROCERY_BAKERY
    -- Bakery and pastries
    -- =========================================================
    GROCERY_BAKERY = {
        "BakeryBread",
        "BakeryCake",
        "BakeryDoughnuts",
        "BakeryMisc",
        "BakeryPie",
        "GigamartBakingMisc",
    },

    -- =========================================================
    -- GROCERY_SNACKS
    -- Snacks, candy, crisps, popcorn
    -- =========================================================
    GROCERY_SNACKS = {
        "CandyStoreSnacks",
        "GigamartCandy",
        "GigamartCrisps",
        "JuiceStandSnacks",
        "StoreShelfSnacks",
        "TheatrePopcorn",
    },

    -- =========================================================
    -- GROCERY_PANTRY
    -- Pantry: canned, dry goods, sauces, spices, gourmet
    -- =========================================================
    GROCERY_PANTRY = {
        "FoodGourmet",
        "GigamartBreakfast",
        "GigamartCannedFood",
        "GigamartDryGoods",
        "GigamartSauce",
        "GigamartSpices",
        "StoreShelfSpices",
    },

    -- =========================================================
    -- GROCERY_BBQ
    -- Barbecue: charcoal, propane, grills, accessories
    -- =========================================================
    GROCERY_BBQ = {
        "BBQCharcoal",
        "BBQCharcoalRich",
        "BBQPropane",
        "BBQPropaneRich",
        "GigamartBBQ",
        "GrillAcessories",
        "GrillStoreBlackBBQ",
        "GrillStoreRedBBQ",
        "StoreShelfBBQ",
    },

    -- =========================================================
    -- GROCERY_DRINKS
    -- Non-alcoholic drinks (sodas, juices)
    -- =========================================================
    GROCERY_DRINKS = {
        "HotdogStandDrinks",
        "JuiceStandDrinks",
        "StoreShelfDrinks",
    },

    -- =========================================================
    -- GROCERY_PREPARED
    -- Prepared / fast food (serving trays)
    -- =========================================================
    GROCERY_PREPARED = {
        "HotdogStandToppings",
        "ServingTrayBiscuits",
        "ServingTrayBurgers",
        "ServingTrayBurritos",
        "ServingTrayChicken",
        "ServingTrayChickenFried",
        "ServingTrayChickenNuggets",
        "ServingTrayChickenWings",
        "ServingTrayCornbread",
        "ServingTrayFish",
        "ServingTrayFishFingers",
        "ServingTrayFishFried",
        "ServingTrayFries",
        "ServingTrayGravy",
        "ServingTrayHam",
        "ServingTrayHotdogs",
        "ServingTrayLobster",
        "ServingTrayMaki",
        "ServingTrayMeatDumplings",
        "ServingTrayMeatSteamBuns",
        "ServingTrayMussels",
        "ServingTrayNoodleSoup",
        "ServingTrayOmelettes",
        "ServingTrayOnigiri",
        "ServingTrayOnionRings",
        "ServingTrayOysters",
        "ServingTrayOystersFried",
        "ServingTrayPancakes",
        "ServingTrayPerogies",
        "ServingTrayPie",
        "ServingTrayPizza",
        "ServingTrayPorkChops",
        "ServingTrayPotatoPancakes",
        "ServingTrayRefriedBeans",
        "ServingTraySalmon",
        "ServingTraySausage",
        "ServingTrayScrambledEggs",
        "ServingTrayShrimp",
        "ServingTrayShrimpDumplings",
        "ServingTrayShrimpFried",
        "ServingTraySpringRolls",
        "ServingTraySteak",
        "ServingTraySushiEgg",
        "ServingTraySushiFish",
        "ServingTrayTaco",
        "ServingTrayTatoDots",
        "ServingTrayTofuFried",
        "ServingTrayWaffles",
    },

    -- =========================================================
    -- GROCERY_TOBACCO
    -- Tobacco and smoking articles
    -- =========================================================
    GROCERY_TOBACCO = {
        "SmokingRoomCigars",
        "SmokingRoomPipes",
        "StoreCounterTobacco",
        "TobaccoStoreAccessories",
        "TobaccoStoreChew",
        "TobaccoStoreCigarettes",
        "TobaccoStoreCigarillos",
        "TobaccoStoreCigars",
        "TobaccoStorePipes",
    },

    -- =========================================================
    -- HOBBY
    -- Arts, crafts and hobby supplies
    -- =========================================================
    HOBBY = {
        "ArtStoreOther",
        "ArtStorePaper",
        "ArtStorePen",
        "Antiques",
        "ArtStorePottery",
        "ArtSupplies",
        "Hobbies",
        "ImprovisedCrafts",
        "SewingStoreFabric",
    },

    -- =========================================================
    -- HYGIENE_BATHROOM
    -- Bathroom: cabinets, counters, shelves, bins
    -- =========================================================
    HYGIENE_BATHROOM = {
        "BathroomCabinet",
        "BathroomCounter",
        "BathroomCounterEmpty",
        "BathroomCounterMotel",
        "BathroomCounterNoMeds",
        "BathroomShelf",
        "BinBathroom",
    },

    -- =========================================================
    -- HYGIENE_LAUNDRY
    -- Laundry: washers, dryers, loads, towels, suits
    -- =========================================================
    HYGIENE_LAUNDRY = {
        "BarLaundry",
        "DryerEmpty",
        "LaundryCleaning",
        "LaundryLoad1",
        "LaundryLoad2",
        "LaundryLoad3",
        "LaundryLoad4",
        "LaundryLoad5",
        "LaundryLoad6",
        "LaundryLoad7",
        "LaundryLoad8",
        "MotelTowels",
        "PoliceLaundry",
        "PrisonLaundry",
        "SafehouseDryer",
        "SafehouseWasher",
    },

    -- =========================================================
    -- HYGIENE_COSMETICS
    -- Cosmetics, personal care, salon/barber
    -- =========================================================
    HYGIENE_COSMETICS = {
        "GasStoreToiletries",
        "GigamartBathing",
        "GigamartCosmetics",
        "GigamartToiletries",
        "SalonCounter",
        "SalonShelfHaircare",
        "SalonShelfTowels",
        "StripClubCosmetic",
        "WildWestBarberCounter",
        "WildWestBarberShelves",
    },

    -- =========================================================
    -- HYGIENE_CLEANING
    -- Cleaning: cleaning supplies and janitorial
    -- =========================================================
    HYGIENE_CLEANING = {
        "JanitorMisc",   -- moved from OTHER
        "FossoilCounterCleaning",
        "Gas2GoCounterCleaning",
        "GasStoreCounterCleaning",
        "GigamartCleaning",
        "JanitorCleaning",
        "JanitorTools",
        "StoreCounterCleaning",
    },

    -- =========================================================
    -- JEWELRY
    -- Jewelry and precious goods
    -- =========================================================
    JEWELRY = {
        "JewelryWeddingRings",
        "DepartmentStoreWatches",
        "StoreDisplayWatches",
        "ClockRepairWatches",
        "DepartmentStoreJewelry",
        "JewelryGems",
        "JewelryGold",
        "JewelryNavelRings",
        "JewelryOthers",
        "JewelrySilver",
        "JewelryStorageAll",
        "JewelryWrist",
    },

    -- =========================================================
    -- LIQUOR
    -- Liquor, wine and beer
    -- =========================================================
    LIQUOR = {
        "StoreShelfBeer",
        "StoreShelfWine",
        "BarCounterLiquor",
        "BreweryBottles",
        "BreweryCans",
        "BreweryHops",
        "GigamartBottles",
        "LiquorStoreBags",
        "LiquorStoreBeer",
        "LiquorStoreBeerFancy",
        "LiquorStoreBrandy",
        "LiquorStoreGin",
        "LiquorStoreMix",
        "LiquorStoreRum",
        "LiquorStoreScotch",
        "LiquorStoreTequila",
        "LiquorStoreVodka",
        "LiquorStoreWhiskey",
        "LiquorStoreWine",
        "LiquorStoreWineFancy",
        "SafehouseBooze",
        "StoreShelfWhiskey",
        "WhiskeyBottlingFull",
    },

    -- =========================================================
    -- MATERIALS
    -- Building and raw materials
    -- =========================================================
    MATERIALS = {
        "BagStoreLeather",
        "PlumbingSupplies",
    },

    -- =========================================================
    -- MEDIA_MUSIC
    -- Music: instruments, stores, school and band merch
    -- =========================================================
    MEDIA_MUSIC = {
        "BandMerchShelves",
        "BandPracticeInstruments",
        "BookstoreMusic",
        "ClosetInstruments",
        "LibraryMusic",
        "MusicSchoolCases",
        "MusicSchoolDesk",
        "MusicSchoolLocker",
        "MusicSchoolSheets",
        "MusicStoreBass",
        "MusicStoreBrass",
        "MusicStoreCases",
        "MusicStoreCDs",
        "MusicStoreDrums",
        "MusicStoreGuitar",
        "MusicStoreLiterature",
        "MusicStoreOthers",
        "MusicStoreSpeaker",
        "MusicStoreStringed",
        "UniversityDesk_Music",
        "UniversityFilingCabinet_Music",
        "UniversityLibraryMusic",
    },

    -- =========================================================
    -- MEDIA_FILM
    -- Cinema, video and photography
    -- =========================================================
    MEDIA_FILM = {
        "CameraStoreDisplayCase",
        "CameraStoreShelves",
        "HomeCinemaFilm",
        "MovieRentalShelves",
        "Photographer",
    },

    -- =========================================================
    -- MEDIA_STAGE
    -- Stage production / backstage
    -- =========================================================
    MEDIA_STAGE = {
        "BackstageCounter",
        "BackstageLockers",
        "BackstageRigging",
    },

    -- =========================================================
    -- OFFICE_GENERAL
    -- Generic offices: desks, filing cabinets, counters
    -- =========================================================
    OFFICE_GENERAL = {
        "AnthropologyDesk",
        "BankDeposit",
        "DeskGeneric",
        "FilingCabinetGeneric",
        "OfficeCounter",
        "OfficeDesk",
        "OfficeDeskSecretary",
        "OfficeDeskStressed",
        "OfficeDrawers",
        "RangerDesk",
        "SecurityDesk",
        "WaitingRoomDesk",
    },

    -- =========================================================
    -- OFFICE_HOME
    -- Home offices and named-character desks
    -- =========================================================
    OFFICE_HOME = {
        "CortmanOfficeDesk",
        "CortmanOfficeSidetable",
        "JackiesDesk",
        "MayorWestPointDesk",
        "NolansDesk",
        "NolansFilingCabinet",
        "OfficeDeskHome",
        "OfficeDeskHomeClassy",
    },

    -- =========================================================
    -- OFFICE_SCHOOL
    -- Classroom, kids and daycare desks
    -- =========================================================
    OFFICE_SCHOOL = {
        "ClassroomDesk",
        "ClassroomSecondaryDesk",
        "DaycareDesk",
        "KidsDesk",
    },

    -- =========================================================
    -- OFFICE_POLICE
    -- Police / sheriff desks and files
    -- =========================================================
    OFFICE_POLICE = {
        "PoliceCaptainDesk",
        "PoliceDesk",
        "PoliceFileBox",
        "PoliceFilingCabinet",
        "WildWestSheriffDesk",
    },

    -- =========================================================
    -- OFFICE_POST
    -- Post office (parcels and supplies)
    -- =========================================================
    OFFICE_POST = {
        "PostOfficeParcels",
        "PostOfficeSupplies",
    },

    -- =========================================================
    -- OFFICE_UNIVERSITY
    -- University desks and filing cabinets by faculty
    -- =========================================================
    OFFICE_UNIVERSITY = {
        "UniversityDesk_Anthropology",
        "UniversityDesk_Art",
        "UniversityDesk_Business",
        "UniversityDesk_Cinema",
        "UniversityDesk_Electrical",
        "UniversityDesk_Engineering",
        "UniversityDesk_English",
        "UniversityDesk_Glassmaking",
        "UniversityDesk_History",
        "UniversityDesk_Legal",
        "UniversityDesk_Math",
        "UniversityDesk_Medieval",
        "UniversityDesk_Nature",
        "UniversityDesk_Occult",
        "UniversityDesk_Philosophy",
        "UniversityDesk_Pioneer",
        "UniversityDesk_Politics",
        "UniversityDesk_Religion",
        "UniversityDesk_Science",
        "UniversityDesk_Therapy",
        "UniversityFilingCabinet_Art",
        "UniversityFilingCabinet_Business",
        "UniversityFilingCabinet_Cinema",
        "UniversityFilingCabinet_Engineering",
        "UniversityFilingCabinet_English",
        "UniversityFilingCabinet_Glassmaking",
        "UniversityFilingCabinet_History",
        "UniversityFilingCabinet_Legal",
        "UniversityFilingCabinet_Math",
        "UniversityFilingCabinet_Medieval",
        "UniversityFilingCabinet_Nature",
        "UniversityFilingCabinet_Occult",
        "UniversityFilingCabinet_Philosophy",
        "UniversityFilingCabinet_Politics",
        "UniversityFilingCabinet_Religion",
        "UniversityFilingCabinet_Science",
        "UniversityFilingCabinet_Therapy",
    },

    -- =========================================================
    -- PET
    -- Pet supplies and pet food
    -- =========================================================
    PET = {
        "PetShopShelf",
    },

    -- =========================================================
    -- RELIGION
    -- Churches and religious items
    -- =========================================================
    RELIGION = {
        "ChurchStorageMisc",
    },

    -- =========================================================
    -- SCHOOL
    -- Schools and universities
    -- =========================================================
    SCHOOL = {
        "ClassroomMisc",
        "ClassroomSecondaryMisc",
        "ClassroomSecondaryShelves",
        "ClassroomShelves",
        "GigamartSchool",
        "SchoolLab",
        "SchoolLockersBad",
        "UniversityStorageAnthropology",
        "UniversityStorageScience",
    },

    -- =========================================================
    -- SCIENCE
    -- Science, labs and museums
    -- =========================================================
    SCIENCE = {
        "AnthropologyCounter",
        "AnthropologyDisplayWeapons",
        "Chemistry",
        "JanitorChemicals",
        "LaboratoryLockers",
        "MedievalAlchemy",
        "MedievalBible",
        "MedievalCooking",
        "MorgueChemicals",
        "ScienceMisc",
        "TestingLab",
    },

    -- =========================================================
    -- SPORTS_STORE
    -- Sporting-goods store (retail): balls, racquets, clubs, weights, footwear
    -- =========================================================
    SPORTS_STORE = {
        "BaseballStoreShelves",
        "GolfStoreAccessories",
        "GolfStoreBags",
        "SportStorageBalls",
        "SportStorageBats",
        "SportStoragePaddles",
        "SportStorageRacquets",
        "SportStorageSticks",
        "SportStorageWeights",
        "SportStoreAccessories",
        "SportStoreBadminton",
        "SportStoreBaseball",
        "SportStoreBoxing",
        "SportStoreFootball",
        "SportStoreGolf",
        "SportStoreIceHockey",
        "SportStorePadding",
        "SportStoreSneakers",
        "SportStoreTennis",
    },

    -- =========================================================
    -- SPORTS_GYM
    -- Gym and fitness: weights, mats, towels, locker rooms
    -- =========================================================
    SPORTS_GYM = {
        "ClosetSportsEquipment",
        "FitnessTrainer",
        "GymLaundry",
        "GymLockers",
        "GymMats",
        "GymSweatbands",
        "GymTowels",
        "GymWeights",
        "SchoolGymSportsGear",
    },

    -- =========================================================
    -- SPORTS_VENUE
    -- Sports venues: bowling, boxing, golf, equestrian, carnival
    -- =========================================================
    SPORTS_VENUE = {
        "BaseballLockers",
        "BowlingAlleyCounters",
        "BowlingAlleyLockers",
        "BowlingAlleyPins",
        "BoxingLockers",
        "BoxingMemorabilia",
        "CarnivalPrizes",
        "GolfLockers",
        "GolfStorage",
        "JockeyLockers",
    },

    -- =========================================================
    -- TOYS
    -- Toys and games
    -- =========================================================
    TOYS = {
        "GiftStoreToys",
        "GigamartToys",
        "DaycareCounter",
        "DaycareShelves",
    },

    -- =========================================================
    -- TRASH
    -- Bins, dumpsters and junk
    -- =========================================================
    TRASH = {
        "SafehouseBin",
        "SafehouseBin_Mid",
        "SafehouseBin_Late",
        "BinBar",
        "BinCrepe",
        "BinDumpster",
        "BinFireStation",
        "BinGeneric",
        "BinJays",
        "BreweryEmptyBottles",
        "BreweryEmptyCans",
        "DerelictHouseJunk",
        "Empty",
        "JunkBin",
        "JunkHoard",
        "ProduceStorageEmptyBoxes",
        "WhiskeyBottlingEmpty",
    },

    -- =========================================================
    -- WEAPONS
    -- Melee and improvised weapons
    -- =========================================================
    WEAPONS = {
        "PawnShopKnives",
        "MedievalWeapons",
        "MedievalWeaponsJapan",
        "MeleeWeapons",
        "MeleeWeapons_Late",
        "MeleeWeapons_Mid",
    },

    -- =========================================================
    -- RESTAURANT
    -- Dining / restaurant and cafe counters (front-of-house and menus)
    -- =========================================================
    RESTAURANT = {
        "CafeCounterMix",
        "JaysDiningCounter",
        "RestaurantMenus",
    },

    -- =========================================================
    -- SPA
    -- Spas (cabinets and counters)
    -- =========================================================
    SPA = {
        "SpaCabinet",
        "SpaCounter",
    },

    -- =========================================================
    -- SPIFFO
    -- Brand group: all Spiffo (the PZ mascot/chain) loot tables, gathered
    -- apart from their context (kitchen, fridge, office, etc.).
    -- =========================================================
    SPIFFO = {
        "BinSpiffos",
        "CratePaperBagSpiffos",
        "CrateSpiffoMerch",
        "SpiffosDesk",
        "SpiffosDiningCounter",
        "SpiffosKitchenBags",
        "SpiffosKitchenBaking",
        "SpiffosKitchenButcher",
        "SpiffosKitchenCups",
        "SpiffosKitchenFreezer",
        "SpiffosKitchenFridge",
        "SpiffosKitchenSauce",
        "SpiffosKitchenSpecial",
        "SpiffosKitchenTrays",
        "StoveSpiffos",
    },

    -- =========================================================
    -- OTHER
    -- Miscellaneous / uncategorized containers (deliberate catch-all)
    -- =========================================================
    OTHER = {
        "JudgeMattHassCounter",
        "LostAndFoundItems",
        "OtherGeneric",
        "RandomFiller",
        "ShelfGeneric",
        "VacationStuff",
        "WoodcraftDudeCounter",
    },

}

-- ==========================================================================
-- COMBINED GROUPS
-- A combo expands to the union of several KRCore.LOC groups (automatic dedupe
-- in KRCore_Server). Used with the same name in dist.add():
--     KRCore.dist.add("Base.MyItem", { POWER = 0.2 })
-- ==========================================================================

-- The resolver (KRCore_Server.resolveGroupLocations) is RECURSIVE: a combo
-- may reference KRCore.LOC groups and/or other combos (cycle guard).
-- Two layers:
--   1) ROLL-UPS: rebuild the old coarse name as the union of its fine
--      groups, for backward compatibility (ELECTRONIC, BOOKS, CRATES, ...).
--   2) CONCEPTS: useful cross-cutting groupings (POWER, FOOD, WARZONE, ...).
KRCore.COMBO = {

    -- ===== Roll-ups: old coarse name = union of its fine groups =====
    ELECTRONIC = { "ELECTRONIC_GENERAL", "ELECTRONIC_COMPUTER", "ELECTRONIC_PHONE", "ELECTRONIC_RADIO", "ELECTRONIC_POWER" },
    MEDICAL    = { "MEDICAL_HOSPITAL", "MEDICAL_TOOLS", "MEDICAL_PHARMACY", "MEDICAL_OPTOMETRY", "MEDICAL_SAFEHOUSE", "MEDICAL_DRUGLAB" },
    INDUSTRIAL = { "INDUSTRIAL_TOOLS", "INDUSTRIAL_METALWORK", "INDUSTRIAL_WOODWORK", "INDUSTRIAL_CRAFTS", "INDUSTRIAL_FACTORY" },
    AUTOMOTIVE = { "MECHANIC", "MECHANIC_CARPARTS", "MECHANIC_FUEL" },
    SURVIVAL   = { "SURVIVAL_CAMPING", "SURVIVAL_HUNTING" },
    BOOKS      = { "BOOKS_FICTION", "BOOKS_SCIFI", "BOOKS_NONFICTION", "BOOKS_HOBBIES", "BOOKS_COMICS", "BOOKS_NEWS", "BOOKS_CHILDS", "BOOKS_GENERAL", "BOOKS_ELECTRONIC", "BOOKS_MECHANIC", "BOOKS_MEDICAL" },
    CLOTHING   = { "CLOTHING_STORE", "CLOTHING_FOOTWEAR", "CLOTHING_ACCESSORIES", "CLOTHING_FORMAL", "CLOTHING_UNDERWEAR", "CLOTHING_UNIFORM", "CLOTHING_ARMOR", "CLOTHING_HOME", "CLOTHING_OUTDOOR", "CLOTHING_MISC" },
    GROCERY    = { "GROCERY_PRODUCE", "GROCERY_MEAT", "GROCERY_BAKERY", "GROCERY_SNACKS", "GROCERY_PANTRY", "GROCERY_BBQ", "GROCERY_DRINKS", "GROCERY_PREPARED", "GROCERY_TOBACCO" },
    GUNFIRE    = { "GUNFIRE_STORE", "GUNFIRE_MILITARY", "GUNFIRE_POLICE", "GUNFIRE_SWAT", "GUNFIRE_PRISON", "GUNFIRE_RANGER", "GUNFIRE_CRIMINAL", "GUNFIRE_GENERIC" },
    FIREARMS   = { "GUNFIRE" },
    OFFICE     = { "OFFICE_GENERAL", "OFFICE_HOME", "OFFICE_SCHOOL", "OFFICE_POLICE", "OFFICE_POST", "OFFICE_UNIVERSITY" },
    HYGIENE    = { "HYGIENE_BATHROOM", "HYGIENE_LAUNDRY", "HYGIENE_COSMETICS", "HYGIENE_CLEANING" },
    KITCHEN    = { "KITCHEN_COOKWARE", "KITCHEN_TABLEWARE", "KITCHEN_SUPPLIES", "KITCHEN_PANTRY", "KITCHEN_SAUCES", "KITCHEN_BUTCHER", "KITCHEN_BEVERAGE" },
    SPORTS     = { "SPORTS_STORE", "SPORTS_GYM", "SPORTS_VENUE" },
    MEDIA      = { "MEDIA_MUSIC", "MEDIA_FILM", "MEDIA_STAGE" },
    FURNITURE  = { "FURNITURE_BEDROOM", "FURNITURE_LIVING", "FURNITURE_MISC" },
    FRIDGE     = { "FRIDGE_HOME", "FRIDGE_COMMERCIAL", "FRIDGE_SPECIAL" },
    FREEZER    = { "FREEZER_HOME", "FREEZER_COMMERCIAL", "FREEZER_SPECIAL" },
    CRATES     = { "CRATES_CANFOOD", "CRATES_FOOD", "CRATES_DRINKS", "CRATES_LIQUOR", "CRATES_KITCHEN", "CRATES_APPLIANCES", "CRATES_ELECTRONIC", "CRATES_TOOLS", "CRATES_METAL", "CRATES_MATERIALS", "CRATES_FURNITURE", "CRATES_CLOTHING", "CRATES_FARMING", "CRATES_MEDIA", "CRATES_BOOKS", "CRATES_SPORTS", "CRATES_MISC", "CRATES_TRASH" },

    SPECIAL    = { "SAFEHOUSE_GEAR", "LOCKERS", "STASH" },

    -- ===== Cross-cutting concepts (may reference roll-ups) =====
    WAREHOUSE    = { "CRATES" },
    COLD_STORAGE = { "FRIDGE", "FREEZER" },
    COOKING      = { "KITCHEN", "STOVE" },
    POWER        = { "ELECTRONIC_POWER", "CRATES_ELECTRONIC", "MECHANIC" },
    FOOD         = { "GROCERY", "FRIDGE", "FREEZER", "CAFETERIA", "SAFEHOUSE_FOOD", "RESTAURANT", "CRATES_CANFOOD", "CRATES_FOOD", "CRATES_DRINKS" },
    MILITARY     = { "ARMY", "GUNFIRE_MILITARY" },
    TACTICAL     = { "ARMY", "SURVIVAL", "GUNFIRE_MILITARY", "GUNFIRE_RANGER", "CLOTHING_OUTDOOR" },
    WARZONE      = { "GUNFIRE", "AMMO", "WEAPONS", "CLOTHING_ARMOR" },
    LAW          = { "POLICE", "PRISON", "SECURITY", "GUNFIRE_POLICE", "GUNFIRE_SWAT", "GUNFIRE_PRISON", "OFFICE_POLICE" },
    WORKSHOP     = { "INDUSTRIAL", "MECHANIC", "MECHANIC_CARPARTS", "MATERIALS", "CRATES_TOOLS", "CRATES_METAL", "CRATES_MATERIALS" },
}
