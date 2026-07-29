# Changelog

All notable changes to **KR CoreOS** are documented here.
This project targets Project Zomboid **Build 41** and **Build 42**.

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

> **Balance note:** groups the KR mods register into are now larger — most importantly
> `POWER` (`ELECTRONIC` + `MECHANIC`) grew from ~26 to ~80 containers, and `MILITARY`,
> `SURVIVAL` and `KITCHEN` also grew. Items registered to them will spawn in more
> places once this CoreOS version is live. Retune your mods' probabilities if you want
> to keep the previous rarity.

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
