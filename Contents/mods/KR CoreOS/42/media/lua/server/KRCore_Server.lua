-- ==========================================================================
-- KR CoreOS - Server v1.2.3 B42.20.0 (Server)
-- Copyright (C) 2026 D4RK-C0MP4N1. Licensed under the MIT License (see LICENSE).
-- ==========================================================================
--
-- Processes all registrations on OnPostDistributionMerge, once every mod has
-- loaded and filled the queue via KRCore.dist.add().
--
-- ==========================================================================

local TAG = "[KRCore] "

-- ==================== DISTRIBUTION PROCESSING ====================

-- Resolves a group's locations to a flat, deduplicated container list.
-- A name is looked up first in KRCore.LOC (atomic groups), then in
-- KRCore.COMBO (combined groups: a list of subgroup names). Combos resolve
-- RECURSIVELY, so a combo may reference atomic groups AND other combos; the
-- 'seenGroups' set guards against reference cycles. Containers repeated across
-- subgroups are deduplicated.
local function resolveGroupLocations(groupName, seenGroups)
    local locations = KRCore.LOC[groupName]
    if locations then return locations end
    local combo = KRCore.COMBO and KRCore.COMBO[groupName]
    if not combo then return nil end
    seenGroups = seenGroups or {}
    if seenGroups[groupName] then return {} end   -- cycle guard
    seenGroups[groupName] = true
    local merged, seen = {}, {}
    for _, subName in ipairs(combo) do
        local subLocs = resolveGroupLocations(subName, seenGroups)
        if subLocs then
            for _, locName in ipairs(subLocs) do
                if not seen[locName] then
                    seen[locName] = true
                    table.insert(merged, locName)
                end
            end
        else
            print(TAG .. "WARN: COMBO '" .. groupName .. "' references non-existent group '" .. tostring(subName) .. "'")
        end
    end
    return merged
end

local function processDistributions()
    require "Items/ProceduralDistributions"

    local added   = 0
    local skipped = 0

    for _, entry in ipairs(KRCore._distQueue) do
        local item   = entry.item
        local groups = entry.groups
        -- Containers already filled for THIS item: avoids duplicate entries when
        -- two groups (or a combo and a standalone group) share a container
        -- (e.g. GarageMechanics is in both INDUSTRIAL and MECHANIC).
        local usedContainers = {}

        local function insertItem(locName, prob, warnIfMissing)
            if usedContainers[locName] then
                skipped = skipped + 1
                return
            end
            local list = ProceduralDistributions.list[locName]
            if list and list.items then
                usedContainers[locName] = true
                table.insert(list.items, item)
                table.insert(list.items, prob)
                added = added + 1
            else
                -- Non-existent group locations are skipped silently: groups
                -- include both B41 and B42 names and each build uses its own.
                if warnIfMissing then
                    print(TAG .. "WARN: invalid custom location: '" .. tostring(locName) .. "' (item: " .. item .. ")")
                end
                skipped = skipped + 1
            end
        end

        -- The "custom" entries are processed FIRST: they are explicit overrides
        -- and, with the dedupe, the first insertion into a container wins. So a
        -- custom entry can set a different probability than the group that also
        -- contains that container, deterministically.
        if type(groups.custom) == "table" then
            for _, loc in ipairs(groups.custom) do
                insertItem(loc.name, loc.prob, true)
            end
        end

        for groupName, prob in pairs(groups) do
            if groupName ~= "custom" then
                -- Predefined group (KRCore.LOC) or combined group (KRCore.COMBO)
                local locations = resolveGroupLocations(groupName)
                if not locations then
                    print(TAG .. "WARN: unknown group '" .. groupName .. "' (item: " .. item .. ")")
                    skipped = skipped + 1
                else
                    for _, locName in ipairs(locations) do
                        insertItem(locName, prob, false)
                    end
                end
            end
        end
    end

    print(TAG .. "Distribution complete: " .. added .. " entries added, " .. skipped .. " skipped.")
    KRCore._distQueue = {}
end

-- ==================== CARE PACKAGE PROCESSING ====================

local function processContentQueue()
    local delivered = 0
    local pending   = 0

    for _, entry in ipairs(KRCore._contentQueue) do
        local modInfo = KRCore._modRegistry[entry.target]
        if modInfo and type(modInfo.onContentAdded) == "function" then
            local ok, err = pcall(modInfo.onContentAdded, entry.contentType, entry.data)
            if ok then
                delivered = delivered + 1
            else
                print(TAG .. "ERROR delivering content to '" .. entry.target .. "': " .. tostring(err))
            end
        else
            pending = pending + 1
            if pending == 1 then
                print(TAG .. "WARN: target mod '" .. entry.target .. "' not registered, content ignored.")
            end
        end
    end

    if delivered > 0 then
        print(TAG .. "Care Packages: " .. delivered .. " content items delivered.")
    end
    KRCore._contentQueue = {}
end

-- ==================== VEHICLE PROCESSING ====================
-- VehicleZoneDistribution is processed on OnInitWorld, which fires after
-- OnPostDistributionMerge. At that point the zone map is fully initialized by
-- the engine and it's safe to insert vehicle entries.
--
-- Mirrors the item pipeline: names resolve through semantic groups (KRCore.VZONE),
-- combined groups (KRCore.VCOMBO, recursive), and a raw VehicleZoneDistribution
-- zone name as a fallback (backward compat). Supports a 'custom' override list and
-- dedupes per vehicle so aliased zones aren't written twice.

-- Resolves a vehicle-zone name to a flat, deduplicated list of RAW zone names.
-- Order: VZONE (atomic) -> VCOMBO (combined, recursive) -> raw zone (compat).
-- 'seen' guards against reference cycles in VCOMBO.
local function resolveVehicleZones(name, seen)
    local atomic = KRCore.VZONE and KRCore.VZONE[name]
    if atomic then return atomic end
    local combo = KRCore.VCOMBO and KRCore.VCOMBO[name]
    if combo then
        seen = seen or {}
        if seen[name] then return {} end   -- cycle guard
        seen[name] = true
        local merged, seenZone = {}, {}
        for _, subName in ipairs(combo) do
            local subZones = resolveVehicleZones(subName, seen)
            if subZones then
                for _, z in ipairs(subZones) do
                    if not seenZone[z] then
                        seenZone[z] = true
                        table.insert(merged, z)
                    end
                end
            else
                print(TAG .. "WARN: VCOMBO '" .. name .. "' references non-existent group/zone '" .. tostring(subName) .. "'")
            end
        end
        return merged
    end
    -- Backward compat: a raw VehicleZoneDistribution zone name works as its own group.
    if VehicleZoneDistribution[name] then return { name } end
    return nil
end

local function processVehicleDistributions()
    if not VehicleZoneDistribution then
        print(TAG .. "WARN: VehicleZoneDistribution not available, vehicles skipped.")
        return
    end

    local added   = 0
    local skipped = 0

    for _, entry in ipairs(KRCore._vehicleQueue) do
        local vid   = entry.vehicleID
        local zones = entry.zones
        -- Dedupe per vehicle by the VEHICLES TABLE (not the zone name): several PZ
        -- zones alias one table (trafficjamn/s/e/w share it; business2..12 too), so
        -- this writes the vehicle once and keeps the first spawnChance (custom wins).
        local usedTables = {}

        local function insertVehicle(zoneName, spawnChance, index, warnIfMissing)
            local zone = VehicleZoneDistribution[zoneName]
            if zone and zone.vehicles then
                if usedTables[zone.vehicles] then
                    skipped = skipped + 1
                    return
                end
                usedTables[zone.vehicles] = true
                zone.vehicles[vid] = { index = index or -1, spawnChance = spawnChance }
                added = added + 1
            else
                -- Silent for group members (a build may lack a zone); loud for explicit
                -- 'custom' entries and unknown top-level names.
                if warnIfMissing then
                    print(TAG .. "WARN: unknown vehicle zone '" .. tostring(zoneName) .. "' (vehicle: " .. vid .. ")")
                end
                skipped = skipped + 1
            end
        end

        -- 'custom' first: explicit raw-zone overrides. With the table dedupe, the
        -- first write into a shared table wins, so custom can set a distinct chance.
        --   custom = { { name = "junkyard", chance = 5, index = -1 }, ... }
        if type(zones.custom) == "table" then
            for _, c in ipairs(zones.custom) do
                insertVehicle(c.name, c.chance or c.spawnChance or 1, c.index, true)
            end
        end

        for name, spawnChance in pairs(zones) do
            if name ~= "custom" then
                local resolved = resolveVehicleZones(name)
                if not resolved then
                    print(TAG .. "WARN: unknown vehicle zone/group '" .. tostring(name) .. "' (vehicle: " .. vid .. ")")
                    skipped = skipped + 1
                else
                    for _, zoneName in ipairs(resolved) do
                        insertVehicle(zoneName, spawnChance, nil, false)
                    end
                end
            end
        end
    end

    if added > 0 or skipped > 0 then
        print(TAG .. "Vehicles: " .. added .. " entries added, " .. skipped .. " skipped (dupes/missing).")
    end
    KRCore._vehicleQueue = {}
end

-- ==================== EVENTS ====================
--
-- OnPostDistributionMerge: processes ProceduralDistributions (items).
--   CRITICAL (B42): ItemPickerJava.Parse() happens after this event and before
--   OnGameStart. Inserting items here guarantees they are visible.
--
-- OnInitWorld: processes VehicleZoneDistribution.
--   VehicleZoneDistribution isn't initialized during OnPostDistributionMerge;
--   OnInitWorld is the first safe moment to modify it.

local function onPostDistributionMerge()
    print(TAG .. "Starting KR CoreOS v1.2.3...")
    processContentQueue()
    processDistributions()
    KRCore._initialized = true
    print(TAG .. "Ready.")
end

local function onInitWorld()
    processVehicleDistributions()
end

Events.OnPostDistributionMerge.Add(onPostDistributionMerge)
Events.OnInitWorld.Add(onInitWorld)
