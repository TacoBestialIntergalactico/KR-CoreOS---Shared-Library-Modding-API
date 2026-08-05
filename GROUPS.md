# KR CoreOS — Location Groups Reference

Full map of every location group and the exact `ProceduralDistributions.list` containers it expands to. A *group* is a named list of real in-game containers curated by theme, so you write `MEDICAL = 0.3` instead of naming containers by hand.

- **140 thematic groups** + **30 combos**, covering **all 1418 loot containers** in Build 42.20.
- Every container belongs to exactly **one** thematic group (no overlap); **combos** layer breadth on top with automatic dedupe and may reference other combos.
- Verified against the game's `ProceduralDistributions.lua`. Names absent in the running build are skipped silently.

## Overview — all groups

| Group | Containers | What it is |
|---|--:|---|
| [`ARMY`](#army) | 13 | Armed-forces storage: bases, bunkers, hangars and surplus stores |
| [`POLICE`](#police) | 7 | Police stations and sheriff's offices (lockers, evidence) |
| [`PRISON`](#prison) | 6 | Prison cells, intake and guard/riot storage |
| [`SECURITY`](#security) | 2 | Private / building security storage |
| [`FIREFIGHTER`](#firefighter) | 4 | Fire department stations (lockers and tools) |
| [`SURVIVAL_CAMPING`](#survival_camping) | 10 | Camping and hiking gear stores |
| [`SURVIVAL_HUNTING`](#survival_hunting) | 11 | Hunting, trapping, fishing and park-ranger gear |
| [`ELECTRONIC_GENERAL`](#electronic_general) | 9 | Electronics-store shelves, home appliances, lights, TVs and music |
| [`ELECTRONIC_COMPUTER`](#electronic_computer) | 7 | Computers: stores, cyber cafes and university/library computer labs |
| [`ELECTRONIC_PHONE`](#electronic_phone) | 1 | Phones |
| [`ELECTRONIC_RADIO`](#electronic_radio) | 3 | HAM radio, radio components and electrical wire |
| [`ELECTRONIC_POWER`](#electronic_power) | 2 | Generators, generator rooms and electrician gear (ideal home for KR SolarOS power devices) |
| [`MEDICAL_HOSPITAL`](#medical_hospital) | 8 | Hospital and medical-office facilities (rooms, lockers, laundry, bins) |
| [`MEDICAL_TOOLS`](#medical_tools) | 9 | Medical instruments and supplies (doctor, nurse, ambulance, morgue, clinic/storage tools, military and university medical) |
| [`MEDICAL_PHARMACY`](#medical_pharmacy) | 5 | Medications and drugstore retail (drug storage, cabinets, pharmacy shelves) |
| [`MEDICAL_OPTOMETRY`](#medical_optometry) | 3 | Optometrists and eyewear |
| [`MEDICAL_SAFEHOUSE`](#medical_safehouse) | 3 | Survivor-shelter medical caches (mid/late phases) |
| [`MEDICAL_DRUGLAB`](#medical_druglab) | 7 | Illicit drug production: labs, drug shacks and stashes |
| [`INDUSTRIAL_TOOLS`](#industrial_tools) | 21 | General hardware/tool stores, tool cabinets and factory tool caches |
| [`INDUSTRIAL_METALWORK`](#industrial_metalwork) | 15 | Blacksmithing, welding, metalworking and wire |
| [`INDUSTRIAL_WOODWORK`](#industrial_woodwork) | 5 | Carpentry, carving and furniture making |
| [`INDUSTRIAL_CRAFTS`](#industrial_crafts) | 13 | Artisan trades: cobbler, jeweler, clockwork, leather, pottery, glass, tailoring, sewing, painting, mannequins and dye |
| [`INDUSTRIAL_FACTORY`](#industrial_factory) | 15 | Product factories: food processing, knives, bats, golf, sinks |
| [`MECHANIC`](#mechanic) | 15 | Auto shops and car-part stores (ideal for car-battery-related items) |
| [`MECHANIC_CARPARTS`](#mechanic_carparts) | 31 | Replacement car parts: brakes, mufflers, suspension, tires, windows |
| [`MECHANIC_FUEL`](#mechanic_fuel) | 4 | Fuel and gas storage (cans, pumps, garage gas stores) |
| [`CRATES_CANFOOD`](#crates_canfood) | 5 | Crates of canned/preserved food and humanitarian aid |
| [`CRATES_FOOD`](#crates_food) | 45 | Crates of dry food, baking, snacks, condiments and pantry goods |
| [`CRATES_DRINKS`](#crates_drinks) | 5 | Crates of soft drinks and water |
| [`CRATES_LIQUOR`](#crates_liquor) | 3 | Crates of beer, wine and liquor |
| [`CRATES_KITCHEN`](#crates_kitchen) | 6 | Crates of kitchenware: dishes, trays, napkins, bags and cups |
| [`CRATES_APPLIANCES`](#crates_appliances) | 7 | Crates of appliances: ovens, stove, freezer, espresso machine |
| [`CRATES_ELECTRONIC`](#crates_electronic) | 6 | Crates of electronics: electronics, batteries, TV, PC, generator |
| [`CRATES_TOOLS`](#crates_tools) | 3 | Crates of tools and mechanics |
| [`CRATES_METAL`](#crates_metal) | 9 | Crates of metalwork: bars, pipes, sheet metal, sinks, chains |
| [`CRATES_MATERIALS`](#crates_materials) | 27 | Crates of construction and craft materials (wood, stone, clay, paint, leather, fabric, dye, pottery) |
| [`CRATES_FURNITURE`](#crates_furniture) | 40 | Crates of furniture: chairs, tables, linens, mannequins, toilets |
| [`CRATES_CLOTHING`](#crates_clothing) | 6 | Crates of clothing and footwear |
| [`CRATES_FARMING`](#crates_farming) | 6 | Crates of farming goods: feed, fertilizer, seeds, gardening, canning |
| [`CRATES_MEDIA`](#crates_media) | 5 | Crates of media: film, CDs, VHS, photos, instruments |
| [`CRATES_BOOKS`](#crates_books) | 9 | Crates of printed matter: books, comics, magazines, newspapers, bibles, maps |
| [`CRATES_SPORTS`](#crates_sports) | 10 | Crates of sports and games: balls, weights, golf, darts, pool |
| [`CRATES_MISC`](#crates_misc) | 13 | Miscellaneous crates: BBQ/charcoal, tobacco, hygiene, camping, fishing, pets, toys, office, merch |
| [`CRATES_TRASH`](#crates_trash) | 5 | Trash crates: empty bottles/cans, junk |
| [`SAFEHOUSE_GEAR`](#safehouse_gear) | 7 | Survivor-shelter survival caches: body armor, lighting and fireplaces (companion to SAFEHOUSE_FOOD / MEDICAL_SAFEHOUSE; mid/late phases) |
| [`LOCKERS`](#lockers) | 6 | Generic personal-storage lockers and mailboxes (random personal effects) |
| [`STASH`](#stash) | 8 | Hidden stashes and abandoned-house scavenge (plank stashes, derelict houses, pawned valuables) |
| [`STORES`](#stores) | 14 | General, convenience and gift stores (souvenirs, seasonal, checkout) |
| [`BREAKROOM`](#breakroom) | 3 | Break rooms and offices |
| [`BAR`](#bar) | 8 | Bars, theatres and entertainment |
| [`FRIDGE_HOME`](#fridge_home) | 19 | Residential fridges |
| [`FRIDGE_COMMERCIAL`](#fridge_commercial) | 20 | Commercial-kitchen and restaurant fridges |
| [`FRIDGE_SPECIAL`](#fridge_special) | 8 | Special fridges: medical, drug lab, safehouse, backstage |
| [`FREEZER_HOME`](#freezer_home) | 9 | Residential and store freezers |
| [`FREEZER_COMMERCIAL`](#freezer_commercial) | 19 | Commercial-kitchen and butcher freezers |
| [`FREEZER_SPECIAL`](#freezer_special) | 4 | Special freezers: drug lab, safehouse |
| [`STOVE`](#stove) | 9 | Residential and commercial stoves |
| [`KITCHEN_COOKWARE`](#kitchen_cookware) | 25 | Cooking implements: baking, cutlery, pots, knives |
| [`KITCHEN_TABLEWARE`](#kitchen_tableware) | 11 | Tableware: plates, cups, mugs, trays, dishwashers |
| [`KITCHEN_SUPPLIES`](#kitchen_supplies) | 14 | Kitchen supplies: bags, paper, cleaning, housewares, microwaves |
| [`KITCHEN_PANTRY`](#kitchen_pantry) | 5 | Kitchen pantry: bottles, canned goods, dry goods, breakfast |
| [`KITCHEN_SAUCES`](#kitchen_sauces) | 14 | Sauces and cheeses |
| [`KITCHEN_BUTCHER`](#kitchen_butcher) | 21 | Butchery: meat, cuts, smoked goods, tools |
| [`KITCHEN_BEVERAGE`](#kitchen_beverage) | 3 | Coffee and tea |
| [`CAFETERIA`](#cafeteria) | 5 | Cafeterias and dining spaces |
| [`SAFEHOUSE_FOOD`](#safehouse_food) | 3 | Shelters (food and supplies, includes mid/late phases) |
| [`AMMO`](#ammo) | 6 | Ammunition and reloading supplies |
| [`BOOKS_FICTION`](#books_fiction) | 12 | Genre fiction: crime, horror, literary, romance, thriller, western |
| [`BOOKS_SCIFI`](#books_scifi) | 2 | Science fiction and fantasy |
| [`BOOKS_NONFICTION`](#books_nonfiction) | 43 | Non-fiction / academic: science, history, business, legal, politics, philosophy, religion, occult, biography, reference |
| [`BOOKS_HOBBIES`](#books_hobbies) | 24 | Hobbies and trades: art, cinema, cooking, crafts, farming, sports, outdoors |
| [`BOOKS_COMICS`](#books_comics) | 9 | Comics, comic-store fantasy/sci-fi and tabletop games |
| [`BOOKS_NEWS`](#books_news) | 17 | Press: newspapers, magazines and magazine racks |
| [`BOOKS_CHILDS`](#books_childs) | 2 | Children books |
| [`BOOKS_GENERAL`](#books_general) | 16 | Generic books: counters, personal, stationery, misc, shelves |
| [`BOOKS_ELECTRONIC`](#books_electronic) | 2 | Electronics and computing manuals/magazines |
| [`BOOKS_MECHANIC`](#books_mechanic) | 9 | Mechanics, automotive and trade manuals (DIY, blacksmithing, carpentry) |
| [`BOOKS_MEDICAL`](#books_medical) | 5 | Medical literature |
| [`CLOTHING_STORE`](#clothing_store) | 20 | Clothing store (racks and general shelving) |
| [`CLOTHING_FOOTWEAR`](#clothing_footwear) | 8 | Footwear: boots, shoes, sneakers |
| [`CLOTHING_ACCESSORIES`](#clothing_accessories) | 9 | Accessories: gloves, eyewear, holsters, socks, headwear |
| [`CLOTHING_FORMAL`](#clothing_formal) | 7 | Formal wear, dresses, suits and weddings |
| [`CLOTHING_UNDERWEAR`](#clothing_underwear) | 6 | Underwear and lingerie |
| [`CLOTHING_UNIFORM`](#clothing_uniform) | 26 | Uniforms and work outfits (professions) |
| [`CLOTHING_ARMOR`](#clothing_armor) | 6 | Protection: body armor, helmets and boxing gloves |
| [`CLOTHING_HOME`](#clothing_home) | 14 | Residential wardrobes, dressers and closets |
| [`CLOTHING_OUTDOOR`](#clothing_outdoor) | 5 | Outdoor clothing: camping, winter, army-surplus cots |
| [`CLOTHING_MISC`](#clothing_misc) | 9 | Miscellaneous: display, band, lost-and-found, fashion |
| [`FARMING`](#farming) | 9 | Gardening, farming and homesteading |
| [`GUNFIRE_STORE`](#gunfire_store) | 13 | Gun stores (retail): counters, display cases, shelves, pistols/rifles/shotguns, accessories |
| [`GUNFIRE_MILITARY`](#gunfire_military) | 1 | Military armory |
| [`GUNFIRE_POLICE`](#gunfire_police) | 1 | Police armory |
| [`GUNFIRE_SWAT`](#gunfire_swat) | 1 | SWAT armory |
| [`GUNFIRE_PRISON`](#gunfire_prison) | 2 | Prison armory |
| [`GUNFIRE_RANGER`](#gunfire_ranger) | 1 | Park-ranger firearms |
| [`GUNFIRE_CRIMINAL`](#gunfire_criminal) | 5 | Illicit / black-market firearms: drug lab, pawn shop, garage, stashes |
| [`GUNFIRE_GENERIC`](#gunfire_generic) | 3 | Generic firearm spawns (phased) |
| [`FURNITURE_BEDROOM`](#furniture_bedroom) | 10 | Bedroom: nightstands, bedding, barracks lockers |
| [`FURNITURE_LIVING`](#furniture_living) | 11 | Living room: shelves, side tables, wall decor |
| [`FURNITURE_MISC`](#furniture_misc) | 5 | Miscellaneous furniture: changing rooms, generic shelves and side tables |
| [`GROCERY_PRODUCE`](#grocery_produce) | 37 | Fresh fruit and vegetables (stands and produce storage) |
| [`GROCERY_MEAT`](#grocery_meat) | 1 | Meat |
| [`GROCERY_BAKERY`](#grocery_bakery) | 6 | Bakery and pastries |
| [`GROCERY_SNACKS`](#grocery_snacks) | 6 | Snacks, candy, crisps, popcorn |
| [`GROCERY_PANTRY`](#grocery_pantry) | 7 | Pantry: canned, dry goods, sauces, spices, gourmet |
| [`GROCERY_BBQ`](#grocery_bbq) | 9 | Barbecue: charcoal, propane, grills, accessories |
| [`GROCERY_DRINKS`](#grocery_drinks) | 3 | Non-alcoholic drinks (sodas, juices) |
| [`GROCERY_PREPARED`](#grocery_prepared) | 48 | Prepared / fast food (serving trays) |
| [`GROCERY_TOBACCO`](#grocery_tobacco) | 9 | Tobacco and smoking articles |
| [`HOBBY`](#hobby) | 9 | Arts, crafts and hobby supplies |
| [`HYGIENE_BATHROOM`](#hygiene_bathroom) | 7 | Bathroom: cabinets, counters, shelves, bins |
| [`HYGIENE_LAUNDRY`](#hygiene_laundry) | 16 | Laundry: washers, dryers, loads, towels, suits |
| [`HYGIENE_COSMETICS`](#hygiene_cosmetics) | 10 | Cosmetics, personal care, salon/barber |
| [`HYGIENE_CLEANING`](#hygiene_cleaning) | 8 | Cleaning: cleaning supplies and janitorial |
| [`JEWELRY`](#jewelry) | 12 | Jewelry and precious goods |
| [`LIQUOR`](#liquor) | 23 | Liquor, wine and beer |
| [`MATERIALS`](#materials) | 2 | Building and raw materials |
| [`MEDIA_MUSIC`](#media_music) | 22 | Music: instruments, stores, school and band merch |
| [`MEDIA_FILM`](#media_film) | 5 | Cinema, video and photography |
| [`MEDIA_STAGE`](#media_stage) | 3 | Stage production / backstage |
| [`OFFICE_GENERAL`](#office_general) | 12 | Generic offices: desks, filing cabinets, counters |
| [`OFFICE_HOME`](#office_home) | 8 | Home offices and named-character desks |
| [`OFFICE_SCHOOL`](#office_school) | 4 | Classroom, kids and daycare desks |
| [`OFFICE_POLICE`](#office_police) | 5 | Police / sheriff desks and files |
| [`OFFICE_POST`](#office_post) | 2 | Post office (parcels and supplies) |
| [`OFFICE_UNIVERSITY`](#office_university) | 37 | University desks and filing cabinets by faculty |
| [`PET`](#pet) | 1 | Pet supplies and pet food |
| [`RELIGION`](#religion) | 1 | Churches and religious items |
| [`SCHOOL`](#school) | 9 | Schools and universities |
| [`SCIENCE`](#science) | 11 | Science, labs and museums |
| [`SPORTS_STORE`](#sports_store) | 19 | Sporting-goods store (retail): balls, racquets, clubs, weights, footwear |
| [`SPORTS_GYM`](#sports_gym) | 9 | Gym and fitness: weights, mats, towels, locker rooms |
| [`SPORTS_VENUE`](#sports_venue) | 10 | Sports venues: bowling, boxing, golf, equestrian, carnival |
| [`TOYS`](#toys) | 4 | Toys and games |
| [`TRASH`](#trash) | 17 | Bins, dumpsters and junk |
| [`WEAPONS`](#weapons) | 6 | Melee and improvised weapons |
| [`RESTAURANT`](#restaurant) | 3 | Dining / restaurant and cafe counters (front-of-house and menus) |
| [`SPA`](#spa) | 2 | Spas (cabinets and counters) |
| [`SPIFFO`](#spiffo) | 15 | Brand group: all Spiffo (the PZ mascot/chain) loot tables, gathered apart from their context (kitchen, fridge, office, etc.). |
| [`OTHER`](#other) | 7 | Miscellaneous / uncategorized containers (deliberate catch-all) |

## Overview — combos

| Combo | Expands to | Notes |
|---|---|---|
| `ELECTRONIC` | `ELECTRONIC_GENERAL` + `ELECTRONIC_COMPUTER` + `ELECTRONIC_PHONE` + `ELECTRONIC_RADIO` + `ELECTRONIC_POWER` | All electronics: stores, tech, generators and power gear |
| `MEDICAL` | `MEDICAL_HOSPITAL` + `MEDICAL_TOOLS` + `MEDICAL_PHARMACY` + `MEDICAL_OPTOMETRY` + `MEDICAL_SAFEHOUSE` + `MEDICAL_DRUGLAB` | All medical: hospital, tools, pharmacy, optometry, safehouse, drug labs |
| `INDUSTRIAL` | `INDUSTRIAL_TOOLS` + `INDUSTRIAL_METALWORK` + `INDUSTRIAL_WOODWORK` + `INDUSTRIAL_CRAFTS` + `INDUSTRIAL_FACTORY` | All industrial: tools, metalwork, woodwork, crafts, factories |
| `AUTOMOTIVE` | `MECHANIC` + `MECHANIC_CARPARTS` + `MECHANIC_FUEL` | All mechanic: shop, car parts and fuel storage |
| `SURVIVAL` | `SURVIVAL_CAMPING` + `SURVIVAL_HUNTING` | Camping + hunting gear |
| `BOOKS` | `BOOKS_FICTION` + `BOOKS_SCIFI` + `BOOKS_NONFICTION` + `BOOKS_HOBBIES` + `BOOKS_COMICS` + `BOOKS_NEWS` + `BOOKS_CHILDS` + `BOOKS_GENERAL` + `BOOKS_ELECTRONIC` + `BOOKS_MECHANIC` + `BOOKS_MEDICAL` | All printed matter, every subject and type |
| `CLOTHING` | `CLOTHING_STORE` + `CLOTHING_FOOTWEAR` + `CLOTHING_ACCESSORIES` + `CLOTHING_FORMAL` + `CLOTHING_UNDERWEAR` + `CLOTHING_UNIFORM` + `CLOTHING_ARMOR` + `CLOTHING_HOME` + `CLOTHING_OUTDOOR` + `CLOTHING_MISC` | All clothing, footwear and accessories |
| `GROCERY` | `GROCERY_PRODUCE` + `GROCERY_MEAT` + `GROCERY_BAKERY` + `GROCERY_SNACKS` + `GROCERY_PANTRY` + `GROCERY_BBQ` + `GROCERY_DRINKS` + `GROCERY_PREPARED` + `GROCERY_TOBACCO` | All food and provisions by type |
| `GUNFIRE` | `GUNFIRE_STORE` + `GUNFIRE_MILITARY` + `GUNFIRE_POLICE` + `GUNFIRE_SWAT` + `GUNFIRE_PRISON` + `GUNFIRE_RANGER` + `GUNFIRE_CRIMINAL` + `GUNFIRE_GENERIC` | All firearms by source |
| `FIREARMS` | `GUNFIRE` | Alias of GUNFIRE |
| `OFFICE` | `OFFICE_GENERAL` + `OFFICE_HOME` + `OFFICE_SCHOOL` + `OFFICE_POLICE` + `OFFICE_POST` + `OFFICE_UNIVERSITY` | All desks and filing by context |
| `HYGIENE` | `HYGIENE_BATHROOM` + `HYGIENE_LAUNDRY` + `HYGIENE_COSMETICS` + `HYGIENE_CLEANING` | Bathroom, laundry, cosmetics and cleaning |
| `KITCHEN` | `KITCHEN_COOKWARE` + `KITCHEN_TABLEWARE` + `KITCHEN_SUPPLIES` + `KITCHEN_PANTRY` + `KITCHEN_SAUCES` + `KITCHEN_BUTCHER` + `KITCHEN_BEVERAGE` | All kitchen: cookware, tableware, pantry, sauces, butcher, drinks |
| `SPORTS` | `SPORTS_STORE` + `SPORTS_GYM` + `SPORTS_VENUE` | Sporting-goods stores, gyms and venues |
| `MEDIA` | `MEDIA_MUSIC` + `MEDIA_FILM` + `MEDIA_STAGE` | Music, film/photo and stage |
| `FURNITURE` | `FURNITURE_BEDROOM` + `FURNITURE_LIVING` + `FURNITURE_MISC` | Bedroom, living-room and misc furniture |
| `FRIDGE` | `FRIDGE_HOME` + `FRIDGE_COMMERCIAL` + `FRIDGE_SPECIAL` | All fridges (home, commercial, special) |
| `FREEZER` | `FREEZER_HOME` + `FREEZER_COMMERCIAL` + `FREEZER_SPECIAL` | All freezers (home, commercial, special) |
| `CRATES` | `CRATES_CANFOOD` + `CRATES_FOOD` + `CRATES_DRINKS` + `CRATES_LIQUOR` + `CRATES_KITCHEN` + `CRATES_APPLIANCES` + `CRATES_ELECTRONIC` + `CRATES_TOOLS` + `CRATES_METAL` + `CRATES_MATERIALS` + `CRATES_FURNITURE` + `CRATES_CLOTHING` + `CRATES_FARMING` + `CRATES_MEDIA` + `CRATES_BOOKS` + `CRATES_SPORTS` + `CRATES_MISC` + `CRATES_TRASH` | The whole warehouse-crate family (18 groups) |
| `SPECIAL` | `SAFEHOUSE_GEAR` + `LOCKERS` + `STASH` | Safehouse gear, lockers and stashes (rebuilds the old SPECIAL) |
| `WAREHOUSE` | `CRATES` | Alias of CRATES: all storage crates |
| `COLD_STORAGE` | `FRIDGE` + `FREEZER` | Fridges + freezers |
| `COOKING` | `KITCHEN` + `STOVE` | Full kitchen environment + stoves |
| `POWER` | `ELECTRONIC_POWER` + `CRATES_ELECTRONIC` + `MECHANIC` | Generator/electrical + electronic crates + auto (ideal for KR SolarOS) |
| `FOOD` | `GROCERY` + `FRIDGE` + `FREEZER` + `CAFETERIA` + `SAFEHOUSE_FOOD` + `RESTAURANT` + `CRATES_CANFOOD` + `CRATES_FOOD` + `CRATES_DRINKS` | Groceries + cold storage + food crates + dining |
| `MILITARY` | `ARMY` + `GUNFIRE_MILITARY` | Army storage + military firearms |
| `TACTICAL` | `ARMY` + `SURVIVAL` + `GUNFIRE_MILITARY` + `GUNFIRE_RANGER` + `CLOTHING_OUTDOOR` | Army + survival + military/ranger firearms + outdoor clothing |
| `WARZONE` | `GUNFIRE` + `AMMO` + `WEAPONS` + `CLOTHING_ARMOR` | Firearms + ammo + melee weapons + body armor |
| `LAW` | `POLICE` + `PRISON` + `SECURITY` + `GUNFIRE_POLICE` + `GUNFIRE_SWAT` + `GUNFIRE_PRISON` + `OFFICE_POLICE` | Police, prison, security + their firearms and desks |
| `WORKSHOP` | `INDUSTRIAL` + `MECHANIC` + `MECHANIC_CARPARTS` + `MATERIALS` + `CRATES_TOOLS` + `CRATES_METAL` + `CRATES_MATERIALS` | Industrial + mechanic + materials + tool/metal/material crates |

---

## ARMY
Armed-forces storage: bases, bunkers, hangars and surplus stores. **13 containers:**

```
ArmyStorageElectronics, ArmyStorageOutfit, ArmyStorageMedical, ArmyHangarTools,
ArmyHangarMechanics, ArmyBunkerLockers, ArmyBunkerStorage, ArmySurplusTools, ArmySurplusMisc,
ArmySurplusCases, ArmySurplusBackpacks, ArmySurplusSnacks, ArmySurplusWater
```

## POLICE
Police stations and sheriff's offices (lockers, evidence). **7 containers:**

```
PoliceTools, PoliceStateTools, PoliceStorageMechanics, PoliceLockers, PoliceCaptainCabinet,
PoliceEvidence, WildWestSheriffLocker
```

## PRISON
Prison cells, intake and guard/riot storage. **6 containers:**

```
PrisonGuardLockers, PrisonCellRandom, PrisonCellRandomClassy, PrisonIntakeLockers,
PrisonIntakePersonalObjects, PrisonRiotStorage
```

## SECURITY
Private / building security storage. **2 containers:**

```
SecurityLockers, SecurityStorage
```

## FIREFIGHTER
Fire department stations (lockers and tools). **4 containers:**

```
FireStorageTools, FireDeptLockers, FiremanTools, ForestFireTools
```

## SURVIVAL_CAMPING
Camping and hiking gear stores. **10 containers:**

```
SurvivalGear, CampingStoreGear, CampingStoreTools, CampingStoreLighting, CampingStoreCases,
CampingStoreBackpacks, CampingStoreSleepingBags, CampingStoreTents, CampingLockers, Hiker
```

## SURVIVAL_HUNTING
Hunting, trapping, fishing and park-ranger gear. **11 containers:**

```
FishingStoreGear, FishingStoreBait, SafehouseTraps, Hunter, HuntingLockers, Trapper,
FishingLockers, RangerTools, RangerStorageTraps, RangerLockers, FishermanTools
```

## ELECTRONIC_GENERAL
Electronics-store shelves, home appliances, lights, TVs and music. **9 containers:**

```
ElectronicStoreAppliances, ElectronicStoreMisc, ElectronicStoreCases, ElectronicStoreLights,
ElectronicStoreMusic, GigamartHouseElectronics, GigamartLightbulb, StoreShelfElectronics,
CarLightbars
```

## ELECTRONIC_COMPUTER
Computers: stores, cyber cafes and university/library computer labs. **7 containers:**

```
ElectronicStoreComputers, CyberCafeDesk, CyberCafeFilingCabinet, LibraryComputer,
UniversityDesk_Computer, UniversityFilingCabinet_Computer, UniversityLibraryComputer
```

## ELECTRONIC_PHONE
Phones. **1 container:**

```
ElectronicStorePhones
```

## ELECTRONIC_RADIO
HAM radio, radio components and electrical wire. **3 containers:**

```
ElectronicStoreHAMRadio, RadioFactoryComponents, WireFactoryElectric
```

## ELECTRONIC_POWER
Generators, generator rooms and electrician gear (ideal home for KR SolarOS power devices). **2 containers:**

```
GeneratorRoom, ElectricianTools
```

## MEDICAL_HOSPITAL
Hospital and medical-office facilities (rooms, lockers, laundry, bins). **8 containers:**

```
HospitalLockers, HospitalRoomCleaning, HospitalRoomCounter, HospitalRoomShelves, BinHospital,
LaundryHospital, MedicalOfficeCounter, MedicalOfficeDesk
```

## MEDICAL_TOOLS
Medical instruments and supplies (doctor, nurse, ambulance, morgue, clinic/storage tools, military and university medical). **9 containers:**

```
MedicalStorageTools, MedicalClinicTools, NurseTools, AmbulanceDriverTools, DoctorTools,
MorgueTools, ArmyBunkerMedical, UniversityDesk_Medical, UniversityFilingCabinet_Medical
```

## MEDICAL_PHARMACY
Medications and drugstore retail (drug storage, cabinets, pharmacy shelves). **5 containers:**

```
MedicalStorageDrugs, MedicalClinicDrugs, MedicalCabinet, PharmacyCosmetics, StoreShelfMedical
```

## MEDICAL_OPTOMETRY
Optometrists and eyewear. **3 containers:**

```
OptometristDesk, OptometristGlasses, PharmacyGlasses
```

## MEDICAL_SAFEHOUSE
Survivor-shelter medical caches (mid/late phases). **3 containers:**

```
SafehouseMedical, SafehouseMedical_Mid, SafehouseMedical_Late
```

## MEDICAL_DRUGLAB
Illicit drug production: labs, drug shacks and stashes. **7 containers:**

```
DerelictHouseDrugs, DrugLabMoney, DrugLabSupplies, DrugShackDrugs, DrugShackMisc, DrugShackTools,
DrugShackWeapons
```

## INDUSTRIAL_TOOLS
General hardware/tool stores, tool cabinets and factory tool caches. **21 containers:**

```
PawnShopTools, FactoryLockers, GigamartTools, ToolStoreTools, ToolStoreMisc, ToolStoreAccessories,
ToolStoreHandles, ToolStoreKeymaking, ToolFactoryTools, ToolFactoryHandles, GarageTools,
EngineerTools, ConstructionWorkerTools, BarnTools, RailYardTools, CabinetFactoryTools,
WireFactoryTools, LoggingFactoryTools, BurglarTools, AnthropologyDisplayTools, MedievalTools
```

## INDUSTRIAL_METALWORK
Blacksmithing, welding, metalworking and wire. **15 containers:**

```
BlacksmithMolds, BlacksmithTools, WildWestBlacksmith, MetalShopTools, MetalWorkerTools,
WeldingWorkshopTools, WeldingWorkshopFuel, WeldingWorkshopMetal, ToolStoreMetalwork,
ToolFactoryBarStock, ToolFactoryIngots, ToolFactorySawBlades, RailYardSpikes, WireFactoryBarbed,
WireFactoryBasic
```

## INDUSTRIAL_WOODWORK
Carpentry, carving and furniture making. **5 containers:**

```
CarpenterTools, CarvingWorkshopMaterials, CarvingWorkshopTools, FurnitureFactoryTools,
ToolStoreCarpentry
```

## INDUSTRIAL_CRAFTS
Artisan trades: cobbler, jeweler, clockwork, leather, pottery, glass, tailoring, sewing, painting, mannequins and dye. **13 containers:**

```
CobblerTools, JewelerTools, ClockRepairTools, LeatherworkingTools, PotteryStudioTools,
GlassWorkshopTools, TailoringTools, SewingStoreTools, PaintStudioTools, ToolStorePaint,
MannequinFactoryPaint, MannequinFactoryTools, KnappingTools
```

## INDUSTRIAL_FACTORY
Product factories: food processing, knives, bats, golf, sinks. **15 containers:**

```
BatFactoryBats, DogFoodFactoryBags, DogFoodFactoryBones, DogFoodFactoryCans,
DogFoodFactoryEquipment, FryFactoryPotatoes, GolfFactoryTools, JerkyFactoryMeat,
JerkyFactorySpices, JerkyFactoryTools, KnifeFactoryHandles, KnifeFactoryMeatCleaver,
KnifeFactoryMeatCleaverBlades, KnifeFactorySushiKnife, KnifeFactoryTools
```

## MECHANIC
Auto shops and car-part stores (ideal for car-battery-related items). **15 containers:**

```
CarSupplyBatteries, CarSupplyTools, MechanicShelfElectric, MechanicShelfTools, MechanicShelfMisc,
MechanicSpecial, MechanicTools, StoreShelfMechanics, ToolCabinetMechanics, GarageMechanics,
GarageCarpentry, GarageMetalwork, CarDealerDesk, CarDealerFilingCabinet, FireStorageMechanics
```

## MECHANIC_CARPARTS
Replacement car parts: brakes, mufflers, suspension, tires, windows. **31 containers:**

```
CarBrakesModern1, CarBrakesModern2, CarBrakesModern3, CarBrakesNormal1, CarBrakesNormal2,
CarBrakesNormal3, CarMufflerModern1, CarMufflerModern2, CarMufflerModern3, CarMufflerNormal1,
CarMufflerNormal2, CarMufflerNormal3, CarSuspensionModern1, CarSuspensionModern2,
CarSuspensionModern3, CarSuspensionNormal1, CarSuspensionNormal2, CarSuspensionNormal3,
CarTiresModern1, CarTiresModern2, CarTiresModern3, CarTiresNormal1, CarTiresNormal2,
CarTiresNormal3, CarWindows1, CarWindows2, CarWindows3, MechanicShelfBrakes, MechanicShelfMufflers,
MechanicShelfSuspension, MechanicShelfWheels
```

## MECHANIC_FUEL
Fuel and gas storage (cans, pumps, garage gas stores). **4 containers:**

```
CarSupplyGasCans, GasStorageCombo, GasStorageMechanics, LaboratoryGasStorage
```

## CRATES_CANFOOD
Crates of canned/preserved food and humanitarian aid. **5 containers:**

```
CrateCannedFood, CrateCannedFoodSpoiled, CrateCannedTomato, CrateTomatoPaste, CrateHumanitarian
```

## CRATES_FOOD
Crates of dry food, baking, snacks, condiments and pantry goods. **45 containers:**

```
CrateBakingSoda, CrateBunsBurger, CrateBunsHotdog, CrateButter, CrateCandyPackage, CrateCereal,
CrateChips, CrateChocolate, CrateChocolateChips, CrateCocoaPowder, CrateCoffee, CrateCondiments,
CrateConesIceCream, CrateCornflour, CrateCrackers, CrateEggs, CrateFlour, CrateGrahamCrackers,
CrateGravyMix, CrateGum, CrateHotsauce, CrateMacaroni, CrateMapleSyrup, CrateMarinara,
CrateMarshmallows, CrateOilOlive, CrateOilVegetable, CratePancakeMix, CratePasta, CratePeanuts,
CratePopcorn, CrateRice, CrateRiceVinegar, CrateSeaweed, CrateSoysauce, CrateSugar,
CrateSugarBrown, CrateTacoShells, CrateTea, CrateTortillaChips, CrateYeast, GroceryStorageCrate1,
GroceryStorageCrate2, GroceryStorageCrate3, JerkyFactoryCrate
```

## CRATES_DRINKS
Crates of soft drinks and water. **5 containers:**

```
CrateCoke, CrateSodaBottles, CrateSodaCans, CrateWaterBottle, CrateWaterDispenserBottle
```

## CRATES_LIQUOR
Crates of beer, wine and liquor. **3 containers:**

```
CrateBeer, CrateLiquor, CrateWine
```

## CRATES_KITCHEN
Crates of kitchenware: dishes, trays, napkins, bags and cups. **6 containers:**

```
CrateDishes, CrateFountainCups, CrateNapkins, CratePaperBagJays, CratePaperNapkins,
CratePlasticTrays
```

## CRATES_APPLIANCES
Crates of appliances: ovens, stove, freezer, espresso machine. **7 containers:**

```
CrateAntiqueStove, CrateChestFreezer, CrateEspressoMachine, CrateGreenOven, CrateGreyOven,
CrateModernOven, CrateRedOven
```

## CRATES_ELECTRONIC
Crates of electronics: electronics, batteries, TV, PC, generator. **6 containers:**

```
CrateBatteries, CrateComputer, CrateElectronics, CrateGenerator, CrateTV, CrateTVWide
```

## CRATES_TOOLS
Crates of tools and mechanics. **3 containers:**

```
CrateMechanics, CrateTools, CrateToolsOld
```

## CRATES_METAL
Crates of metalwork: bars, pipes, sheet metal, sinks, chains. **9 containers:**

```
CrateBlacksmithing, CrateChromeSinks, CrateHeavyChains, CrateIndustrialSinks, CrateMetalBars,
CrateMetalPipes, CrateMetalwork, CrateSheetMetal, CrateWhiteSinks
```

## CRATES_MATERIALS
Crates of construction and craft materials (wood, stone, clay, paint, leather, fabric, dye, pottery). **27 containers:**

```
CrateCarpentry, CrateClayBags, CrateClayBricks, CrateConcrete, CrateFabric_Cotton,
CrateFabric_DenimBlack, CrateFabric_DenimBlue, CrateFabric_DenimDarkBlue, CrateFlintNodules,
CrateGravelBags, CrateIndustrialDye, CrateLargeStone, CrateLeather, CrateLeatherLarge,
CrateLimestoneCrushed, CrateLongStick, CrateLumber, CrateMasonry, CratePaint, CratePlaster,
CratePottery, CrateSandBags, CrateStoneBlocks, CrateStones, CrateTailoring, CrateWallFinish,
CrateWallpaper
```

## CRATES_FURNITURE
Crates of furniture: chairs, tables, linens, mannequins, toilets. **40 containers:**

```
CrateBlueComfyChair, CrateBluePlasticChairs, CrateBlueRattanChair, CrateBrownComfyChair,
CrateBrownLowTables, CrateDarkBlueChairs, CrateDarkWoodenChairs, CrateFancyBlackChairs,
CrateFancyDarkTables, CrateFancyLowTables, CrateFancyToilets, CrateFancyWhiteChairs,
CrateFoldingChairs, CrateGreenChairs, CrateGreenComfyChair, CrateGreyChairs, CrateGreyComfyChair,
CrateLightRoundTable, CrateLinens, CrateLongTables, CrateMannequins, CrateMetalLockers,
CrateOakRoundTable, CrateOfficeChairs, CrateOrangeModernChair, CratePlasticChairs,
CratePlasticLowTables, CratePurpleRattanChair, CratePurpleWoodenChairs, CrateRedChairs,
CrateRedWoodenChairs, CrateRoundTable, CrateSkeletonDisplay, CrateSmallTables,
CrateWhiteComfyChair, CrateWhiteSimpleChairs, CrateWhiteWoodenChairs, CrateWoodenChairs,
CrateWoodenStools, CrateYellowModernChair
```

## CRATES_CLOTHING
Crates of clothing and footwear. **6 containers:**

```
CrateBootsArmy, CrateBootsArmyDesert, CrateBootsOld, CrateClothesRandom, CrateCostume,
CrateFootwearRandom
```

## CRATES_FARMING
Crates of farming goods: feed, fertilizer, seeds, gardening, canning. **6 containers:**

```
CrateAnimalFeed, CrateCanning, CrateFarming, CrateFertilizer, CrateGardening, CrateSunflowerSeeds
```

## CRATES_MEDIA
Crates of media: film, CDs, VHS, photos, instruments. **5 containers:**

```
CrateCameraFilm, CrateCompactDiscs, CrateInstruments, CratePhotos, CrateVHSTapes
```

## CRATES_BOOKS
Crates of printed matter: books, comics, magazines, newspapers, bibles, maps. **9 containers:**

```
CrateBibles, CrateBooks, CrateBooksSchool, CrateComics, CrateMagazines, CrateMaps, CrateMapsLarge,
CrateNewspapers, CrateNewspapersNew
```

## CRATES_SPORTS
Crates of sports and games: balls, weights, golf, darts, pool. **10 containers:**

```
BarCrateDarts, BarCratePool, CrateBaseballs, CrateBasketballs, CrateFitnessWeights, CrateFootballs,
CrateGolfBalls, CrateGolfClubs, CrateSoccerBalls, CrateSports
```

## CRATES_MISC
Miscellaneous crates: BBQ/charcoal, tobacco, hygiene, camping, fishing, pets, toys, office, merch. **13 containers:**

```
CrateBlackBBQ, CrateCamping, CrateCharcoal, CrateCigarettes, CrateFishing, CrateOfficeSupplies,
CratePetSupplies, CratePropane, CrateRedBBQ, CrateSalonSupplies, CrateToiletPaper, CrateToys,
CrateWallets
```

## CRATES_TRASH
Trash crates: empty bottles/cans, junk. **5 containers:**

```
CrateEmptyBottles1, CrateEmptyBottles2, CrateEmptyMixed, CrateEmptyTinCans, CrateRandomJunk
```

## SAFEHOUSE_GEAR
Survivor-shelter survival caches: body armor, lighting and fireplaces (companion to SAFEHOUSE_FOOD / MEDICAL_SAFEHOUSE; mid/late phases). **7 containers:**

```
SafehouseArmor, SafehouseArmor_Mid, SafehouseArmor_Late, SafehouseLighting, SafehouseLighting_Late,
SafehouseFireplace, SafehouseFireplace_Late
```

## LOCKERS
Generic personal-storage lockers and mailboxes (random personal effects). **6 containers:**

```
Locker, LockerClassy, PoolLockers, SchoolLockers, SeasonalWorkerLockers, PostOfficeBoxes
```

## STASH
Hidden stashes and abandoned-house scavenge (plank stashes, derelict houses, pawned valuables). **8 containers:**

```
MayorWestPointSafe, PlankStashGold, PlankStashMisc, PlankStashMoney, DerelictHouseCrime,
DerelictHouseParty, DerelictHouseSquatter, PawnShopCases
```

## STORES
General, convenience and gift stores (souvenirs, seasonal, checkout). **14 containers:**

```
WildWestGeneralStore, WildWestShelves, WildWestSouveniers, GasStoreEmergency, GasStoreSpecial,
GiftStoreCards, GiftStoreFancy, Gifts, HolidayStuff, StoreCounterBags, StoreCounterBagsFancy,
StoreCounterBagsPaper, StoreCounterStrawsNapkins, StoreShelfCombo
```

## BREAKROOM
Break rooms and offices. **3 containers:**

```
BreakRoomCounter, BreakRoomShelves, OfficeShelfSupplies
```

## BAR
Bars, theatres and entertainment. **8 containers:**

```
WildWestBarCounter, WildWestBarShelf, BarCounterMisc, BarShelfLiquor, TheatreDrinks, TheatreSnacks,
BarCounterGlasses, BarCounterWeapon
```

## FRIDGE_HOME
Residential fridges. **19 containers:**

```
FridgeBeer, FridgeBottles, FridgeBreakRoom, FridgeFarmStorage, FridgeGarage, FridgeGeneric,
FridgeHoarder, FridgeHunter, FridgeOffice, FridgeOther, FridgeRich, FridgeSnacks, FridgeSoda,
FridgeTrailerPark, FridgeVIPLounge, FridgeWater, MotelFridge, NolansFridge, UniversityFridge
```

## FRIDGE_COMMERCIAL
Commercial-kitchen and restaurant fridges. **20 containers:**

```
BakeryKitchenFridge, BurgerKitchenFridge, CafeDiningFridge, CafeKitchenFridge,
CafeteriaKitchenFridge, CatfishKitchenFridge, ChineseKitchenFridge, CrepeKitchenFridge,
DeepFryKitchenFridge, DinerKitchenFridge, FishChipsKitchenFridge, ItalianKitchenFridge,
JaysKitchenFridge, JuiceStandFridge, MexicanKitchenFridge, PizzaKitchenFridge,
RestaurantKitchenFridge, SeafoodKitchenFridge, SushiKitchenFridge, WesternKitchenFridge
```

## FRIDGE_SPECIAL
Special fridges: medical, drug lab, safehouse, backstage. **8 containers:**

```
BackstageFridge, BandPracticeFridge, FridgeDrugLab, FridgeMedical, HospitalRoomFridge,
SafehouseFridge, SafehouseFridge_Late, SafehouseFridge_Mid
```

## FREEZER_HOME
Residential and store freezers. **9 containers:**

```
FreezerFarmStorage, FreezerFrozenFood, FreezerGarage, FreezerGeneric, FreezerHoarder,
FreezerHunter, FreezerIceCream, FreezerRich, FreezerTrailerPark
```

## FREEZER_COMMERCIAL
Commercial-kitchen and butcher freezers. **19 containers:**

```
ArenaKitchenFreezer, BakeryKitchenFreezer, BurgerKitchenFreezer, ButcherFreezer,
CafeteriaKitchenFreezer, CatfishKitchenFreezer, ChineseKitchenFreezer, DeepFryKitchenFreezer,
DinerKitchenFreezer, FishChipsKitchenFreezer, ItalianKitchenFreezer, JaysKitchenFreezer,
MexicanKitchenFreezer, PizzaKitchenFreezer, RestaurantKitchenFreezer, SeafoodKitchenFreezer,
SushiKitchenFreezer, TheatreKitchenFreezer, WesternKitchenFreezer
```

## FREEZER_SPECIAL
Special freezers: drug lab, safehouse. **4 containers:**

```
FreezerDrugLab, SafehouseFreezer, SafehouseFreezer_Late, SafehouseFreezer_Mid
```

## STOVE
Residential and commercial stoves. **9 containers:**

```
StoveGeneric, StoveClassy, StoveRedneck, DerelictHouseStove, SafehouseStove, SafehouseStove_Mid,
SafehouseStove_Late, WildWestWoodStove, BakeryKitchenStove
```

## KITCHEN_COOKWARE
Cooking implements: baking, cutlery, pots, knives. **25 containers:**

```
ArenaKitchenCutlery, BakeryKitchenBaking, BakeryKitchenCutlery, BurgerKitchenCutlery, ChefTools,
ChineseKitchenBaking, ChineseKitchenCutlery, CrepeKitchenBaking, GigamartPots,
ItalianKitchenBaking, JaysKitchenBaking, KitchenBaking, KitchenPots, KnifeFactoryCutlery,
KnifeFactoryKitchenKnife, KnifeFactoryKitchenKnifeBlades, KnifeStoreCutlery, MexicanKitchenBaking,
PizzaKitchenBaking, StoreKitchenBaking, StoreKitchenCutlery, StoreKitchenPots, SushiKitchenBaking,
SushiKitchenCutlery, WesternKitchenBaking
```

## KITCHEN_TABLEWARE
Tableware: plates, cups, mugs, trays, dishwashers. **11 containers:**

```
BakeryKitchenTrays, CafeKitchenMugs, DishCabinetGeneric, DishCabinetLiquor, DishCabinetVIPLounge,
DishwasherGeneric, KitchenDishes, StoreKitchenCups, StoreKitchenDishes, StoreKitchenGlasses,
StoreKitchenTrays
```

## KITCHEN_SUPPLIES
Kitchen supplies: bags, paper, cleaning, housewares, microwaves. **14 containers:**

```
ArmyBunkerKitchen, BakeryKitchenStorage, CafeKitchenSupplies, CafeteriaKitchenLaundry,
DinerBackRoomCounter, GigamartHousewares, GigamartPaper, JaysKitchenBags, KitchenBook,
KitchenMicrowave, KitchenRandom, StoreKitchenBags, StoreKitchenCleaning, WildWestKitchen
```

## KITCHEN_PANTRY
Kitchen pantry: bottles, canned goods, dry goods, breakfast. **5 containers:**

```
KitchenBottles, KitchenBreakfast, KitchenCannedFood, KitchenDryFood, StoreKitchenPotatoes
```

## KITCHEN_SAUCES
Sauces and cheeses. **14 containers:**

```
ArenaKitchenSauce, BurgerKitchenSauce, ChineseKitchenSauce, CrepeKitchenSauce,
FishChipsKitchenSauce, ItalianKitchenSauce, JaysKitchenSauce, MexicanKitchenSauce,
PizzaKitchenCheese, PizzaKitchenSauce, SeafoodKitchenSauce, StoreKitchenSauce, SushiKitchenSauce,
WesternKitchenSauce
```

## KITCHEN_BUTCHER
Butchery: meat, cuts, smoked goods, tools. **21 containers:**

```
BurgerKitchenButcher, ButcherChicken, ButcherChops, ButcherFish, ButcherGround, ButcherLiterature,
ButcherSmoked, ButcherSnacks, ButcherSpices, ButcherTools, CatfishKitchenButcher,
ChineseKitchenButcher, FishChipsKitchenButcher, ItalianKitchenButcher, JaysKitchenButcher,
MexicanKitchenButcher, PizzaKitchenButcher, SeafoodKitchenButcher, StoreKitchenButcher,
SushiKitchenButcher, WesternKitchenButcher
```

## KITCHEN_BEVERAGE
Coffee and tea. **3 containers:**

```
CafeKitchenCoffee, CafeKitchenTea, StoreKitchenCafe
```

## CAFETERIA
Cafeterias and dining spaces. **5 containers:**

```
CafeteriaDrinks, CafeteriaSnacks, CafeteriaFruit, CafeteriaSandwiches, CafeteriaTrays
```

## SAFEHOUSE_FOOD
Shelters (food and supplies, includes mid/late phases). **3 containers:**

```
SafehouseFood, SafehouseFood_Mid, SafehouseFood_Late
```

## AMMO
Ammunition and reloading supplies. **6 containers:**

```
ArmyStorageAmmunition, ArmySurplusAmmoBoxes, GunStoreAmmunition, GunStoreMagsAmmo,
PoliceStorageAmmunition, SWATStorageAmmunition
```

## BOOKS_FICTION
Genre fiction: crime, horror, literary, romance, thriller, western. **12 containers:**

```
BookstoreCrimeFiction, BookstoreHorror, BookstoreLiteraryFiction, BookstoreRomance,
BookstoreThriller, BookstoreWestern, LibraryCrimeFiction, LibraryHorror, LibraryLiteraryFiction,
LibraryRomance, LibraryThriller, LibraryWestern
```

## BOOKS_SCIFI
Science fiction and fantasy. **2 containers:**

```
BookstoreFantasySciFi, LibraryFantasySciFi
```

## BOOKS_NONFICTION
Non-fiction / academic: science, history, business, legal, politics, philosophy, religion, occult, biography, reference. **43 containers:**

```
AnthropologyBooks, ArmySurplusLiterature, BookstoreBiography, BookstoreBusiness,
BookstoreGeneralReference, BookstoreHistory, BookstoreLegal, BookstoreMilitaryHistory,
BookstoreNewAge, BookstoreNonFiction, BookstoreOccult, BookstorePhilosophy, BookstorePolitics,
BookstoreReligion, BookstoreSchoolTextbook, BookstoreScience, BookstoreTravel, LaboratoryBooks,
LibraryBiography, LibraryBusiness, LibraryGeneralReference, LibraryHistory, LibraryLegal,
LibraryMilitaryHistory, LibraryNewAge, LibraryNonFiction, LibraryOccult, LibraryPhilosophy,
LibraryPolitics, LibraryReligion, LibraryScience, LibraryTravel, MedievalBooks, PoliceLibraryLegal,
UniversityLibraryBiography, UniversityLibraryBusiness, UniversityLibraryGeneralReference,
UniversityLibraryHistory, UniversityLibraryLegal, UniversityLibraryMilitaryHistory,
UniversityLibraryPhilosophy, UniversityLibraryPolitics, UniversityLibraryScience
```

## BOOKS_HOBBIES
Hobbies and trades: art, cinema, cooking, crafts, farming, sports, outdoors. **24 containers:**

```
ArtStoreLiterature, BookstoreArt, BookstoreCinema, BookstoreCooking, BookstoreCrafts,
BookstoreFarming, BookstoreHobbies, BookstoreOutdoors, BookstoreSports, CampingStoreBooks,
GolfStoreLiterature, HomeCinemaLiterature, KnappingBooks, LibraryArt, LibraryCinema,
LibraryOutdoors, LibrarySports, PotteryBooks, RangerBooks, TailoringLiterature, TheatreLiterature,
UniversityLibraryArt, UniversityLibraryCinema, UniversityLibrarySports
```

## BOOKS_COMICS
Comics, comic-store fantasy/sci-fi and tabletop games. **9 containers:**

```
ComicStoreCounter, ComicStoreDisplayBooks, ComicStoreDisplayComics, ComicStoreDisplayDice,
ComicStoreMagazines, ComicStoreShelfComics, ComicStoreShelfFantasy, ComicStoreShelfGames,
ComicStoreShelfSciFi
```

## BOOKS_NEWS
Press: newspapers, magazines and magazine racks. **17 containers:**

```
LibraryMagazines, LiquorStoreMagazineRack, MagazineRackAdult, MagazineRackBrochure,
MagazineRackCards, MagazineRackFancy, MagazineRackMaps, MagazineRackMixed, MagazineRackNewspaper,
MagazineRackPaperback, OutdoorSupplyMagazines, PlankStashMagazine, PostOfficeMagazines,
PostOfficeNewspapers, RangerMagazines, SalonMagazines, UniversityLibraryMagazines
```

## BOOKS_CHILDS
Children books. **2 containers:**

```
BookstoreChilds, LibraryChilds
```

## BOOKS_GENERAL
Generic books: counters, personal, stationery, misc, shelves. **16 containers:**

```
BookstoreBags, BookstoreBooks, BookStoreCounter, BookstoreMisc, BookstorePersonal,
BookstoreStationery, CafeShelfBooks, CortmanOfficeBooks, GigamartLiterature, LibraryBooks,
LibraryCounter, LibraryPersonal, MayorWestPointBooks, PostOfficeBooks, SafehouseBookShelf,
UniversityLibraryBooks
```

## BOOKS_ELECTRONIC
Electronics and computing manuals/magazines. **2 containers:**

```
BookstoreComputer, ElectronicStoreMagazines
```

## BOOKS_MECHANIC
Mechanics, automotive and trade manuals (DIY, blacksmithing, carpentry). **9 containers:**

```
BlacksmithLiterature, BookstoreAutomotive, BookstoreBlueCollar, CarpentryBooks,
CarSupplyLiterature, CarSupplyMagazines, ClockRepairLiterature, MechanicShelfBooks, ToolStoreBooks
```

## BOOKS_MEDICAL
Medical literature. **5 containers:**

```
BookstoreMedical, HospitalMagazineRack, LibraryMedical, MedicalOfficeBooks,
UniversityLibraryMedical
```

## CLOTHING_STORE
Clothing store (racks and general shelving). **20 containers:**

```
BandMerchClothes, ClothingPoor, ClothingRack, ClothingStorageAllJackets, ClothingStorageAllShirts,
ClothingStorageLegwear, ClothingStoresJackets, ClothingStoresJacketsLeather, ClothingStoresJeans,
ClothingStoresJumpers, ClothingStoresOvershirts, ClothingStoresPants, ClothingStoresPantsLeather,
ClothingStoresShirts, ClothingStoresSport, ClothingStoresSummer, ClothingStoresWoman,
GolfStoreClothingRack, WildWestClothing, ZippeeClothing
```

## CLOTHING_FOOTWEAR
Footwear: boots, shoes, sneakers. **8 containers:**

```
ArmySurplusFootwear, BowlingAlleyShoes, ClothingStorageFootwear, ClothingStoresBoots,
ClothingStoresShoes, ClothingStoresShoesLeather, OutdoorSupplyBoots, ToolStoreFootwear
```

## CLOTHING_ACCESSORIES
Accessories: gloves, eyewear, holsters, socks, headwear. **9 containers:**

```
ArmySurplusHeadwear, CarSupplyGloves, ClothingStorageHeadwear, ClothingStoresEyewear,
ClothingStoresGloves, ClothingStoresGlovesLeather, ClothingStoresHeadwear, ClothingStoresHolsters,
ClothingStoresSocks
```

## CLOTHING_FORMAL
Formal wear, dresses, suits and weddings. **7 containers:**

```
ClothingStoresDress, ClothingStoresJacketsFormal, ClothingStoresPantsFormal,
ClothingStoresShirtsFormal, LaundrySuits, WeddingStoreDresses, WeddingStoreSuits
```

## CLOTHING_UNDERWEAR
Underwear and lingerie. **6 containers:**

```
ClothingStoresUnderwearMan, ClothingStoresUnderwearWoman, LingerieStoreAccessories,
LingerieStoreBras, LingerieStoreOutfits, LingerieStoreUnderwear
```

## CLOTHING_UNIFORM
Uniforms and work outfits (professions). **26 containers:**

```
AmbulanceDriverOutfit, ArmyHangarOutfit, ArmySurplusOutfit, CarpenterOutfit, ChefOutfit,
ConstructionWorkerOutfit, DoctorOutfit, DrugLabOutfit, ElectricianOutfit, FarmerOutfit,
FiremanOutfit, FireStorageOutfit, FishermanOutfit, GardenerOutfit, MechanicOutfit,
MechanicShelfOutfit, MedicalClinicOutfit, MedicalStorageOutfit, MetalWorkerOutfit, MorgueOutfit,
NurseOutfit, PoliceOutfit, PoliceStateOutfit, PoliceStorageOutfit, RangerOutfit, ToolStoreOutfit
```

## CLOTHING_ARMOR
Protection: body armor, helmets and boxing gloves. **6 containers:**

```
BoxingStorageGloves, BoxingStorageHelmets, PoliceStorageArmor, PrisonStorageArmor,
SportStorageHelmets, SWATStorageArmor
```

## CLOTHING_HOME
Residential wardrobes, dressers and closets. **14 containers:**

```
BackstageDresser, BedroomDresser, BedroomDresserChild, BedroomDresserClassy, BedroomDresserRedneck,
DresserGeneric, HospitalRoomWardrobe, LivingRoomWardrobe, StripClubDressers, UniversityWardrobe,
WardrobeChild, WardrobeClassy, WardrobeGeneric, WardrobeRedneck
```

## CLOTHING_OUTDOOR
Outdoor clothing: camping, winter, army-surplus cots. **5 containers:**

```
ArmySurplusCots, CampingStoreClothes, CampingStoreLegwear, ClothingStorageWinter,
OutdoorSupplyClothes
```

## CLOTHING_MISC
Miscellaneous: display, band, lost-and-found, fashion. **9 containers:**

```
AnthropologyDisplayClothing, BackstageClothingRack, BandPracticeClothing, BookstoreFashion,
CultistClothing, LibraryFashion, LostAndFoundClothing, UniversityDesk_Fashion,
UniversityFilingCabinet_Fashion
```

## FARMING
Gardening, farming and homesteading. **9 containers:**

```
GardenStoreMisc, GardenStoreTools, GigamartFarming, FarmerTools, GardenerTools, ToolCabinetFarming,
ToolStoreFarming, BeerGardenCounter, Homesteading
```

## GUNFIRE_STORE
Gun stores (retail): counters, display cases, shelves, pistols/rifles/shotguns, accessories. **13 containers:**

```
GunStoreAccessories, GunStoreBodyArmor, GunStoreCases, GunStoreCounter, GunStoreDisplayCase,
GunStoreGuns, GunStoreKnives, GunStoreLiterature, GunStoreMagazineRack, GunStorePistols,
GunStoreRifles, GunStoreShelf, GunStoreShotguns
```

## GUNFIRE_MILITARY
Military armory. **1 container:**

```
ArmyStorageGuns
```

## GUNFIRE_POLICE
Police armory. **1 container:**

```
PoliceStorageGuns
```

## GUNFIRE_SWAT
SWAT armory. **1 container:**

```
SWATStorageGuns
```

## GUNFIRE_PRISON
Prison armory. **2 containers:**

```
PrisonArmoryShotguns, PrisonStorageGuns
```

## GUNFIRE_RANGER
Park-ranger firearms. **1 container:**

```
RangerStorageGuns
```

## GUNFIRE_CRIMINAL
Illicit / black-market firearms: drug lab, pawn shop, garage, stashes. **5 containers:**

```
DrugLabGuns, GarageFirearms, PawnShopGuns, PawnShopGunsSpecial, PlankStashGun
```

## GUNFIRE_GENERIC
Generic firearm spawns (phased). **3 containers:**

```
FirearmWeapons, FirearmWeapons_Late, FirearmWeapons_Mid
```

## FURNITURE_BEDROOM
Bedroom: nightstands, bedding, barracks lockers. **10 containers:**

```
BedroomSidetable, BedroomSidetableChild, BedroomSidetableClassy, BedroomSidetableRedneck,
GigamartBedding, LockerArmyBedroom, LockerArmyBedroomHome, MotelLinens, MotelSideTable,
WildWestBedroom
```

## FURNITURE_LIVING
Living room: shelves, side tables, wall decor. **11 containers:**

```
LivingRoomShelf, LivingRoomShelfClassy, LivingRoomShelfNoTapes, LivingRoomShelfRedneck,
LivingRoomSideTable, LivingRoomSideTableClassy, LivingRoomSideTableNoRemote,
LivingRoomSideTableRedneck, RecRoomShelf, WallDecor, WildWestLivingRoom
```

## FURNITURE_MISC
Miscellaneous furniture: changing rooms, generic shelves and side tables. **5 containers:**

```
ChangeroomCounters, ClosetShelfGeneric, ControlRoomCounter, StudioPropShelf, UniversitySideTable
```

## GROCERY_PRODUCE
Fresh fruit and vegetables (stands and produce storage). **37 containers:**

```
GroceryStandFruits1, GroceryStandFruits2, GroceryStandFruits3, GroceryStandLettuce,
GroceryStandVegetables1, GroceryStandVegetables2, GroceryStandVegetables3, GroceryStandVegetables4,
GroceryStandVegetables5, ProduceStorageApples, ProduceStorageBellPeppers, ProduceStorageBroccoli,
ProduceStorageCabbages, ProduceStorageCarrots, ProduceStorageCauliflower, ProduceStorageCherry,
ProduceStorageCorn, ProduceStorageEggplant, ProduceStorageEquipment, ProduceStorageGrapes,
ProduceStorageGreenpeas, ProduceStorageKale, ProduceStorageLeeks, ProduceStorageLettuce,
ProduceStorageLooseFruit, ProduceStorageLooseVeg, ProduceStorageOnions, ProduceStoragePeaches,
ProduceStoragePears, ProduceStoragePotatoes, ProduceStorageRadishes, ProduceStorageRottenFruit,
ProduceStorageRottenVeg, ProduceStorageStrawberries, ProduceStorageSweetPotatoes,
ProduceStorageTomatoes, ProduceStorageWatermelons
```

## GROCERY_MEAT
Meat. **1 container:**

```
Meat
```

## GROCERY_BAKERY
Bakery and pastries. **6 containers:**

```
BakeryBread, BakeryCake, BakeryDoughnuts, BakeryMisc, BakeryPie, GigamartBakingMisc
```

## GROCERY_SNACKS
Snacks, candy, crisps, popcorn. **6 containers:**

```
CandyStoreSnacks, GigamartCandy, GigamartCrisps, JuiceStandSnacks, StoreShelfSnacks,
TheatrePopcorn
```

## GROCERY_PANTRY
Pantry: canned, dry goods, sauces, spices, gourmet. **7 containers:**

```
FoodGourmet, GigamartBreakfast, GigamartCannedFood, GigamartDryGoods, GigamartSauce,
GigamartSpices, StoreShelfSpices
```

## GROCERY_BBQ
Barbecue: charcoal, propane, grills, accessories. **9 containers:**

```
BBQCharcoal, BBQCharcoalRich, BBQPropane, BBQPropaneRich, GigamartBBQ, GrillAcessories,
GrillStoreBlackBBQ, GrillStoreRedBBQ, StoreShelfBBQ
```

## GROCERY_DRINKS
Non-alcoholic drinks (sodas, juices). **3 containers:**

```
HotdogStandDrinks, JuiceStandDrinks, StoreShelfDrinks
```

## GROCERY_PREPARED
Prepared / fast food (serving trays). **48 containers:**

```
HotdogStandToppings, ServingTrayBiscuits, ServingTrayBurgers, ServingTrayBurritos,
ServingTrayChicken, ServingTrayChickenFried, ServingTrayChickenNuggets, ServingTrayChickenWings,
ServingTrayCornbread, ServingTrayFish, ServingTrayFishFingers, ServingTrayFishFried,
ServingTrayFries, ServingTrayGravy, ServingTrayHam, ServingTrayHotdogs, ServingTrayLobster,
ServingTrayMaki, ServingTrayMeatDumplings, ServingTrayMeatSteamBuns, ServingTrayMussels,
ServingTrayNoodleSoup, ServingTrayOmelettes, ServingTrayOnigiri, ServingTrayOnionRings,
ServingTrayOysters, ServingTrayOystersFried, ServingTrayPancakes, ServingTrayPerogies,
ServingTrayPie, ServingTrayPizza, ServingTrayPorkChops, ServingTrayPotatoPancakes,
ServingTrayRefriedBeans, ServingTraySalmon, ServingTraySausage, ServingTrayScrambledEggs,
ServingTrayShrimp, ServingTrayShrimpDumplings, ServingTrayShrimpFried, ServingTraySpringRolls,
ServingTraySteak, ServingTraySushiEgg, ServingTraySushiFish, ServingTrayTaco, ServingTrayTatoDots,
ServingTrayTofuFried, ServingTrayWaffles
```

## GROCERY_TOBACCO
Tobacco and smoking articles. **9 containers:**

```
SmokingRoomCigars, SmokingRoomPipes, StoreCounterTobacco, TobaccoStoreAccessories,
TobaccoStoreChew, TobaccoStoreCigarettes, TobaccoStoreCigarillos, TobaccoStoreCigars,
TobaccoStorePipes
```

## HOBBY
Arts, crafts and hobby supplies. **9 containers:**

```
ArtStoreOther, ArtStorePaper, ArtStorePen, Antiques, ArtStorePottery, ArtSupplies, Hobbies,
ImprovisedCrafts, SewingStoreFabric
```

## HYGIENE_BATHROOM
Bathroom: cabinets, counters, shelves, bins. **7 containers:**

```
BathroomCabinet, BathroomCounter, BathroomCounterEmpty, BathroomCounterMotel,
BathroomCounterNoMeds, BathroomShelf, BinBathroom
```

## HYGIENE_LAUNDRY
Laundry: washers, dryers, loads, towels, suits. **16 containers:**

```
BarLaundry, DryerEmpty, LaundryCleaning, LaundryLoad1, LaundryLoad2, LaundryLoad3, LaundryLoad4,
LaundryLoad5, LaundryLoad6, LaundryLoad7, LaundryLoad8, MotelTowels, PoliceLaundry, PrisonLaundry,
SafehouseDryer, SafehouseWasher
```

## HYGIENE_COSMETICS
Cosmetics, personal care, salon/barber. **10 containers:**

```
GasStoreToiletries, GigamartBathing, GigamartCosmetics, GigamartToiletries, SalonCounter,
SalonShelfHaircare, SalonShelfTowels, StripClubCosmetic, WildWestBarberCounter,
WildWestBarberShelves
```

## HYGIENE_CLEANING
Cleaning: cleaning supplies and janitorial. **8 containers:**

```
JanitorMisc, FossoilCounterCleaning, Gas2GoCounterCleaning, GasStoreCounterCleaning,
GigamartCleaning, JanitorCleaning, JanitorTools, StoreCounterCleaning
```

## JEWELRY
Jewelry and precious goods. **12 containers:**

```
JewelryWeddingRings, DepartmentStoreWatches, StoreDisplayWatches, ClockRepairWatches,
DepartmentStoreJewelry, JewelryGems, JewelryGold, JewelryNavelRings, JewelryOthers, JewelrySilver,
JewelryStorageAll, JewelryWrist
```

## LIQUOR
Liquor, wine and beer. **23 containers:**

```
StoreShelfBeer, StoreShelfWine, BarCounterLiquor, BreweryBottles, BreweryCans, BreweryHops,
GigamartBottles, LiquorStoreBags, LiquorStoreBeer, LiquorStoreBeerFancy, LiquorStoreBrandy,
LiquorStoreGin, LiquorStoreMix, LiquorStoreRum, LiquorStoreScotch, LiquorStoreTequila,
LiquorStoreVodka, LiquorStoreWhiskey, LiquorStoreWine, LiquorStoreWineFancy, SafehouseBooze,
StoreShelfWhiskey, WhiskeyBottlingFull
```

## MATERIALS
Building and raw materials. **2 containers:**

```
BagStoreLeather, PlumbingSupplies
```

## MEDIA_MUSIC
Music: instruments, stores, school and band merch. **22 containers:**

```
BandMerchShelves, BandPracticeInstruments, BookstoreMusic, ClosetInstruments, LibraryMusic,
MusicSchoolCases, MusicSchoolDesk, MusicSchoolLocker, MusicSchoolSheets, MusicStoreBass,
MusicStoreBrass, MusicStoreCases, MusicStoreCDs, MusicStoreDrums, MusicStoreGuitar,
MusicStoreLiterature, MusicStoreOthers, MusicStoreSpeaker, MusicStoreStringed,
UniversityDesk_Music, UniversityFilingCabinet_Music, UniversityLibraryMusic
```

## MEDIA_FILM
Cinema, video and photography. **5 containers:**

```
CameraStoreDisplayCase, CameraStoreShelves, HomeCinemaFilm, MovieRentalShelves, Photographer
```

## MEDIA_STAGE
Stage production / backstage. **3 containers:**

```
BackstageCounter, BackstageLockers, BackstageRigging
```

## OFFICE_GENERAL
Generic offices: desks, filing cabinets, counters. **12 containers:**

```
AnthropologyDesk, BankDeposit, DeskGeneric, FilingCabinetGeneric, OfficeCounter, OfficeDesk,
OfficeDeskSecretary, OfficeDeskStressed, OfficeDrawers, RangerDesk, SecurityDesk, WaitingRoomDesk
```

## OFFICE_HOME
Home offices and named-character desks. **8 containers:**

```
CortmanOfficeDesk, CortmanOfficeSidetable, JackiesDesk, MayorWestPointDesk, NolansDesk,
NolansFilingCabinet, OfficeDeskHome, OfficeDeskHomeClassy
```

## OFFICE_SCHOOL
Classroom, kids and daycare desks. **4 containers:**

```
ClassroomDesk, ClassroomSecondaryDesk, DaycareDesk, KidsDesk
```

## OFFICE_POLICE
Police / sheriff desks and files. **5 containers:**

```
PoliceCaptainDesk, PoliceDesk, PoliceFileBox, PoliceFilingCabinet, WildWestSheriffDesk
```

## OFFICE_POST
Post office (parcels and supplies). **2 containers:**

```
PostOfficeParcels, PostOfficeSupplies
```

## OFFICE_UNIVERSITY
University desks and filing cabinets by faculty. **37 containers:**

```
UniversityDesk_Anthropology, UniversityDesk_Art, UniversityDesk_Business, UniversityDesk_Cinema,
UniversityDesk_Electrical, UniversityDesk_Engineering, UniversityDesk_English,
UniversityDesk_Glassmaking, UniversityDesk_History, UniversityDesk_Legal, UniversityDesk_Math,
UniversityDesk_Medieval, UniversityDesk_Nature, UniversityDesk_Occult, UniversityDesk_Philosophy,
UniversityDesk_Pioneer, UniversityDesk_Politics, UniversityDesk_Religion, UniversityDesk_Science,
UniversityDesk_Therapy, UniversityFilingCabinet_Art, UniversityFilingCabinet_Business,
UniversityFilingCabinet_Cinema, UniversityFilingCabinet_Engineering,
UniversityFilingCabinet_English, UniversityFilingCabinet_Glassmaking,
UniversityFilingCabinet_History, UniversityFilingCabinet_Legal, UniversityFilingCabinet_Math,
UniversityFilingCabinet_Medieval, UniversityFilingCabinet_Nature, UniversityFilingCabinet_Occult,
UniversityFilingCabinet_Philosophy, UniversityFilingCabinet_Politics,
UniversityFilingCabinet_Religion, UniversityFilingCabinet_Science, UniversityFilingCabinet_Therapy
```

## PET
Pet supplies and pet food. **1 container:**

```
PetShopShelf
```

## RELIGION
Churches and religious items. **1 container:**

```
ChurchStorageMisc
```

## SCHOOL
Schools and universities. **9 containers:**

```
ClassroomMisc, ClassroomSecondaryMisc, ClassroomSecondaryShelves, ClassroomShelves, GigamartSchool,
SchoolLab, SchoolLockersBad, UniversityStorageAnthropology, UniversityStorageScience
```

## SCIENCE
Science, labs and museums. **11 containers:**

```
AnthropologyCounter, AnthropologyDisplayWeapons, Chemistry, JanitorChemicals, LaboratoryLockers,
MedievalAlchemy, MedievalBible, MedievalCooking, MorgueChemicals, ScienceMisc, TestingLab
```

## SPORTS_STORE
Sporting-goods store (retail): balls, racquets, clubs, weights, footwear. **19 containers:**

```
BaseballStoreShelves, GolfStoreAccessories, GolfStoreBags, SportStorageBalls, SportStorageBats,
SportStoragePaddles, SportStorageRacquets, SportStorageSticks, SportStorageWeights,
SportStoreAccessories, SportStoreBadminton, SportStoreBaseball, SportStoreBoxing,
SportStoreFootball, SportStoreGolf, SportStoreIceHockey, SportStorePadding, SportStoreSneakers,
SportStoreTennis
```

## SPORTS_GYM
Gym and fitness: weights, mats, towels, locker rooms. **9 containers:**

```
ClosetSportsEquipment, FitnessTrainer, GymLaundry, GymLockers, GymMats, GymSweatbands, GymTowels,
GymWeights, SchoolGymSportsGear
```

## SPORTS_VENUE
Sports venues: bowling, boxing, golf, equestrian, carnival. **10 containers:**

```
BaseballLockers, BowlingAlleyCounters, BowlingAlleyLockers, BowlingAlleyPins, BoxingLockers,
BoxingMemorabilia, CarnivalPrizes, GolfLockers, GolfStorage, JockeyLockers
```

## TOYS
Toys and games. **4 containers:**

```
GiftStoreToys, GigamartToys, DaycareCounter, DaycareShelves
```

## TRASH
Bins, dumpsters and junk. **17 containers:**

```
SafehouseBin, SafehouseBin_Mid, SafehouseBin_Late, BinBar, BinCrepe, BinDumpster, BinFireStation,
BinGeneric, BinJays, BreweryEmptyBottles, BreweryEmptyCans, DerelictHouseJunk, Empty, JunkBin,
JunkHoard, ProduceStorageEmptyBoxes, WhiskeyBottlingEmpty
```

## WEAPONS
Melee and improvised weapons. **6 containers:**

```
PawnShopKnives, MedievalWeapons, MedievalWeaponsJapan, MeleeWeapons, MeleeWeapons_Late,
MeleeWeapons_Mid
```

## RESTAURANT
Dining / restaurant and cafe counters (front-of-house and menus). **3 containers:**

```
CafeCounterMix, JaysDiningCounter, RestaurantMenus
```

## SPA
Spas (cabinets and counters). **2 containers:**

```
SpaCabinet, SpaCounter
```

## SPIFFO
Brand group: all Spiffo (the PZ mascot/chain) loot tables, gathered apart from their context (kitchen, fridge, office, etc.).. **15 containers:**

```
BinSpiffos, CratePaperBagSpiffos, CrateSpiffoMerch, SpiffosDesk, SpiffosDiningCounter,
SpiffosKitchenBags, SpiffosKitchenBaking, SpiffosKitchenButcher, SpiffosKitchenCups,
SpiffosKitchenFreezer, SpiffosKitchenFridge, SpiffosKitchenSauce, SpiffosKitchenSpecial,
SpiffosKitchenTrays, StoveSpiffos
```

## OTHER
Miscellaneous / uncategorized containers (deliberate catch-all). **7 containers:**

```
JudgeMattHassCounter, LostAndFoundItems, OtherGeneric, RandomFiller, ShelfGeneric, VacationStuff,
WoodcraftDudeCounter
```

