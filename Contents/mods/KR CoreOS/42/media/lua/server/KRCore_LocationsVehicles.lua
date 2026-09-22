-- ==========================================================================
-- KR CoreOS - Vehicle Zone Groups v1.2.3 B42.20.0 (Server)
-- Copyright (C) 2026 D4RK-C0MP4N1. Licensed under the MIT License (see LICENSE).
-- ==========================================================================
--
-- Semantic groups of VehicleZoneDistribution zones -- the vehicle equivalent of
-- KRCore.LOC / KRCore.COMBO for items. Mods register vehicles with friendly
-- names (RESIDENTIAL, TRAFFIC, WORK, ...) instead of raw PZ zone names.
--
--   KRCore.VZONE  = atomic groups: name -> list of raw VehicleZoneDistribution zones.
--   KRCore.VCOMBO = combined groups: name -> list of VZONE/VCOMBO names
--                   (recursive union with dedupe), used just like a normal group.
--
-- KRCore.dist.addVehicle() still accepts RAW zone names too (backward compat):
-- resolution order is VZONE -> VCOMBO -> raw zone. See KRCore_API.lua.
--
-- All zone names verified against VehicleZoneDefinition.lua (B42.20.0). Names not
-- present in a given build are skipped silently by the engine (like item groups).
-- Read at OnInitWorld (processVehicleDistributions), so load order vs Server does
-- not matter; this file loads with the rest at startup.
--
-- PZ INTERNALS worth knowing (why some groups look the way they do):
--   * The 4 traffic-jam zones (trafficjamn/s/e/w) SHARE one vehicle table, so
--     TRAFFIC covers ALL directions; the engine dedupes by table -> writes once.
--   * 'business' has aliases business2..business12 (same table) that weight the
--     EMS/commercial ratio; writing to 'business' alone suffices (dedupe skips them).
--   * The 3Network van zone is 'network3' (NOT 'network').
--   * trades/delivery/professional/middleClass/struggling/evacuee/racecar are used
--     ONLY by randomized vehicle STORIES, not regular map spawning (grouped as STORY).
-- ==========================================================================

KRCore = KRCore or {}

-- ==================== ATOMIC GROUPS ====================
-- A vehicle's spawnChance is a WEIGHT inside each zone (vanilla cars sit at 2..30;
-- use a low value like 1-3 to make a modded vehicle rare-but-findable).
KRCore.VZONE = {

    -- ===== Residential / parking (house driveways + generic lots) =====
    -- parkingstall = generic lots (shops, houses); good/medium/bad = quality of the
    -- neighbourhood the driveway belongs to.
    RESIDENTIAL = { "parkingstall", "good", "medium", "bad" },
    PARKING     = { "parkingstall" },                       -- only the generic lot
    POOR        = { "bad", "trailerpark" },                 -- low-income areas
    RICH        = { "good", "luxuryDealership", "sport" },  -- affluent areas + dealerships
    DEALERSHIP  = { "luxuryDealership" },

    -- ===== Roads / wrecks (burnt & damaged) =====
    TRAFFIC     = { "trafficjams", "trafficjamn", "trafficjame", "trafficjamw" },
    JUNKYARD    = { "junkyard" },

    -- ===== Work / commercial / rural =====
    COMMERCIAL  = { "business" },                           -- large branded/trade van pool
    FARM        = { "farm" },                               -- rural trailers & pickups
    AIRPORT     = { "airportshuttle", "airportservice" },

    -- ===== Emergency / authority =====
    POLICE      = { "police" },
    PRISON      = { "prison" },
    FIRE        = { "fire" },
    AMBULANCE   = { "ambulance" },
    RANGER      = { "ranger" },

    -- ===== Branded single-brand service/utility zones (spawn near their business) =====
    SERVICES    = { "postal", "spiffo", "radio", "fossoil", "mccoy", "carpenter",
                    "massgenfac", "transit", "network3", "kyheralds", "lectromax",
                    "knoxdisti", "scarlet" },
    ADVERTISING = { "advertising" },

    -- ===== Story-only (randomized vehicle stories; NOT regular map spawning) =====
    STORY       = { "trades", "delivery", "professional", "middleClass",
                    "struggling", "evacuee", "racecar" },
}

-- ==================== COMBINED GROUPS ====================
-- A name that expands to the union of several VZONE/VCOMBO groups (deduped).
KRCore.VCOMBO = {
    CIVILIAN  = { "RESIDENTIAL", "POOR", "RICH" },              -- any normal neighbourhood/parking
    WRECKS    = { "TRAFFIC", "JUNKYARD" },                      -- crashed / burnt vehicles
    EMERGENCY = { "POLICE", "FIRE", "AMBULANCE", "RANGER" },    -- first responders
    WORK      = { "COMMERCIAL", "FARM", "AIRPORT", "SERVICES" },-- work / utility
    URBAN     = { "RESIDENTIAL", "COMMERCIAL", "TRAFFIC" },     -- typical city presence
    ANYWHERE  = { "RESIDENTIAL", "COMMERCIAL", "TRAFFIC", "JUNKYARD", "FARM" }, -- broad coverage
}
