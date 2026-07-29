#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
KR CoreOS - location-group generator / updater.

Scans a Project Zomboid `ProceduralDistributions.lua` and maps EVERY top-level
loot container into a thematic group, so KRCore.LOC covers all of the game's
distribution tables. It PRESERVES the current membership of the existing groups
(so published mods keep their spawn behaviour) and only classifies containers
that aren't already grouped.

Usage
-----
    # dry run: print a summary, write nothing
    python tools/generate_groups.py

    # write the results into 42/.../KRCore_Locations.lua and GROUPS.md
    python tools/generate_groups.py --write

    # point at a specific ProceduralDistributions.lua (e.g. another install)
    python tools/generate_groups.py --write "D:\\Steam\\...\\ProceduralDistributions.lua"

Notes
-----
* Only the B42 group file is updated (`42/media/lua/server/KRCore_Locations.lua`).
* Classification is by ordered name-pattern rules (first match wins). Edit the
  RULES table below to re-route a container; anything unmatched lands in OTHER.
* Re-running on a future build is safe: existing groups are kept and only the
  new containers of that build are appended. Combos are read from the file and
  left untouched.
"""
import os, re, sys

HERE   = os.path.dirname(os.path.abspath(__file__))
REPO   = os.path.dirname(HERE)
LOC    = os.path.join(REPO, "Contents", "mods", "KR CoreOS", "42",
                      "media", "lua", "server", "KRCore_Locations.lua")
GROUPS = os.path.join(REPO, "GROUPS.md")
DEFAULT_PD = r"C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid\media\lua\server\Items\ProceduralDistributions.lua"

args    = sys.argv[1:]
WRITE   = "--write" in args
pd_args = [a for a in args if not a.startswith("--")]
PD      = pd_args[0] if pd_args else DEFAULT_PD

if not os.path.isfile(PD):
    sys.exit("ProceduralDistributions.lua not found:\n  %s\nPass the path as an argument." % PD)

# ---- 1) every top-level container in the game file (tab- OR 4-space-indented) ----
with open(PD, encoding="utf-8", errors="replace") as f:
    pd = f.read()
containers = sorted(set(re.findall(r'(?m)^(?:\t|    )([A-Z][A-Za-z0-9_]*) = \{', pd)))

# ---- 2) parse the current LOC groups (preserve membership + order) ----
with open(LOC, encoding="utf-8", errors="replace") as f:
    loc = f.read()
loc_block   = loc[loc.index("KRCore.LOC = {"):loc.index("KRCore.COMBO = {")]
combo_block = loc[loc.index("KRCore.COMBO = {"):]
cur, order = {}, []
for mm in re.finditer(r'(?m)^    ([A-Z_][A-Z0-9_]*) = \{', loc_block):
    g = mm.group(1)
    seg = loc_block[mm.end():]
    seg = seg[:seg.index("\n    },")]
    cur[g] = re.findall(r'"([A-Za-z0-9_]+)"', seg)
    order.append(g)
covered = {c for mem in cur.values() for c in mem}

# ---- 3) ordered classifier rules (first match wins) ----
RULES = [
 ("SAFEHOUSE_FOOD", r"SafehouseFood"),
 ("FREEZER", r"Freezer"),
 ("FRIDGE", r"Fridge"),
 ("KITCHEN_SAUCES", r"Kitchen(Sauce|Butcher|Cheese|Coffee|Tea|Bottles|CannedFood|DryFood)|^Butcher"),
 ("STOVE", r"Stove|\bOven\b"),
 ("KITCHEN", r"Kitchen|DishCabinet|Dishwasher|Dishes|Cutlery|Cookware|Cookbook"),
 ("CAFETERIA", r"Cafeteria|Canteen"),
 ("AMMO", r"Ammunition|Ammo|Shotshell|Bullet"),
 ("FIREARMS", r"Gun|Firearm|Shotgun|Rifle|Pistol|Revolver|Handgun|Armory|Armoury"),
 ("WEAPONS", r"MeleeWeapon|MedievalWeapon|Machete|\bSword|Katana|\bAxe\b"),
 ("CLOTHING", r"Outfit|Footwear|Boots|Shoes|Headwear|\bHat\b|\bCap\b|Wardrobe|Fashion|Clothing|Clothes|Dress|Suit|Legwear|Trouser|Shirt|Jacket|Coat|Uniform|Sock|Glove|Costume|Lingerie|Swimwear|Apparel|Tuxedo|Wedding|Cultist|Helmet|Armor|Armour|Cots\b|Vest"),
 ("MEDICAL", r"Medical|Hospital|Clinic|Pharmacy|Surgeon|Surgery|FirstAid|Nurse|Dentist|Ambulance|Drug|Optometrist|Optician"),
 ("ELECTRONIC", r"Electronic|Electrician|Generator|HAMRadio|Radio|Computer|Laptop|Phone|Television|CrateTV|Lightbulb|\bTV\b|Lightbar|Cyber"),
 ("MECHANIC", r"Mechanic|CarSupply|CarTires|CarBattery|CarWindows|CarLight|CarDealer|\bCar\b|GasStorage|FireStorageMechanics|Muffler|Brake|Suspension|Wheel|Tire|Garage(Mech|Metalwork|Carpentry)?"),
 ("INDUSTRIAL", r"Tool|Factory|Welding|MetalShop|Metalwork|Forge|Foundry|Workshop|Machinist|Carpentry|Construction|Warehouse|RailYard|BarnTools|Blacksmith|Logging|Sawmill|Lathe|Ingot|SawBlade|Handles|BarStock|WireFactory|Industrial"),
 ("MEDIA", r"CompactDisc|VHS|Cassette|Vinyl|MovieRental|Movie|Camera|Film|Music|Photo|\bDVD|Instrument|Guitar|Piano|BandMerch|BandPractice|Backstage|Rigging"),
 ("BOOKS", r"Book|Literature|Magazine|Comic|Library|Newspaper|Paperback|Manual|Textbook|Journal|\bZine"),
 ("OFFICE", r"Office|Desk|FilingCabinet|FileBox|Stationery|Stationary|Clerk|Cubicle|Bank(Deposit|Teller|Vault)?"),
 ("SPORTS", r"Sport|Fitness|\bGym|Baseball|Basketball|Soccer|Football|Golf|Tennis|Bowling|Weights|\bDart|\bPool\b|Boxing|Skate|\bBike|Bicycle|Carnival"),
 ("TOYS", r"\bToy|Doll|Lego|Puzzle|BoardGame|Plush|Daycare|Prizes"),
 ("HOBBY", r"\bArt\b|ArtSupplies|Craft|Sewing|Tailor|Knit|Pottery|Ceramic|Fabric|Yarn|Bead|Scrapbook|Antiques|Hobb|Fireworks"),
 ("JEWELRY", r"Jewelry|Jewellery|\bGems?\b|Diamond|\bGold\b|\bSilver\b|NavelRing"),
 ("FARMING", r"Garden|\bFarm|Seed|Fertilizer|Greenhouse|AnimalFeed|\bPlant|Nursery|\bCrop|Compost|Livestock|Homestead"),
 ("PET", r"\bPet\b|PetSupplies|PetShop|PetStore|DogFood|CatFood|Aquarium|Kennel|\bVet\b|Veterinar"),
 ("MATERIALS", r"Lumber|Concrete|Masonry|Brick|\bSand|Gravel|\bStone|SheetMetal|Plaster|Cement|WallFinish|\bClay|Limestone|Insulation|\bPipe|Plumb|Roof|\bPaint|\bDye|Nails|\bScrew|Leather|HeavyChains|Chains|Rebar"),
 ("HYGIENE", r"Bathroom|Cosmetic|Toiletr|Cleaning|\bSoap|Salon|Hairdress|Makeup|Shampoo|Toilet|Laundry|Washer|Dryer|Detergent|Bathing|Towel|Barber"),
 ("TRASH", r"\bBin\b|BinGeneric|BinDumpster|Bin[A-Z]|Dumpster|Trash|Garbage|Waste|Rubbish|Recycl|Empty|Junk"),
 ("LIQUOR", r"Liquor|\bWine|\bBeer|Booze|Brewery|Whiskey|Whisky|Scotch|Vodka|\bRum\b|Spirits|Champagne|Bottles"),
 ("FURNITURE", r"Chair|Table|Sofa|Couch|Stool|Dresser|\bSink|Mannequin|\bRug\b|Curtain|\bLamp\b|Decor|Furniture|Ottoman|Bookcase|Comfy|Rattan|Sidetable|Nightstand|Bedroom|Bedding|Linens|Antique|Skeleton|LivingRoom|RecRoom|Closet|Changeroom|WaitingRoom|ControlRoom|StudioProp"),
 ("SCHOOL", r"School|University|Classroom|Student|College|Kindergarten|Locker\b.*School"),
 ("SCIENCE", r"Science|Chemistry|Chemical|Anthropology|Museum|Laboratory|Physics|Biology|Geology|Medieval|Alchemy|TestingLab"),
 ("RELIGION", r"Church|Bible|Confession|Altar|Chapel|Cathedral|Temple|Mosque|Synagogue"),
 ("SURVIVAL", r"Fishing|\bBait|Tackle|Camping|Survival|\bHunt|Ranger|\bTent|SleepingBag|Scout|Hiker|Trapper|\bTrap"),
 ("MILITARY", r"Army|Police|Prison|Security|Military|\bSWAT|FireStorage|FireDept|Guard|Jockey|Surplus|Sheriff"),
 ("GROCERY", r"\bFood|Snack|Candy|Chips|Crisps|Cereal|Canned|Sauce|Spice|Bread|\bBun|\bMeat|Dairy|Butter|\bEgg|Flour|Sugar|\bRice|Pasta|Noodle|Macaroni|Coffee|\bTea\b|\bSoda|\bWater|Juice|Chocolate|Cookie|Cracker|\bCake|Bakery|Grocery|Marinara|Ketchup|Mustard|\bMayo|\bJam\b|Honey|Syrup|Popcorn|Peanut|Seaweed|Yeast|Cocoa|Vinegar|\bOil|Fruit|Vegetable|\bMilk|Cheese|\bFish\b|Seafood|Sandwich|Taco|Tortilla|Pizza|Burger|Hotdog|\bNut\b|\bBean|BBQ|Charcoal|Propane|Condiment|Marshmallow|Gum\b|Cigarette|Jerky|FountainCup|ServingTray|Grill|Produce|Cigar|Pipe|Tobacco"),
 ("BAR", r"\bBar|Theatre|Theater|Cinema|\bPub\b|Tavern|\bClub\b|Casino|Arcade"),
 ("STORES", r"Store|Gigamart|\bShop|Market|\bMall|Retail|Register|GeneralStore|DepartmentStore|Gift|Holiday|Souvenir|Merch|WildWest"),
 ("CRATES", r"Crate"),
 ("SPECIAL", r"Safehouse|PawnShop|PostOffice|Bunker|Vault|Panic|Derelict|DrugShack|DrugLab|Hoarder|Locker|Stash|PlankStash|SeasonalWorker"),
]
compiled = [(g, re.compile(rx)) for g, rx in RULES]

new, uncat = {}, []
for c in containers:
    if c in covered:
        continue
    hit = next((g for g, rx in compiled if rx.search(c)), None)
    if hit is None:
        uncat.append(c)
    else:
        new.setdefault(hit, []).append(c)

# split additions; route uncategorized into OTHER (existing or new)
existing_add = {g: v for g, v in new.items() if g in order}
new_groups   = {g: v for g, v in new.items() if g not in order}
if uncat:
    if "OTHER" in order:
        existing_add.setdefault("OTHER", []).extend(uncat)
    else:
        new_groups["OTHER"] = uncat

NEW_DESC = {
 "CLOTHING": "Clothing, footwear, headwear and outfits (stores, wardrobes)",
 "FIREARMS": "Firearms and gun stores",
 "WEAPONS": "Melee and improvised weapons",
 "AMMO": "Ammunition and reloading supplies",
 "BOOKS": "Books, literature, magazines and libraries",
 "MEDIA": "Music, film, photography and instruments",
 "OFFICE": "Office supplies, desks and filing",
 "SPORTS": "Sporting goods and fitness equipment",
 "TOYS": "Toys and games",
 "HOBBY": "Arts, crafts and hobby supplies",
 "JEWELRY": "Jewelry and precious goods",
 "FARMING": "Gardening, farming and homesteading",
 "PET": "Pet supplies and pet food",
 "MATERIALS": "Building and raw materials",
 "HYGIENE": "Bathroom, cosmetics, cleaning and laundry",
 "TRASH": "Bins, dumpsters and junk",
 "LIQUOR": "Liquor, wine and beer",
 "FURNITURE": "Furniture and home decor",
 "SCHOOL": "Schools and universities",
 "SCIENCE": "Science, labs and museums",
 "RELIGION": "Churches and religious items",
 "GROCERY": "Food, groceries and general provisions",
 "OTHER": "Miscellaneous / uncategorized containers",
}
DESC_EX = {
 "MILITARY":"Military, police, prison and security storage",
 "SURVIVAL":"Camping, hunting and survival-gear stores",
 "ELECTRONIC":"Electronics stores and tech containers",
 "MEDICAL":"Medical and hospital storage",
 "INDUSTRIAL":"Workshops, factories and industrial storage",
 "MECHANIC":"Auto shops and car-part stores",
 "CRATES":"Generic storage crates",
 "SPECIAL":"Special / rare locations, safehouses and stashes",
 "STORES":"General and big-box stores",
 "BREAKROOM":"Break rooms and offices",
 "BAR":"Bars, theatres and entertainment",
 "FRIDGE":"Residential and commercial refrigerators",
 "FREEZER":"Residential and commercial freezers",
 "STOVE":"Residential and commercial stoves",
 "KITCHEN":"Kitchens (utensils, dishes, basic storage)",
 "KITCHEN_SAUCES":"Kitchens (sauces, meats, specific goods)",
 "CAFETERIA":"Cafeterias and dining spaces",
 "SAFEHOUSE_FOOD":"Shelters (food and supplies)",
}
DESC = dict(DESC_EX); DESC.update(NEW_DESC)

# ---- report ----
allg = list(order) + sorted(g for g in new_groups if g not in order)
print("ProceduralDistributions: %s" % PD)
print("Total containers: %d | preserved: %d | new groups: %d | uncategorized: %d"
      % (len(containers), len(covered), len([g for g in new_groups if g != "OTHER"]), len(uncat)))
for g in allg:
    add = len(existing_add.get(g, []) if g in order else new_groups.get(g, []))
    print("  %-14s cur=%4d +add=%4d = %4d %s"
          % (g, len(cur.get(g, [])), add, len(cur.get(g, [])) + add, "" if g in order else "NEW"))
if uncat:
    print("\nUncategorized (-> OTHER): " + ", ".join(uncat))

if not WRITE:
    print("\n(dry run - pass --write to update KRCore_Locations.lua and GROUPS.md)")
    sys.exit(0)

# ---- write KRCore_Locations.lua ----
text = loc
for g, adds in existing_add.items():
    if not adds:
        continue
    gi = text.index("\n    %s = {" % g)
    close = text.index("\n    },", gi)
    text = text[:close + 1] + "".join('        "%s",\n' % c for c in adds) + text[close + 1:]

def emit(g, mem):
    s  = "\n    -- =========================================================\n"
    s += "    -- %s\n    -- %s\n" % (g, DESC.get(g, g))
    s += "    -- =========================================================\n"
    s += "    %s = {\n" % g
    s += "".join('        "%s",\n' % c for c in mem)
    s += "    },\n"
    return s

ordered_new = sorted(x for x in new_groups if x != "OTHER") + (["OTHER"] if "OTHER" in new_groups else [])
block = "".join(emit(g, new_groups[g]) for g in ordered_new)
loc_close = text.rindex("\n}", 0, text.index("KRCore.COMBO = {"))
text = text[:loc_close] + ("\n" + block if block else "") + text[loc_close:]
open(LOC, "w", encoding="utf-8", newline="\n").write(text)
print("\nwrote %s" % LOC)

# ---- write GROUPS.md ----
import textwrap
fm = {}
for g in order:
    fm[g] = cur.get(g, []) + existing_add.get(g, [])
for g in new_groups:
    fm[g] = new_groups[g]
allg = list(order) + sorted(x for x in new_groups if x not in order and x != "OTHER") \
       + (["OTHER"] if ("OTHER" in new_groups and "OTHER" not in order) else [])

# parse combos from the file so the doc stays a single source of truth
combos = []
for mm in re.finditer(r'(?m)^    ([A-Z_]+) = \{ (.+?) \},', combo_block):
    subs = re.findall(r'"([A-Z_]+)"', mm.group(2))
    pre = combo_block[:mm.start()].split("\n")
    cl = []
    for line in reversed(pre):
        s = line.strip()
        if s.startswith("--"):
            cl.append(s[2:].strip())
        elif s == "":
            continue
        else:
            break
    combos.append((mm.group(1), " + ".join(subs), " ".join(reversed(cl))))

m = ["# KR CoreOS \u2014 Location Groups Reference\n"]
m.append("Full map of every location group and the exact `ProceduralDistributions.list` "
         "containers it expands to. A *group* is a named list of real in-game containers "
         "sorted by theme, so you write `MEDICAL = 0.3` instead of naming containers by hand.\n")
m.append("- **%d thematic groups** + `OTHER` + **%d combos**, covering **all %d loot containers**."
         % (len([g for g in allg if g != "OTHER"]), len(combos), len(containers)))
m.append("- Auto-generated by `tools/generate_groups.py` and verified against the game's "
         "`ProceduralDistributions.lua`. Names absent in the running build are skipped silently.")
m.append("- The 18 groups at the top are the original curated set; the rest are full-coverage categories.\n")
m.append("## Overview \u2014 all groups\n\n| Group | Containers | What it is |\n|---|--:|---|")
for g in allg:
    m.append("| [`%s`](#%s) | %d | %s |" % (g, g.lower(), len(fm[g]), DESC.get(g, g)))
m.append("\n## Overview \u2014 combos\n\n| Combo | Expands to | Notes |\n|---|---|---|")
for name, exp, note in combos:
    m.append("| `%s` | `%s` | %s |" % (name, exp.replace(" + ", "` + `"), note))
m.append("\n---\n")
for g in allg:
    m.append("## %s\n%s. **%d containers:**\n" % (g, DESC.get(g, g), len(fm[g])))
    m.append("```")
    m.append("\n".join(textwrap.wrap(", ".join(fm[g]), width=96,
                                      break_long_words=False, break_on_hyphens=False)) or "(none)")
    m.append("```\n")
open(GROUPS, "w", encoding="utf-8", newline="\n").write("\n".join(m) + "\n")
print("wrote %s" % GROUPS)
