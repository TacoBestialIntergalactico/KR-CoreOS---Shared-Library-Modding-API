# Changelog

All notable changes to **KR CoreOS** are documented here.
This project targets Project Zomboid **Build 41** and **Build 42**.

## [1.2.1] — Fine-grained taxonomy & combo overhaul

### Added
- **140 location groups.** The coarse groups from 1.2.0 were split into fine,
  curated, **non-overlapping** groups so items land where they thematically belong.
  Each of the **1418** B42.20 containers now belongs to exactly one group. New families:
  - `ELECTRONIC_*` · `MECHANIC_*` · `MEDICAL_*` · `INDUSTRIAL_*`
  - `BOOKS_*` (FICTION / SCIFI / NONFICTION / HOBBIES / COMICS / NEWS / CHILDS / GENERAL / ELECTRONIC / MECHANIC / MEDICAL)
  - `GROCERY_*` (PRODUCE / MEAT / BAKERY / SNACKS / PANTRY / BBQ / DRINKS / PREPARED / TOBACCO)
  - `CLOTHING_*` · `OFFICE_*` · `HYGIENE_*` · `KITCHEN_*` · `SPORTS_*` · `MEDIA_*` · `FURNITURE_*` · `FRIDGE_*` · `FREEZER_*`
  - `GUNFIRE_*` — firearms by source (store / military / police / SWAT / prison / ranger / criminal / generic)
  - New standalone groups: `SAFEHOUSE_GEAR`, `LOCKERS`, `STASH`, `RESTAURANT`, `SPA`
- **`CRATES_*` — a warehouse family (18 groups).** Every storage crate in the game, split
  by content (CANFOOD, FOOD, DRINKS, LIQUOR, KITCHEN, APPLIANCES, ELECTRONIC, TOOLS, METAL,
  MATERIALS, FURNITURE, CLOTHING, FARMING, MEDIA, BOOKS, SPORTS, MISC, TRASH). Crates are a
  distinct high-yield loot context, so they form their own axis.
- **`SPIFFO`** — a brand group gathering every Spiffo's loot table in one place,
  independent of physical context.
- **Recursive combo resolver** — a combo may now reference other combos (cycle-guarded),
  enabling layered groupings.
- **30 combined groups (`KRCore.COMBO`)** in two layers:
  - **Roll-ups** rebuild each old coarse name as the union of its fine groups, so existing
    registrations keep working: `ELECTRONIC`, `MEDICAL`, `INDUSTRIAL`, `BOOKS`, `CLOTHING`,
    `GROCERY`, `GUNFIRE`/`FIREARMS`, `OFFICE`, `HYGIENE`, `KITCHEN`, `SPORTS`, `MEDIA`,
    `FURNITURE`, `FRIDGE`, `FREEZER`, `SURVIVAL`, `SPECIAL`, `CRATES`, `AUTOMOTIVE`.
  - **Concepts**: `WAREHOUSE`, `POWER`, `COLD_STORAGE`, `COOKING`, `FOOD`, `MILITARY`,
    `TACTICAL`, `WARZONE`, `LAW`, `WORKSHOP`.

### Changed
- Groups are now **single-membership** — no container lives in two groups; combos
  add breadth on top with automatic dedupe.
- Source comments rewritten in English.

> **Backward compatibility:** the old coarse group names still resolve — they are now
> combos that expand to the matching fine groups — so mods written against 1.2.0 need no
> changes.

> **B41:** unchanged.

## [1.2.0] — B42.20 support & full container coverage

### Added
- **Full B42.20 loot coverage** — every one of the **1418** `ProceduralDistributions`
  containers in Build 42.20 is now assigned to a group, so KRCore works as a
  general-purpose distribution API, not only for the KR mods. See [GROUPS.md](GROUPS.md).
- **22 new location groups**: `CLOTHING`, `FIREARMS`, `WEAPONS`, `AMMO`, `BOOKS`,
  `MEDIA`, `OFFICE`, `SPORTS`, `TOYS`, `HOBBY`, `JEWELRY`, `FARMING`, `PET`,
  `MATERIALS`, `HYGIENE`, `TRASH`, `LIQUOR`, `FURNITURE`, `SCHOOL`, `SCIENCE`,
  `RELIGION`, `GROCERY`, plus an `OTHER` catch-all for generic containers.
- **New combos**: `WARZONE` (MILITARY + FIREARMS + WEAPONS + AMMO),
  `FOOD` (GROCERY + FRIDGE + FREEZER), `WORKSHOP` (INDUSTRIAL + MECHANIC + MATERIALS).
- **`tools/generate_groups.py`** — regenerates the group file and `GROUPS.md` from
  any `ProceduralDistributions.lua`, preserving existing membership. Re-run it on
  future builds to pick up new containers (`python tools/generate_groups.py --write`).

### Changed
- The 18 original groups were expanded with the new B42.20 containers matching their
  theme (the new prison, logging compound, factories, etc.). **Existing members are
  preserved.**
- Container names re-verified against **B42.20**.

> **B41:** this expansion is B42-only. The B41 group set is unchanged; the new groups
> are not defined on B41 (targeting them there logs a harmless "unknown group" warning).

## [1.1.0] — Location groups & combined groups

### Added
- **Combined groups (`KRCore.COMBO`)** — a single name that expands to the
  deduplicated union of several `KRCore.LOC` groups, used exactly like a normal
  group in `KRCore.dist.add()`:
  - `POWER` = `ELECTRONIC` + `MECHANIC` — energy, batteries, appliances
  - `TACTICAL` = `MILITARY` + `SURVIVAL` — field gear
  - `COLD_STORAGE` = `FRIDGE` + `FREEZER` — all cold storage
  - `COOKING` = `KITCHEN` + `STOVE` — full kitchen environment
- **New location groups** in `KRCore.LOC`:
  - `MECHANIC` — auto-parts stores and garages (car batteries, gas cans)
  - `BAR` — bars, theatres and entertainment
  - `STOVE` — residential and commercial stoves
  - `KITCHEN_SAUCES` — kitchen sauces, meats and specific goods
  - `CAFETERIA` — cafeterias and dining areas
  - `SAFEHOUSE_FOOD` — safehouse food and supplies (mid/late phases)

### Changed
- All container names re-verified against `ProceduralDistributions` in **B42.19**.
  Names that don't exist in the running build are skipped silently, so an unknown
  group never breaks distribution.

## [1.0.0] — Initial release

### Added
- **Item Distribution API** (`KRCore.dist.add`) — registers items into
  `ProceduralDistributions` using named location groups.
- **Vehicle Distribution API** (`KRCore.dist.addVehicle`) — registers vehicles
  into `VehicleZoneDistribution`.
- **Care Package Protocol** (`KRCore.registerMod` / `KRCore.addContent`) — a
  lightweight registration system that lets KR mods declare themselves and
  exchange content additions without touching each other's code.
