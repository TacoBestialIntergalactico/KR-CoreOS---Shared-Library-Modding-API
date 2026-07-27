# Advanced Example — Tiers, Overrides, Vehicles & Care Packages

Everything the KR mods use internally, and the runtime details behind it. Assumes
you've read the **[Simple Example](EXAMPLE_Simple.md)**.

---

## 1. Probability tiers (H / M / L)

Define per-item tiers once and reference them across groups. Retuning an item's
overall rarity then becomes a **one-line change** instead of editing every entry.

```lua
local P = {
    GPS   = { H = 0.20, M = 0.10, L = 0.05 },
    CHIPS = { H = 0.45, M = 0.25, L = 0.10 },
}
```

## 2. DEV_MODE

A single switch that forces every probability high so items flood containers during
testing. **Never ship with it on.**

```lua
local DEV_MODE = false
local DEV      = 10.0

if DEV_MODE then
    for _, tiers in pairs(P) do
        tiers.H, tiers.M, tiers.L = DEV, DEV, DEV
    end
    print("[YourMod] DEV_MODE ON — probabilities forced to " .. DEV)
end
```

## 3. `custom` container overrides

`custom` targets a raw `ProceduralDistributions.list` container by its internal
name:

```lua
custom = {
    { name = "CrateBatteries",  prob = 0.50 },
    { name = "GunStoreCounter", prob = 0.10 },
}
```

**Determinism rule:** for each item, CoreOS processes `custom` **before** groups,
and the **first** insertion into a given container wins. So if `CrateBatteries` also
belongs to a group you passed, the `custom` value (`0.50`) is the one that applies —
letting you pin a single container higher or lower than its group without giving up
the group. Unknown `custom` names print a `WARN`; unknown names *inside groups* are
skipped silently (groups deliberately mix B41/B42 names).

## 4. Full advanced distribution file

```lua
-- YourMod_Distribution.lua  (.../media/lua/server/)
local TAG = "[YourMod] "

-- ---- config ----
local DEV_MODE = false
local DEV      = 10.0
local P = {
    GPS = { H = 0.20, M = 0.10, L = 0.05 },
    VAN = { good = 1, trafficjams = 1 },
}
if DEV_MODE then
    P.GPS.H, P.GPS.M, P.GPS.L = DEV, DEV, DEV
    print(TAG .. "DEV_MODE ON")
end

-- ---- guard ----
if not KRCore then
    print(TAG .. "ERROR: KRCore not loaded. Nothing registered.")
    return
end

-- ---- items ----
KRCore.dist.add("Base.MilitaryGPS", {
    TACTICAL   = P.GPS.H,   -- MILITARY + SURVIVAL (combo)
    ELECTRONIC = P.GPS.M,
    SPECIAL    = P.GPS.H,
    custom = {
        { name = "GunStoreCounter", prob = P.GPS.M },
        { name = "PawnShopTools",   prob = P.GPS.L },
    },
})

-- ---- vehicles ----
KRCore.dist.addVehicle("Base.SupplyVan", {
    good        = P.VAN.good,
    trafficjams = P.VAN.trafficjams,
})

print(TAG .. "Registration queued.")
```

## 5. Vehicles

`addVehicle(id, zones)` writes into `VehicleZoneDistribution`. `zones` maps a zone
name to an integer `spawnChance`. Standard B42 zones:

```
parkingstall, good, medium, bad, sport, junkyard, trafficjams, trafficjamn
```

Vehicles are processed later than items — on `OnInitWorld` (see the timeline below),
because `VehicleZoneDistribution` isn't ready during `OnPostDistributionMerge`.

## 6. Care Package protocol (add-on architecture)

Lets an **add-on** mod push content into a **host** mod with no shared code and no
hard load-order requirement between the two — CoreOS brokers it.

**Host** declares itself and a handler:

```lua
KRCore.registerMod("KRTacticalOS", {
    version = "1.0",
    onContentAdded = function(contentType, data)
        if contentType == "weapon" then
            KRTactical.registerWeapon(data)
        end
    end,
})
```

**Add-on** pushes content to that host:

```lua
KRCore.addContent("KRTacticalOS", "weapon", { id = "Base.M9Bayonet" --[[ , ... ]] })
```

Both calls happen at file load. On `OnPostDistributionMerge`, CoreOS runs the
content queue: for each entry it looks up the target in the registry and invokes its
`onContentAdded` (guarded by `pcall`, so a faulty callback can't take down the
event). If the target isn't registered by then, the entry is dropped with a single
`WARN`. `contentType` and `data` are an open contract — the host mod defines their
shape.

---

# Technical appendix

## Event timeline (B42)

1. **File load** — with order fixed by `require`. `dist.add`, `addVehicle`,
   `registerMod` and `addContent` only fill internal queues; nothing is written yet.
2. **`OnPostDistributionMerge`** — runs `processContentQueue()` then
   `processDistributions()`. This fires *after* the vanilla distribution merge and
   *before* `ItemPickerJava.Parse()`, which is exactly why items inserted here are
   visible in the world.
3. **`OnInitWorld`** — runs `processVehicleDistributions()`, the first point where
   `VehicleZoneDistribution` is fully initialized.

## Load-order guarantee

`require=KRCoreOS` loads CoreOS before dependent mods. Inside CoreOS, the `server/`
folder plus alphabetical file names load `KRCore_API` → `KRCore_Locations` →
`KRCore_Server`, so the API and the group tables exist before the processor runs.

## Weight semantics

Insertion is literally `table.insert(list.items, item)` followed by
`table.insert(list.items, prob)`, so `prob` becomes the item's weight **relative to
that container's `rolls`**. Treat it as an approximate percentage (`0.30` ≈ 30%), not
an exact probability.

## De-duplication

Each item carries a `usedContainers` set during processing. Because groups can
overlap (e.g. `GarageMechanics` is in both `INDUSTRIAL` and `MECHANIC`, and every
combo overlaps its sub-groups), the set guarantees an item is inserted **at most once
per container**. The first write wins — which is what makes the `custom` override
deterministic.

## Cross-build safety

Container names are resolved against the running build's `ProceduralDistributions.list`;
any name that doesn't exist is skipped silently. The same `dist.add` call therefore
works unchanged on B41 and B42 — no build branching in your code.

---

See also: **[GROUPS.md](../GROUPS.md)** (every group → container mapping) ·
**[README.md](../README.md)** (API reference).
