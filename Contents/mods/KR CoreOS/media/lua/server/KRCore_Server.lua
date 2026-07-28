-- ==========================================================================
-- KR CoreOS - Server v1.1.0 B41.78.7 (Server)
-- Copyright (C) 2026 D4RK-C0MP4N1. Licensed under the MIT License (see LICENSE).
-- ==========================================================================
--
-- Processes all registrations on OnPostDistributionMerge, once every mod has
-- loaded and filled the queue via KRCore.dist.add().
--
-- B41: OnPostDistributionMerge fires after the ProceduralDistributions merge
-- and before the first ItemPicker.parseItemFromDistribution(), guaranteeing
-- visibility of the entries added here.
-- ==========================================================================

local TAG = "[KRCore] "

-- ==================== DISTRIBUTION PROCESSING ====================

-- Resolves a group's locations: first KRCore.LOC, then KRCore.COMBO
-- (combined groups: a list of group names that expand to the union of their
-- locations, deduplicating containers repeated across subgroups).
local function resolveGroupLocations(groupName)
    local locations = KRCore.LOC[groupName]
    if locations then return locations end
    local combo = KRCore.COMBO and KRCore.COMBO[groupName]
    if not combo then return nil end
    local merged, seen = {}, {}
    for _, subName in ipairs(combo) do
        local subLocs = KRCore.LOC[subName]
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
-- VehicleZoneDistribution is processed on OnInitWorld, which fires after the
-- engine has fully initialized the vehicle zone map.

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
        for zoneName, spawnChance in pairs(zones) do
            local zone = VehicleZoneDistribution[zoneName]
            if zone and zone.vehicles then
                zone.vehicles[vid] = { index = -1, spawnChance = spawnChance }
                added = added + 1
            else
                print(TAG .. "WARN: unknown vehicle zone '" .. zoneName .. "' (vehicle: " .. vid .. ")")
                skipped = skipped + 1
            end
        end
    end

    if added > 0 or skipped > 0 then
        print(TAG .. "Vehicles: " .. added .. " zones registered, " .. skipped .. " skipped.")
    end
    KRCore._vehicleQueue = {}
end

-- ==================== EVENTS ====================
--
-- OnPostDistributionMerge: processes ProceduralDistributions (items).
--   In B41 the engine parses ItemPicker.Parse lazily on the first loot spawn,
--   so any modification made here or earlier will be visible.
--
-- OnInitWorld: processes VehicleZoneDistribution.
--   VehicleZoneDistribution is loaded as a global Lua table in the engine
--   during world initialization; OnInitWorld is the first safe moment to
--   modify it.

local function onPostDistributionMerge()
    print(TAG .. "Starting KR CoreOS v1.1.0 (B41)...")
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
