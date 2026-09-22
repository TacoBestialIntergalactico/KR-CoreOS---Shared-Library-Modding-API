# KR CoreOS — Vehicle Zone Groups Reference

Full map of every **vehicle zone group** and the exact `VehicleZoneDistribution` zones it
expands to. A *group* is a named list of real in-game spawn zones sorted by context, so you
write `RESIDENTIAL = 1` instead of naming raw PZ zones by hand — the vehicle equivalent of
[GROUPS.md](GROUPS.md) for items.

- **18 zone groups (`KRCore.VZONE`)** + **6 combos (`KRCore.VCOMBO`)**, over the B42.20 vanilla
  vehicle zones.
- Names verified against `media/lua/shared/VehicleZoneDefinition.lua` (B42.20.0). Zones absent
  in the running build are skipped silently.
- `spawnChance` is a **weight inside each zone** (vanilla cars sit around **2–30**); use a low
  value like **1–3** to make a modded vehicle rare-but-findable.
- **Raw zone names still work** in `addVehicle` — resolution order is `VZONE` → `VCOMBO` → raw
  zone. See [docs/EXAMPLE_Vehicles.md](docs/EXAMPLE_Vehicles.md).

> **Why some groups look the way they do (PZ internals):**
> - The four traffic-jam zones (`trafficjamn/s/e/w`) **share one vehicle table**, so `TRAFFIC`
>   covers *all* directions; the engine dedupes by table, writing once.
> - `business` has aliases `business2..business12` (same table) that weight the EMS/commercial
>   ratio; writing to `business` alone is enough.
> - The 3Network van zone is `network3` (not `network`).
> - `trades / delivery / professional / middleClass / struggling / evacuee / racecar` are used
>   only by **randomized vehicle stories**, not regular map spawning (grouped as `STORY`).

## Overview — zone groups

| Group | Zones | What it is |
|---|--:|---|
| [`RESIDENTIAL`](#residential) | 4 | House driveways + generic parking, all qualities |
| [`PARKING`](#parking) | 1 | Generic parking lots only (shops, houses) |
| [`POOR`](#poor) | 2 | Low-income neighbourhoods |
| [`RICH`](#rich) | 3 | Affluent neighbourhoods + dealerships |
| [`DEALERSHIP`](#dealership) | 1 | Car dealership lots |
| [`TRAFFIC`](#traffic) | 4 | Highway pile-ups, all directions (burnt/damaged) |
| [`JUNKYARD`](#junkyard) | 1 | Scrapyards and random crash sites (burnt/damaged) |
| [`COMMERCIAL`](#commercial) | 1 | Branded / trade van pool (large) |
| [`FARM`](#farm) | 1 | Rural trailers and pickups |
| [`AIRPORT`](#airport) | 2 | Airport shuttles and service vehicles |
| [`POLICE`](#police) | 1 | Police cars and vans |
| [`PRISON`](#prison) | 1 | Prison transport |
| [`FIRE`](#fire) | 1 | Fire department |
| [`AMBULANCE`](#ambulance) | 1 | Ambulances |
| [`RANGER`](#ranger) | 1 | Park rangers |
| [`SERVICES`](#services) | 13 | Branded single-brand service/utility vans |
| [`ADVERTISING`](#advertising) | 1 | Advertising trailers |
| [`STORY`](#story) | 7 | Randomized vehicle stories only (**not** regular map spawns) |

## Overview — combos

| Combo | Expands to | Notes |
|---|---|---|
| `CIVILIAN` | `RESIDENTIAL` + `POOR` + `RICH` | any normal neighbourhood / parking |
| `WRECKS` | `TRAFFIC` + `JUNKYARD` | crashed / burnt vehicles |
| `EMERGENCY` | `POLICE` + `FIRE` + `AMBULANCE` + `RANGER` | first responders |
| `WORK` | `COMMERCIAL` + `FARM` + `AIRPORT` + `SERVICES` | work / utility |
| `URBAN` | `RESIDENTIAL` + `COMMERCIAL` + `TRAFFIC` | typical city presence |
| `ANYWHERE` | `RESIDENTIAL` + `COMMERCIAL` + `TRAFFIC` + `JUNKYARD` + `FARM` | broad coverage |

---

## RESIDENTIAL
House driveways + generic parking, all qualities. **4 zones:**
```
parkingstall, good, medium, bad
```

## PARKING
Generic parking lots only (shops, houses). **1 zone:**
```
parkingstall
```

## POOR
Low-income neighbourhoods. **2 zones:**
```
bad, trailerpark
```

## RICH
Affluent neighbourhoods + dealerships. **3 zones:**
```
good, luxuryDealership, sport
```

## DEALERSHIP
Car dealership lots. **1 zone:**
```
luxuryDealership
```

## TRAFFIC
Highway pile-ups, all directions (burnt/damaged). The four zones share one vehicle table, so
this covers every jam direction. **4 zones:**
```
trafficjams, trafficjamn, trafficjame, trafficjamw
```

## JUNKYARD
Scrapyards and random crash sites (burnt/damaged). **1 zone:**
```
junkyard
```

## COMMERCIAL
Branded / trade van pool (large; `business2..12` are aliases of `business`). **1 zone:**
```
business
```

## FARM
Rural trailers and pickups. **1 zone:**
```
farm
```

## AIRPORT
Airport shuttles and service vehicles. **2 zones:**
```
airportshuttle, airportservice
```

## POLICE
Police cars and vans. **1 zone:**
```
police
```

## PRISON
Prison transport. **1 zone:**
```
prison
```

## FIRE
Fire department. **1 zone:**
```
fire
```

## AMBULANCE
Ambulances. **1 zone:**
```
ambulance
```

## RANGER
Park rangers. **1 zone:**
```
ranger
```

## SERVICES
Branded single-brand service/utility van zones (spawn near their business). **13 zones:**
```
postal, spiffo, radio, fossoil, mccoy, carpenter, massgenfac, transit, network3, kyheralds,
lectromax, knoxdisti, scarlet
```

## ADVERTISING
Advertising trailers. **1 zone:**
```
advertising
```

## STORY
Randomized vehicle stories only — **not** regular map-based spawning. Advanced use. **7 zones:**
```
trades, delivery, professional, middleClass, struggling, evacuee, racecar
```

---

See also: **[docs/EXAMPLE_Vehicles.md](docs/EXAMPLE_Vehicles.md)** (how to register a vehicle) ·
**[GROUPS.md](GROUPS.md)** (item groups) · **[README.md](README.md)** (API reference).
