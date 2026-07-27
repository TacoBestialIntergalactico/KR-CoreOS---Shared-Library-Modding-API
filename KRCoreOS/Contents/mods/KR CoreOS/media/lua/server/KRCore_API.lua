-- ==========================================================================
-- KR CoreOS - API Central v1.1.0 B41.78.7 (Servidor)
-- Copyright (C) 2026 D4RK-C0MP4N1. Licensed under the MIT License (see LICENSE).
-- ==========================================================================
--
-- Este archivo debe cargarse ANTES que cualquier otro archivo de KRCore
-- y antes que los archivos de distribución de los mods dependientes.
-- Al estar en server/ y empezar por 'A', se garantiza carga primero
-- dentro del mod (orden alfabético: API < Locations < Server).
--
-- Los mods dependientes declaran en su mod.info:
--     require=KRCoreOS
-- lo que garantiza que KRCore carga antes que ellos.
-- ==========================================================================

KRCore = KRCore or {}

-- ==================== ESTADO INTERNO ====================

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

-- ==================== API DE DISTRIBUCIÓN ====================

--[[
    KRCore.dist.add(item, groups)

    Registra un item para ser añadido a ProceduralDistributions al inicio del juego.

    Parámetros:
      item   (string) -- Nombre completo del item: "Base.MiItem"
      groups (table)  -- Mapa de nombre_de_grupo -> probabilidad (número)
                         Grupos predefinidos: KRCore.LOC (KRCore_Locations.lua)
                         Grupos combinados:   KRCore.COMBO (POWER, TACTICAL,
                                              COLD_STORAGE, COOKING) — expanden
                                              a la unión de varios grupos
                         Grupos especiales:
                           custom = { {name="Container", prob=0.2}, ... }

    Ejemplo:
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
        warn("dist.add: item inválido: " .. tostring(item))
        return
    end
    if type(groups) ~= "table" then
        warn("dist.add: groups debe ser una tabla para item '" .. item .. "'")
        return
    end
    table.insert(KRCore._distQueue, { item = item, groups = groups })
end

-- ==================== API DE REGISTRO DE MODS (Care Package) ====================

--[[
    KRCore.registerMod(modID, info)

    Declara que un mod principal acepta contenido de Care Packages.

    Parámetros:
      modID (string) -- Identificador único del mod: "KRTacticalOS"
      info  (table)  -- {
                           version        = "1.0",
                           onContentAdded = function(contentType, data) ... end
                        }
--]]

function KRCore.registerMod(modID, info)
    if type(modID) ~= "string" or modID == "" then
        warn("registerMod: modID inválido")
        return
    end
    if KRCore._modRegistry[modID] then
        warn("registerMod: '" .. modID .. "' ya estaba registrado, sobreescribiendo")
    end
    KRCore._modRegistry[modID] = info
    log("Mod registrado: '" .. modID .. "' v" .. tostring(info and info.version or "?"))
end

--[[
    KRCore.addContent(targetModID, contentType, data)

    Llamado por un Care Package para añadir contenido a un mod principal.
    Si el mod principal aún no está registrado, el contenido se encola
    y se entregará cuando el mod se registre o al inicio del juego.
--]]

function KRCore.addContent(targetModID, contentType, data)
    if type(targetModID) ~= "string" or targetModID == "" then
        warn("addContent: targetModID inválido")
        return
    end
    table.insert(KRCore._contentQueue, {
        target      = targetModID,
        contentType = contentType,
        data        = data,
    })
end

-- ==================== API DE DISTRIBUCIÓN DE VEHÍCULOS ====================

--[[
    KRCore.dist.addVehicle(vehicleID, zones)

    Registra un vehículo en VehicleZoneDistribution para que spawne en el mundo.
    Se procesa en Events.OnInitWorld, cuando VehicleZoneDistribution ya está
    completamente inicializado por el engine.

    Parámetros:
      vehicleID (string) -- ID completo del vehículo: "Base.FriOSStepVan"
      zones     (table)  -- Mapa de nombre_de_zona -> spawnChance (entero)
                            Zonas estándar de PZ B41:
                              good, medium, bad, sport, junkyard,
                              trafficjams, trafficjamn, farm, ranger

    Ejemplo:
        KRCore.dist.addVehicle("Base.FriOSStepVan", {
            good        = 1,
            trafficjams = 1,
        })
--]]

KRCore._vehicleQueue = KRCore._vehicleQueue or {}

function KRCore.dist.addVehicle(vehicleID, zones)
    if type(vehicleID) ~= "string" or vehicleID == "" then
        warn("dist.addVehicle: vehicleID inválido: " .. tostring(vehicleID))
        return
    end
    if type(zones) ~= "table" then
        warn("dist.addVehicle: zones debe ser una tabla para '" .. vehicleID .. "'")
        return
    end
    table.insert(KRCore._vehicleQueue, { vehicleID = vehicleID, zones = zones })
end

-- ==================== FIN ====================
-- KRCore_Locations.lua cargará después (L > A) y poblará KRCore.LOC
-- KRCore_Server.lua cargará después (S > L) y procesará todo
