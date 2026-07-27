# KR CoreOS — Location Groups Reference

This is the full map of every **location group** in KR CoreOS and the exact
`ProceduralDistributions.list` containers each one expands to.

A *group* is just a named, curated list of real in-game containers, sorted by **context**
(what kind of place it is), so a modder can write `MEDICAL = 0.3` instead of naming a
dozen medical containers by hand. See [README.md](README.md) for the API.

- **18 location groups** + **4 combos**.
- Container names below are verified against **B42.19** (`ProceduralDistributions.lua`).
- The B41 build of CoreOS ships an equivalent set adapted to B41 names; any container that
  doesn't exist in the running build is **skipped silently**, so the same `dist.add` call
  is safe on both builds.
- A `_Mid` / `_Late` suffix is a safehouse tier the engine places in survivor shelters
  as the game progresses.

---

## Overview — all groups

| Group | Containers | What it is |
|---|--:|---|
| [`MILITARY`](#military) | 17 | Military, police, prison & security storage |
| [`SURVIVAL`](#survival) | 10 | Camping, hunting & survival-gear stores |
| [`ELECTRONIC`](#electronic) | 14 | Electronics stores & tech containers |
| [`MEDICAL`](#medical) | 6 | Hospitals, clinics & medical storage |
| [`INDUSTRIAL`](#industrial) | 14 | Workshops, factories & industrial storage |
| [`MECHANIC`](#mechanic) | 12 | Auto shops & car-part stores (car batteries) |
| [`CRATES`](#crates) | 13 | Generic storage crates |
| [`SPECIAL`](#special) | 11 | Rare / unique spots, gun & pawn shops, safehouse gear |
| [`STORES`](#stores) | 9 | General & big-box stores, garden/fishing/BBQ |
| [`BREAKROOM`](#breakroom) | 3 | Office & factory break rooms |
| [`BAR`](#bar) | 4 | Bars, theatres & entertainment |
| [`FRIDGE`](#fridge) | 48 | Residential & commercial refrigerators |
| [`FREEZER`](#freezer) | 34 | Residential & commercial freezers |
| [`STOVE`](#stove) | 10 | Residential & commercial stoves |
| [`KITCHEN`](#kitchen) | 30 | Kitchens (utensils, dishes, basic storage) |
| [`KITCHEN_SAUCES`](#kitchen_sauces) | 32 | Kitchens (sauces, meats, specific goods) |
| [`CAFETERIA`](#cafeteria) | 2 | Cafeterias & dining spaces |
| [`SAFEHOUSE_FOOD`](#safehouse_food) | 3 | Survivor shelters (food & supplies) |

## Overview — combos

A **combo** expands to the deduplicated union of two or more groups. Use it exactly like
a normal group in `dist.add()`; if it shares a container with another group you also
passed, CoreOS inserts the item only once.

| Combo | Expands to | Containers | Intended for |
|---|---|--:|---|
| [`POWER`](#power) | `ELECTRONIC` + `MECHANIC` | 26 | Power items, batteries, appliances |
| [`TACTICAL`](#tactical) | `MILITARY` + `SURVIVAL` | 27 | Field / tactical gear |
| [`COLD_STORAGE`](#cold_storage) | `FRIDGE` + `FREEZER` | 82 | All cold storage |
| [`COOKING`](#cooking) | `KITCHEN` + `STOVE` | 40 | The whole cooking environment |

---

# Location groups

## MILITARY
Military, police, prison and security storage. **17 containers:**
```
ArmyStorageElectronics, ArmyStorageOutfit, ArmyHangarTools, ArmyHangarMechanics,
ArmyStorageMedical, ArmySurplusTools, ArmySurplusMisc, ArmySurplusCases,
ArmySurplusBackpacks, ArmyBunkerLockers, ArmyBunkerStorage, PoliceStorageMechanics,
PoliceLockers, FireStorageTools, SecurityLockers, PrisonGuardLockers, RangerLockers
```

## SURVIVAL
Camping, hunting and survival-gear stores. **10 containers:**
```
SurvivalGear, CampingStoreGear, CampingStoreTools, CampingStoreLighting,
CampingStoreCases, CampingStoreBackpacks, CampingLockers, Hunter, HuntingLockers,
RangerTools
```

## ELECTRONIC
Electronics stores and tech containers. **14 containers:**
```
ElectronicStoreAppliances, ElectronicStoreHAMRadio, ElectronicStoreMisc,
ElectronicStoreCases, ElectronicStoreComputers, ElectronicStorePhones,
ElectronicStoreLights, GigamartHouseElectronics, GigamartLightbulb,
StoreShelfElectronics, CrateGenerator, GeneratorRoom, ElectricianTools,
WireFactoryElectric
```

## MEDICAL
Hospitals, clinics and medical storage. **6 containers:**
```
MedicalStorageDrugs, MedicalStorageTools, MedicalClinicTools, HospitalLockers,
ArmyBunkerMedical, SafehouseMedical
```

## INDUSTRIAL
Workshops, factories, hardware stores and industrial storage. **14 containers:**
```
FactoryLockers, GarageMechanics, GigamartTools, ToolStoreTools, ToolStoreMisc,
ToolFactoryTools, GarageTools, MetalShopTools, WeldingWorkshopTools,
CabinetFactoryTools, WireFactoryTools, RailYardTools, BarnTools,
ConstructionWorkerTools
```

## MECHANIC
Auto shops and car-part stores — includes battery shelves, ideal for car-battery-related
items. **12 containers:**
```
CarSupplyBatteries, CarSupplyTools, CarSupplyGasCans, MechanicShelfElectric,
MechanicShelfTools, MechanicShelfMisc, MechanicSpecial, MechanicTools, CrateMechanics,
StoreShelfMechanics, ToolCabinetMechanics, GarageMechanics
```

## CRATES
Generic storage crates. **13 containers:**
```
CrateElectronics, CrateFishing, CrateCamping, CrateFarming, CrateBatteries, CrateTools,
CrateToolsOld, CrateMechanics, CrateMetalLockers, CrateOfficeSupplies,
GroceryStorageCrate1, GroceryStorageCrate2, GroceryStorageCrate3
```

## SPECIAL
Unique / rare locations, gun & pawn shops, and safehouse gear (incl. mid/late tiers).
**11 containers:**
```
SafehouseArmor, SafehouseArmor_Mid, SafehouseArmor_Late, SafehouseLighting,
SafehouseLighting_Late, PostOfficeBoxes, PawnShopCases, PawnShopTools, GunStoreCounter,
GunStoreCases, SchoolLockers
```

## STORES
General stores, big-box stores, garden / fishing / BBQ retail. **9 containers:**
```
GigamartHousewares, GigamartBBQ, WildWestGeneralStore, GardenStoreMisc, GardenStoreTools,
GrillStoreBlackBBQ, GrillStoreRedBBQ, FishingStoreGear, FishingStoreBait
```

## BREAKROOM
Office and factory break rooms. **3 containers:**
```
BreakRoomCounter, BreakRoomShelves, OfficeShelfSupplies
```

## BAR
Bars, theatres and entertainment. **4 containers:**
```
BarCounterMisc, BarShelfLiquor, TheatreDrinks, TheatreSnacks
```

## FRIDGE
Residential and commercial refrigerators. **48 containers:**
```
FridgeGeneric, FridgeRich, FridgeOther, FridgeTrailerPark, FridgeBeer, FridgeBottles,
FridgeBreakRoom, FridgeDrugLab, FridgeFarmStorage, FridgeGarage, FridgeMedical,
FridgeOffice, FridgeSnacks, FridgeSoda, FridgeVIPLounge, FridgeWater, FridgeHoarder,
FridgeHunter, BackstageFridge, BakeryKitchenFridge, BandPracticeFridge,
BurgerKitchenFridge, CafeDiningFridge, CafeKitchenFridge, CafeteriaKitchenFridge,
CatfishKitchenFridge, ChineseKitchenFridge, CrepeKitchenFridge, DeepFryKitchenFridge,
DinerKitchenFridge, FishChipsKitchenFridge, HospitalRoomFridge, ItalianKitchenFridge,
JaysKitchenFridge, JuiceStandFridge, MexicanKitchenFridge, MotelFridge, NolansFridge,
PizzaKitchenFridge, RestaurantKitchenFridge, SafehouseFridge, SafehouseFridge_Mid,
SafehouseFridge_Late, SeafoodKitchenFridge, SpiffosKitchenFridge, SushiKitchenFridge,
UniversityFridge, WesternKitchenFridge
```

## FREEZER
Residential and commercial freezers. **34 containers:**
```
FreezerGeneric, FreezerRich, FreezerTrailerPark, FreezerDrugLab, FreezerFarmStorage,
FreezerGarage, FreezerHoarder, FreezerHunter, FreezerFrozenFood, FreezerIceCream,
CrateChestFreezer, ArenaKitchenFreezer, BakeryKitchenFreezer, BurgerKitchenFreezer,
ButcherFreezer, CafeteriaKitchenFreezer, CatfishKitchenFreezer, ChineseKitchenFreezer,
DeepFryKitchenFreezer, DinerKitchenFreezer, FishChipsKitchenFreezer, ItalianKitchenFreezer,
JaysKitchenFreezer, MexicanKitchenFreezer, PizzaKitchenFreezer, RestaurantKitchenFreezer,
SafehouseFreezer, SafehouseFreezer_Mid, SafehouseFreezer_Late, SeafoodKitchenFreezer,
SpiffosKitchenFreezer, SushiKitchenFreezer, TheatreKitchenFreezer, WesternKitchenFreezer
```

## STOVE
Residential and commercial stoves. **10 containers:**
```
StoveGeneric, StoveClassy, StoveRedneck, StoveSpiffos, DerelictHouseStove, SafehouseStove,
SafehouseStove_Mid, SafehouseStove_Late, WildWestWoodStove, CrateAntiqueStove
```

## KITCHEN
Kitchens — utensils, dishes and basic storage. **30 containers:**
```
ArenaKitchenCutlery, ArmyBunkerKitchen, BakeryKitchenBaking, BakeryKitchenCutlery,
BakeryKitchenStorage, BurgerKitchenCutlery, CafeKitchenSupplies, ChineseKitchenBaking,
ChineseKitchenCutlery, CrepeKitchenBaking, ItalianKitchenBaking, JaysKitchenBaking,
KitchenBaking, KitchenBreakfast, KitchenDishes, KitchenPots, KitchenRandom,
MexicanKitchenBaking, MexicanKitchenButcher, MexicanKitchenSauce, PizzaKitchenBaking,
SpiffosKitchenBaking, SpiffosKitchenSpecial, StoreKitchenBaking, StoreKitchenCutlery,
StoreKitchenPots, SushiKitchenBaking, SushiKitchenCutlery, WesternKitchenBaking,
WildWestKitchen
```

## KITCHEN_SAUCES
Kitchens — sauces, meats and specific goods. **32 containers:**
```
ArenaKitchenSauce, BurgerKitchenSauce, BurgerKitchenButcher, CafeKitchenCoffee,
CatfishKitchenButcher, ChineseKitchenSauce, ChineseKitchenButcher, DinerBackRoomCounter,
FishChipsKitchenSauce, FishChipsKitchenButcher, ItalianKitchenSauce, ItalianKitchenButcher,
JaysKitchenSauce, JaysKitchenButcher, KitchenBottles, KitchenCannedFood, KitchenDryFood,
PizzaKitchenSauce, PizzaKitchenButcher, PizzaKitchenCheese, SeafoodKitchenSauce,
SeafoodKitchenButcher, SpiffosKitchenSauce, SpiffosKitchenButcher, StoreKitchenSauce,
StoreKitchenButcher, StoreKitchenCafe, StoreKitchenDishes, SushiKitchenSauce,
SushiKitchenButcher, WesternKitchenSauce, WesternKitchenButcher
```

## CAFETERIA
Cafeterias and dining spaces. **2 containers:**
```
CafeteriaDrinks, CafeteriaSnacks
```

## SAFEHOUSE_FOOD
Survivor shelters — food and supplies (incl. mid/late tiers). **3 containers:**
```
SafehouseFood, SafehouseFood_Mid, SafehouseFood_Late
```

---

# Combos

## POWER
`ELECTRONIC` + `MECHANIC` → **26 containers**. Power items, batteries, appliances
(used by KR SolarOS). Union of the [ELECTRONIC](#electronic) and [MECHANIC](#mechanic)
container lists.

## TACTICAL
`MILITARY` + `SURVIVAL` → **27 containers**. Field / tactical gear. Union of the
[MILITARY](#military) and [SURVIVAL](#survival) container lists.

## COLD_STORAGE
`FRIDGE` + `FREEZER` → **82 containers**. All cold storage. Union of the
[FRIDGE](#fridge) and [FREEZER](#freezer) container lists.

## COOKING
`KITCHEN` + `STOVE` → **40 containers**. The whole cooking environment. Union of the
[KITCHEN](#kitchen) and [STOVE](#stove) container lists.
