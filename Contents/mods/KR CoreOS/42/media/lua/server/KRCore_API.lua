-- ==========================================================================
-- KR CoreOS - Core API v1.2.0 B42.20.0 (Server)
-- Copyright (C) 2026 D4RK-C0MP4N1. Licensed under the MIT License (see LICENSE).
-- ==========================================================================
--
-- This file must load BEFORE any other KRCore file and before the distribution
-- files of the dependent mods. Living in server/ and starting with 'A'
-- guarantees it loads first within the mod (alphabetical order:
-- API < Locations < Server).
--
-- Dependent mods declare in their mod.info:
--     require=KRCoreOS
-- which guarantees KRCore loads before them.
-- ==========================================================================

KRCore = KRCore or {}

-- ==================== INTERNAL STATE ====================

KRCore._distQueue    = KRCore._distQueue    or {}  -- { item, groupsAndProbs }
KRCore._modRegistry  = KRCore._modRegistry  or {}  -- { modID -> { version, onContentAdded } }
KRCore._contentQueue = KRCore._contentQueue or {}  -- { targetModID, contentType, data }
KRCore._initialized  = false

-- ==================== LOGGING ====================

local TAG = "[KRCore] "

local function log(msg)
    print(TAG .. tostring(msg))
end

local function warn(msg)
    print(TAG .. "WARN: " .. tostring(msg))
end

-- ==================== DISTRIBUTION API ====================

--[[
    KRCore.dist.add(item, groups)

    Registers an item to be added to ProceduralDistributions at game start.

    Parameters:
      item   (string) -- Full item name: "Base.MyItem"
      groups (table)  -- Map of group_name -> probability (number)
                         Predefined groups: KRCore.LOC (KRCore_Locations.lua)
                         Combined groups:   KRCore.COMBO (POWER, TACTICAL,
                                            COLD_STORAGE, COOKING) — expand to
                                            the union of several groups
                         Special groups:
                           custom = { {name="Container", prob=0.2}, ... }

    Example:
        KRCore.dist.add("Base.FriOSC", {
            MILITARY    = 0.2,
            SURVIVAL    = 0.4,
            ELECTRONIC  = 0.4,
            FRIDGE      = 0.4,
            KITCHEN     = 0.15,
            custom      = { {name = "GroceryFreezer", prob = 0.1} },
        })
--]]

KRCore.dist = KRCore.dist or {}

function KRCore.dist.add(item, groups)
    if type(item) ~= "string" or item == "" then
        warn("dist.add: invalid item: " .. tostring(item))
        return
    end
    if type(groups) ~= "table" then
        warn("dist.add: groups must be a table for item '" .. item .. "'")
        return
    end
    table.insert(KRCore._distQueue, { item = item, groups = groups })
end

-- ==================== MOD REGISTRATION API (Care Package) ====================

--[[
    KRCore.registerMod(modID, info)

    Declares that a host mod accepts Care Package content.

    Parameters:
      modID (string) -- Unique mod identifier: "KRTacticalOS"
      info  (table)  -- {
                           version        = "1.0",
                           onContentAdded = function(contentType, data) ... end
                        }

    Example:
        KRCore.registerMod("KRTacticalOS", {
            version = "1.0",
            onContentAdded = function(contentType, data)
                if contentType == "weapon" then
                    KRTactical.registerWeapon(data)
                end
            end
        })
--]]

function KRCore.registerMod(modID, info)
    if type(modID) ~= "string" or modID == "" then
        warn("registerMod: invalid modID")
        return
    end
    if KRCore._modRegistry[modID] then
        warn("registerMod: '" .. modID .. "' was already registered, overwriting")
    end
    KRCore._modRegistry[modID] = info
    log("Mod registered: '" .. modID .. "' v" .. tostring(info and info.version or "?"))
end

--[[
    KRCore.addContent(targetModID, contentType, data)

    Called by a Care Package to add content to a host mod.
    If the host mod isn't registered yet, the content is queued and
    delivered when the mod registers or at game start.

    Parameters:
      targetModID  (string) -- Target mod ID: "KRTacticalOS"
      contentType  (string) -- Content type: "weapon", "clothing", "food", etc.
      data         (table)  -- Content data (free structure, defined by the target mod)
--]]

function KRCore.addContent(targetModID, contentType, data)
    if type(targetModID) ~= "string" or targetModID == "" then
        warn("addContent: invalid targetModID")
        return
    end
    table.insert(KRCore._contentQueue, {
        target      = targetModID,
        contentType = contentType,
        data        = data,
    })
end

-- ==================== VEHICLE DISTRIBUTION API ====================

--[[
    KRCore.dist.addVehicle(vehicleID, zones)

    Registers a vehicle in VehicleZoneDistribution so it spawns in the world.
    Processed on Events.OnInitWorld (after OnPostDistributionMerge), when
    VehicleZoneDistribution is fully initialized by the engine.

    Parameters:
      vehicleID (string) -- Full vehicle ID: "Base.FriOSStepVan"
      zones     (table)  -- Map of zone_name -> spawnChance (integer)
                            Standard PZ B42 zones:
                              parkingstall, good, medium, bad,
                              sport, junkyard, trafficjams, trafficjamn

    Example:
        KRCore.dist.addVehicle("Base.FriOSStepVan", {
            good        = 1,
            trafficjams = 1,
        })
--]]

KRCore._vehicleQueue = KRCore._vehicleQueue or {}

function KRCore.dist.addVehicle(vehicleID, zones)
    if type(vehicleID) ~= "string" or vehicleID == "" then
        warn("dist.addVehicle: invalid vehicleID: " .. tostring(vehicleID))
        return
    end
    if type(zones) ~= "table" then
        warn("dist.addVehicle: zones must be a table for '" .. vehicleID .. "'")
        return
    end
    table.insert(KRCore._vehicleQueue, { vehicleID = vehicleID, zones = zones })
end

-- ==================== END ====================
-- KRCore_Locations.lua loads next (L > A) and populates KRCore.LOC
-- KRCore_Server.lua loads next (S > L) and processes everything
