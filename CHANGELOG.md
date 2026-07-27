# Changelog

All notable changes to **KR CoreOS** are documented here.
This project targets Project Zomboid **Build 41** and **Build 42**.

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
