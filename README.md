# KR CoreOS — Shared Library & Modding API

A lightweight **modding framework for Project Zomboid** that lets you register your
items (and vehicles) into the world loot spawn tables with a **single function call**,
grouped by *context* instead of by raw container name — no hand-written distribution
tables, no container-name hunting, and no conflicts with other mods.

> **This is a tool for modders.** If you're a player, all you need to know is: some KR
> mods list this as a dependency — subscribe to it and forget it. There's nothing to
> configure. This repository exists so other modders can use the same API.

- **Builds:** 42 *and* 41 (the API call is identical on both — see [Cross-build](#cross-build-b41--b42))
- **Modes:** Singleplayer + Multiplayer (distribution runs server-side)
- **Steam Workshop:** [`[B42-41] KR CoreOS`](https://steamcommunity.com/sharedfiles/filedetails/?id=3714654032) · Mod ID `KRCoreOS`
- **Full group → container reference:** [GROUPS.md](GROUPS.md)

---

## Why this exists

The first time I added an item to Project Zomboid's loot, I spent an afternoon just
finding *which tables* the item was supposed to go into and copy-pasting the same three
lines dozens of times. CoreOS is the tool I wish I'd had that afternoon: it collapses
all of that into one call and one intent — *"this is a medical item, put it where
medical items live."*

---

## The vanilla way vs. the CoreOS way

### The vanilla way (what the [PZ Wiki](https://pzwiki.net/wiki/Procedural_distributions) describes)

Loot in PZ is driven by `ProceduralDistributions.list` — a big table where every
container type (`CrateBatteries`, `ElectronicStoreMisc`, `MechanicShelfElectric`, …)
has an `items` array of alternating `name, weight` pairs. To add your item you `require`
that table and `table.insert` **the name and the weight, into every container, one by one**:

```lua
require "Items/ProceduralDistributions"
local dist = ProceduralDistributions.list

-- You must do this for EVERY container you want the item in:
table.insert(dist.CrateBatteries.items,      "Base.MyItem")
table.insert(dist.CrateBatteries.items,      20)
table.insert(dist.ElectronicStoreMisc.items, "Base.MyItem")
table.insert(dist.ElectronicStoreMisc.items, 20)
table.insert(dist.MechanicShelfElectric.items, "Base.MyItem")
table.insert(dist.MechanicShelfElectric.items, 20)
-- ...and another 10–30 times, if you can remember every exact name.
```

The pain points:

- **You have to know every exact container name.** There are *hundreds*, spread across
  the game files, and a typo fails silently.
- **Weights aren't percentages** — they're relative to each container's `rolls`, so
  "how common is this, really?" is not obvious.
- **Two mods editing the same list can stomp on each other**, and load order matters.
- **Container names differ between B41 and B42**, so supporting both means two code paths.

### The CoreOS way

Group containers by *context* once, then reference the group. The example above — an
energy item that belongs in electronics stores **and** mechanic shops — becomes:

```lua
KRCore.dist.add("Base.MyItem", {
    POWER = 0.20,   -- POWER = ELECTRONIC_POWER + CRATES_ELECTRONIC + MECHANIC: 23 containers, one line.
})
```

| | Vanilla | KR CoreOS |
|---|---|---|
| Add to 23 containers | 46 `table.insert` lines | 1 line |
| Targeting | exact container names | contextual groups (`MEDICAL`, `POWER`, …) |
| Value meaning | raw weight vs. `rolls` | `prob` ≈ a percentage (`0.30` ≈ 30%) |
| Two mods, same table | can conflict / overwrite | queued + merged, **deduped**, no conflicts |
| B41 + B42 | two code paths | **same call**, CoreOS resolves the names |
| Missing container | silent failure | skipped safely (cross-build names) |

You don't lose control: when you *do* need a specific container, the `custom` key targets
it by name and overrides the group probability (see [`custom`](#custom-targeting-and-overrides)).

---

## Quick start

**1. Declare the dependency** in your `mod.info`:

```
require=KRCoreOS
```

**2. Create a distribution file** in the **`server`** folder (mandatory — distribution
runs on the host/dedicated server, not the client):

```
Build 42:  42/media/lua/server/YourMod_Distribution.lua
Build 41:     media/lua/server/YourMod_Distribution.lua
```

**3. Register your items** (always guard against CoreOS being absent):

```lua
if not KRCore then
    print("[YourMod] ERROR: KRCore not available. Items NOT registered.")
    return
end

KRCore.dist.add("Base.MyMedkit", {
    MEDICAL    = 0.30,   -- clinics, hospitals, pharmacies, military medical...
    SPECIAL    = 0.10,   -- rare / unique locations
    custom = {
        { name = "SafehouseMedical", prob = 0.50 },  -- pin one container higher
    },
})
```

That's the whole flow. No loot tables written by hand.

---

## Documentation

- **[docs/EXAMPLE_Simple.md](docs/EXAMPLE_Simple.md)** — minimal item registration, line by line.
- **[docs/EXAMPLE_Advanced.md](docs/EXAMPLE_Advanced.md)** — probability tiers, `DEV_MODE`, `custom` overrides, vehicles, the Care Package protocol, and the runtime timeline.
- **[GROUPS.md](GROUPS.md)** — every location group and the exact containers it maps to.
- **[CHANGELOG.md](CHANGELOG.md)** — version history.

---

## API reference

### `KRCore.dist.add(item, groups)`
Register an item into the world loot tables.
- `item` *(string)* — full type name, e.g. `"Base.MyItem"`.
- `groups` *(table)* — map of `GROUP = prob`. Keys can be:
  - a **thematic group** from `KRCore.LOC` (e.g. `MEDICAL_HOSPITAL`, `ELECTRONIC_POWER`, `GROCERY_MEAT`) — see [GROUPS.md](GROUPS.md);
  - a **combo** from `KRCore.COMBO` — either a coarse roll-up (`MEDICAL`, `ELECTRONIC`, `BOOKS`, `GROCERY`, …) or a concept (`POWER`, `WAREHOUSE`, `FOOD`, `WARZONE`, …); a combo expands to the union of several groups and may reference other combos;
  - the special key `custom = { {name="Container", prob=0.2}, ... }` to target raw containers.

`prob` is inserted as the item's spawn weight; in practice `~0.30` behaves like roughly
a 30% chance per container in that group.

### `KRCore.dist.addVehicle(vehicleID, zones)`
Register a vehicle into `VehicleZoneDistribution`.
- `zones` *(table)* — map of `zoneName = spawnChance` *(integer)*. Standard B42 zones:
  `parkingstall, good, medium, bad, sport, junkyard, trafficjams, trafficjamn`.

```lua
KRCore.dist.addVehicle("Base.MyVan", { good = 1, trafficjams = 1 })
```

### `custom` targeting and overrides
`custom` entries are processed **before** groups, and the **first** insertion of a
container wins (per item). So a `custom` entry can pin a specific container to a
different probability than the group it also belongs to — deterministically. An unknown
container name in `custom` prints a `WARN` (unknown names inside *groups* are skipped
silently on purpose, because groups mix B41/B42 names).

### Care Package API (optional, for add-on mods)
For "add-on" mods that inject content into a host mod without touching its files:
- `KRCore.registerMod(modID, { version, onContentAdded })` — a host mod declares it accepts content.
- `KRCore.addContent(targetModID, contentType, data)` — an add-on pushes content; if the
  host isn't loaded yet, it's queued and delivered when the host registers.

---

## How it works internally

1. `KRCore.dist.add()` **doesn't write to the game tables immediately** — it pushes the
   entry onto an internal queue.
2. On **`OnPostDistributionMerge`** (which in B42 fires *before* `ItemPickerJava.Parse()`,
   so inserts are guaranteed visible), CoreOS drains the queue:
   - each group name is resolved to its container list (`KRCore.LOC`), or, for a combo,
     to the **deduplicated union** of its sub-groups (`KRCore.COMBO`) — combos may
     reference other combos, resolved **recursively** with a cycle guard;
   - `custom` entries go first (override), then groups;
   - a per-item `usedContainers` set **dedupes** so an item is never inserted twice into
     the same container (e.g. `GarageMechanics` lives in both `INDUSTRIAL` and `MECHANIC`);
   - container names not present in the running build are skipped silently.
3. Vehicles are processed later, on **`OnInitWorld`** (the first point where
   `VehicleZoneDistribution` is fully initialized).

Load order is guaranteed by the `server/` folder + alphabetical file names:
`KRCore_API` → `KRCore_Locations` → `KRCore_Server`, all before dependent mods (thanks to
`require=KRCoreOS`).

### Cross-build (B41 / B42)
You write **the same `KRCore.dist.add` call** for both builds. CoreOS ships a
build-appropriate group definition in each build folder, and any container name that
doesn't exist in the player's version is skipped silently — so your code never branches
on the build.

> **Tip:** the fine `*_POWER`-style thematic groups are **B42-only**. For code that also
> runs on B41, target the **coarse roll-up / combo names** (`ELECTRONIC`, `POWER`,
> `MEDICAL`, `FOOD`, …) — they resolve to real groups on B41 and to combos on B42, so the
> same call covers both builds.

---

## Location groups at a glance

**140 thematic groups + 30 combos**, covering **all 1418 B42.20 loot containers** — every
container belongs to exactly **one** group (no overlap); combos add breadth on top. Full
container-by-container breakdown in **[GROUPS.md](GROUPS.md)**.

Thematic groups are fine and curated into families, for example:

- **Power / tech:** `ELECTRONIC_GENERAL` · `_COMPUTER` · `_PHONE` · `_RADIO` · `_POWER` · `MECHANIC` · `MECHANIC_CARPARTS` · `MECHANIC_FUEL`
- **Warehouse crates** (their own axis): `CRATES_CANFOOD` · `_FOOD` · `_DRINKS` · `_LIQUOR` · `_KITCHEN` · `_APPLIANCES` · `_ELECTRONIC` · `_TOOLS` · `_METAL` · `_MATERIALS` · `_FURNITURE` · `_CLOTHING` · `_FARMING` · `_MEDIA` · `_BOOKS` · `_SPORTS` · `_MISC` · `_TRASH`
- **Food:** `GROCERY_*` (PRODUCE/MEAT/BAKERY/…) · `FRIDGE_*` · `FREEZER_*` · `KITCHEN_*` · `CAFETERIA` · `RESTAURANT` · `SAFEHOUSE_FOOD`
- **Books & media:** `BOOKS_*` (FICTION/SCIFI/NONFICTION/…/ELECTRONIC/MECHANIC/MEDICAL) · `MEDIA_MUSIC` · `_FILM` · `_STAGE`
- **Combat:** `GUNFIRE_*` (STORE/MILITARY/POLICE/SWAT/PRISON/RANGER/CRIMINAL/GENERIC) · `WEAPONS` · `AMMO`
- **Places & people:** `ARMY` · `POLICE` · `PRISON` · `SECURITY` · `FIREFIGHTER` · `MEDICAL_*` · `INDUSTRIAL_*` · `CLOTHING_*` · `OFFICE_*` · `HYGIENE_*` · `SPORTS_*` · `FURNITURE_*` · `SAFEHOUSE_GEAR` · `LOCKERS` · `STASH` · `SPA` · `SPIFFO` (brand) · … and more.

**Combos** come in two layers:

- **Roll-ups** rebuild each old coarse name as the union of its fine groups, so code
  written for older CoreOS keeps working unchanged: `ELECTRONIC`, `MEDICAL`, `INDUSTRIAL`,
  `AUTOMOTIVE`, `SURVIVAL`, `BOOKS`, `CLOTHING`, `GROCERY`, `GUNFIRE`/`FIREARMS`, `OFFICE`,
  `HYGIENE`, `KITCHEN`, `SPORTS`, `MEDIA`, `FURNITURE`, `FRIDGE`, `FREEZER`, `CRATES`, `SPECIAL`.
- **Concepts:** `WAREHOUSE` · `POWER` · `COLD_STORAGE` · `COOKING` · `FOOD` · `MILITARY` ·
  `TACTICAL` · `WARZONE` · `LAW` · `WORKSHOP`.

---

## Common mistakes

- **Forgetting the `if not KRCore then return end` guard** → crash if CoreOS isn't installed.
- **File outside the `server/` folder** → distribution never runs.
- **Misspelled `custom` container name** → check the console for a `WARN`.
- **Container names** live in the game's `ProceduralDistributions.lua`
  (`media/lua/server/Items/`), inside `ProceduralDistributions.list`.

---

## Compatibility

- Build 42 (42.20.0) ✔ · Build 41 ✔
- Singleplayer ✔ · Multiplayer ✔
- No known mod conflicts (additive, never overwrites existing entries)

## License / Credits

Created by **D4RK-C0MP4N1**. Contributions and questions welcome — open an issue, or
ping me in the Workshop discussion. `o7`
