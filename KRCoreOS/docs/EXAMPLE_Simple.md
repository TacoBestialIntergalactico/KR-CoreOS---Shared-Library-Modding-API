# Simple Example — Registering Items

The minimum viable integration: put a couple of your mod's items into the world
loot with `KRCore.dist.add`. Nothing beyond this is required to ship.

---

## 1. Declare the dependency

In your `mod.info`:

```
require=KRCoreOS
```

This guarantees CoreOS loads **before** your mod, so the global `KRCore` exists by
the time your distribution file runs.

## 2. Put the file in the `server` folder

Distribution runs on the host / dedicated server, so the file **must** live under
`.../media/lua/server/`:

```
Build 42:  42/media/lua/server/YourMod_Distribution.lua
Build 41:     media/lua/server/YourMod_Distribution.lua
```

The file name is up to you; the `server/` folder is not.

## 3. The complete file

```lua
-- YourMod_Distribution.lua
local TAG = "[YourMod] "

-- Guard: if CoreOS isn't installed, KRCore is nil. Abort cleanly instead of
-- crashing on the first dist.add call.
if not KRCore then
    print(TAG .. "ERROR: KRCore not loaded. Items NOT registered.")
    return
end

-- A military-grade GPS — electronics stores + military/survival spots.
KRCore.dist.add("Base.MilitaryGPS", {
    TACTICAL   = 0.20,   -- combo: MILITARY + SURVIVAL
    ELECTRONIC = 0.15,
})

-- A bag of chips — general stores + break rooms.
KRCore.dist.add("Base.ChipsBag", {
    STORES    = 0.40,
    BREAKROOM = 0.25,
})

print(TAG .. "2 items registered with KRCore.")
```

## Line by line

| Element | What it does |
|---|---|
| `if not KRCore then … return` | Bails out safely if CoreOS is missing (no crash). |
| `KRCore.dist.add(item, groups)` | Queues `item` (full type name) for insertion into every container of each listed group. |
| `TACTICAL = 0.20` | A **combo** key — expands to the union of `MILITARY` + `SURVIVAL`, deduplicated. |
| `ELECTRONIC = 0.15` | A **group** key — one of the 18 `KRCore.LOC` groups. See [GROUPS.md](../GROUPS.md). |
| the number (`0.20`) | The spawn **weight**. In practice `~0.20` behaves like roughly a 20% chance per container. |

## What happens at runtime

`dist.add` doesn't touch the loot tables immediately — it **queues** the entry. On
the `OnPostDistributionMerge` event (which fires before item parsing, so your
additions are visible), CoreOS drains the queue, expands each group to its real
containers, deduplicates, and inserts. Expect this in the console:

```
[YourMod] 2 items registered with KRCore.
[KRCore] Distribution complete: N entries added, M skipped.
```

A non-zero `skipped` is normal — it counts container names that don't exist in the
running build (groups mix B41/B42 names on purpose).

## Verify it worked

- Look for the `[KRCore] Distribution complete` line in the console.
- **New worlds only:** containers already generated before you installed the mod
  won't receive the item retroactively.
- Fastest check: spawn one of the listed container types via Debug and inspect its
  loot, or spawn the item directly to confirm the type name is correct.

## Pitfalls

- **No guard** → `attempt to index nil value 'KRCore'` when CoreOS isn't installed.
- **File not under `server/`** → the code never runs.
- **Wrong type name** (`Base.Xyz`) → nothing spawns; it must match your item script.

---

Next: **[Advanced Example](EXAMPLE_Advanced.md)** — probability tiers, `DEV_MODE`,
`custom` container overrides, vehicles, and the Care Package protocol, plus the full
runtime timeline.
