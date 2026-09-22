# Vehicle Example — Registering vehicles with zone groups

How to make a custom vehicle spawn in the world with **one call**, grouped by *context*
instead of raw `VehicleZoneDistribution` zone names. This is the vehicle counterpart of the
item examples; the full group list lives in **[GROUPS_VEHICLES.md](../GROUPS_VEHICLES.md)**.

---

## 1. The one call

```lua
-- YourMod_Distribution.lua  (.../media/lua/server/ — server folder is mandatory)
if not KRCore then
    print("[YourMod] ERROR: KRCore not available. Vehicle NOT registered.")
    return
end

KRCore.dist.addVehicle("Base.MySupplyVan", {
    RESIDENTIAL = 1,   -- house driveways + parking (parkingstall/good/medium/bad)
    TRAFFIC     = 1,   -- highway pile-ups, all 4 directions
})
```

That's it. No touching `VehicleZoneDistribution`, no per-direction traffic zones, no build
branching. CoreOS queues the entry and writes it on `OnInitWorld` (when the zone map is ready).

---

## 2. `spawnChance` — how rare is it?

The value next to each name is a **weight inside that zone**, not a percentage. Vanilla cars
in a zone sit around **2–30**; the total per zone is roughly 100. So:

- `1` → **very rare** but findable (what most modded vehicles want).
- `5` → about as common as a plain van in that zone.
- `20+` → a dominant vehicle in that zone.

```lua
KRCore.dist.addVehicle("Base.MyRareProto", { RESIDENTIAL = 1 })   -- needle in a haystack
KRCore.dist.addVehicle("Base.MyCommonVan", { COMMERCIAL  = 6 })   -- shows up like a work van
```

---

## 3. What a name can be

Each key resolves in this order (first match wins):

1. **A zone group** (`KRCore.VZONE`) — `RESIDENTIAL`, `POOR`, `RICH`, `TRAFFIC`, `JUNKYARD`,
   `COMMERCIAL`, `FARM`, `AIRPORT`, `POLICE`, `FIRE`, `AMBULANCE`, `RANGER`, `SERVICES`, …
2. **A combo** (`KRCore.VCOMBO`) — `CIVILIAN`, `WRECKS`, `EMERGENCY`, `WORK`, `URBAN`,
   `ANYWHERE` — a union of several groups (recursive, deduped).
3. **A raw PZ zone** — `good`, `trafficjams`, `junkyard`, `police`, … still works, so old code
   and one-off zones keep functioning.

```lua
KRCore.dist.addVehicle("Base.MyCityCar", {
    URBAN = 1,          -- combo: RESIDENTIAL + COMMERCIAL + TRAFFIC
})

KRCore.dist.addVehicle("Base.MyPatrolCar", {
    EMERGENCY = 1,      -- combo: POLICE + FIRE + AMBULANCE + RANGER
})

KRCore.dist.addVehicle("Base.MyLegacyVan", {
    good = 1, trafficjams = 1,   -- raw zone names, unchanged from older CoreOS
})
```

Unknown names print a `WARN` and are skipped; zones missing on the running build are skipped
silently (like item groups).

---

## 4. `custom` — pin a specific zone

For a raw zone at a specific weight (and optional skin `index`), use `custom`. It's applied
**before** groups, so it wins if a group also touches that zone:

```lua
KRCore.dist.addVehicle("Base.MyWreck", {
    TRAFFIC = 1,
    custom = {
        { name = "junkyard", chance = 5, index = -1 },   -- extra-common in scrapyards
    },
})
```
`chance` defaults to `1`, `index` (skin) defaults to `-1` (random skin from the vehicle's list).

---

## 5. Dedupe is by vehicle table (traffic & business)

Some PZ zones are **aliases of one table**: the four `trafficjam*` directions share a table,
and `business2..business12` alias `business`. CoreOS dedupes per vehicle **by that table**, so:

- `TRAFFIC` (all four directions) writes your vehicle **once** — it appears in jams facing any
  direction, without four redundant entries.
- Passing both a group and a raw alias of the same table won't double-insert; the first write
  (i.e. `custom`, then the group) wins.

---

## 6. Full example file

```lua
-- YourMod_Distribution.lua  (.../media/lua/server/)
local TAG = "[YourMod] "

-- Per-vehicle rarity in one place -> retuning is a one-line change.
local V = {
    VAN   = { RESIDENTIAL = 1, TRAFFIC = 1 },
    TRUCK = { WORK = 2, FARM = 3 },
}

if not KRCore then
    print(TAG .. "ERROR: KRCore not loaded. Vehicles NOT registered.")
    return
end

KRCore.dist.addVehicle("Base.MySupplyVan", V.VAN)
KRCore.dist.addVehicle("Base.MyFarmTruck", V.TRUCK)

print(TAG .. "Vehicle registration queued.")
```

---

## 7. Timeline & cross-build

- **File load** — `addVehicle` only queues; nothing is written yet.
- **`OnInitWorld`** — CoreOS resolves names and writes into `VehicleZoneDistribution`
  (the first point where it's fully initialized — later than items, which run on
  `OnPostDistributionMerge`).
- **Cross-build:** the group **taxonomy targets B42 zones**. On B41 the raw-name API still
  works; target raw B41 zones (or `custom`) there. Missing zones are skipped silently.

---

See also: **[GROUPS_VEHICLES.md](../GROUPS_VEHICLES.md)** (every group → zones) ·
**[EXAMPLE_Advanced.md](EXAMPLE_Advanced.md)** (items, tiers, Care Packages) ·
**[README.md](../README.md)** (API reference).
