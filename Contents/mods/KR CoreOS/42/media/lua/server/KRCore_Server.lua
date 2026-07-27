-- ==========================================================================
-- KR CoreOS - Servidor v1.1.0 B42.19.0 (Servidor)
-- Copyright (C) 2026 D4RK-C0MP4N1. Licensed under the MIT License (see LICENSE).
-- ==========================================================================
--
-- Procesa todas las registraciones en OnGameStart, cuando todos los mods
-- ya cargaron y llenaron la queue via KRCore.dist.add().
-- ==========================================================================

local TAG = "[KRCore] "

-- ==================== PROCESAMIENTO DE DISTRIBUCIÓN ====================

-- Resuelve las ubicaciones de un grupo: primero KRCore.LOC, después KRCore.COMBO
-- (grupos combinados: lista de nombres de grupos que se expanden a la unión de
-- sus ubicaciones, deduplicando containers repetidos entre subgrupos).
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
            print(TAG .. "WARN: COMBO '" .. groupName .. "' referencia grupo inexistente '" .. tostring(subName) .. "'")
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
        -- Containers ya poblados para ESTE item: evita entradas duplicadas
        -- cuando dos grupos (o un combo y un grupo suelto) comparten container
        -- (ej. GarageMechanics está en INDUSTRIAL y en MECHANIC).
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
                -- Ubicaciones de grupo inexistentes se omiten en silencio: los
                -- grupos incluyen nombres de B41 y B42 y cada versión usa los suyos.
                if warnIfMissing then
                    print(TAG .. "WARN: custom location no valida: '" .. tostring(locName) .. "' (item: " .. item .. ")")
                end
                skipped = skipped + 1
            end
        end

        -- Los "custom" se procesan PRIMERO: son overrides explícitos y, con el
        -- dedupe, la primera inserción de un container gana. Así un custom
        -- puede fijar una probabilidad distinta a la del grupo que también
        -- contenga ese container, de forma determinista.
        if type(groups.custom) == "table" then
            for _, loc in ipairs(groups.custom) do
                insertItem(loc.name, loc.prob, true)
            end
        end

        for groupName, prob in pairs(groups) do
            if groupName ~= "custom" then
                -- Grupo predefinido (KRCore.LOC) o combinado (KRCore.COMBO)
                local locations = resolveGroupLocations(groupName)
                if not locations then
                    print(TAG .. "WARN: grupo desconocido '" .. groupName .. "' (item: " .. item .. ")")
                    skipped = skipped + 1
                else
                    for _, locName in ipairs(locations) do
                        insertItem(locName, prob, false)
                    end
                end
            end
        end
    end

    print(TAG .. "Distribución completada: " .. added .. " entradas añadidas, " .. skipped .. " omitidas.")
    KRCore._distQueue = {}
end

-- ==================== PROCESAMIENTO DE CARE PACKAGES ====================

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
                print(TAG .. "ERROR entregando contenido a '" .. entry.target .. "': " .. tostring(err))
            end
        else
            pending = pending + 1
            if pending == 1 then
                print(TAG .. "WARN: mod destino '" .. entry.target .. "' no registrado, contenido ignorado.")
            end
        end
    end

    if delivered > 0 then
        print(TAG .. "Care Packages: " .. delivered .. " contenidos entregados.")
    end
    KRCore._contentQueue = {}
end

-- ==================== PROCESAMIENTO DE VEHÍCULOS ====================
-- VehicleZoneDistribution se procesa en OnInitWorld, que dispara después de
-- OnPostDistributionMerge. En ese punto el mapa de zonas ya está completamente
-- inicializado por el engine y es seguro insertar entradas de vehículos.

local function processVehicleDistributions()
    if not VehicleZoneDistribution then
        print(TAG .. "WARN: VehicleZoneDistribution no disponible, vehículos omitidos.")
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
                print(TAG .. "WARN: zona de vehículo desconocida '" .. zoneName .. "' (vehículo: " .. vid .. ")")
                skipped = skipped + 1
            end
        end
    end

    if added > 0 or skipped > 0 then
        print(TAG .. "Vehículos: " .. added .. " zonas registradas, " .. skipped .. " omitidas.")
    end
    KRCore._vehicleQueue = {}
end

-- ==================== EVENTOS ====================
--
-- OnPostDistributionMerge: procesa ProceduralDistributions (items).
--   CRÍTICO (B42): ItemPickerJava.Parse() ocurre después de este evento y
--   antes de OnGameStart. Insertar items aquí garantiza que sean visibles.
--
-- OnInitWorld: procesa VehicleZoneDistribution.
--   VehicleZoneDistribution no está inicializado en OnPostDistributionMerge;
--   OnInitWorld es el primer momento seguro para modificarlo.

local function onPostDistributionMerge()
    print(TAG .. "Iniciando KR CoreOS v1.1.0...")
    processContentQueue()
    processDistributions()
    KRCore._initialized = true
    print(TAG .. "Listo.")
end

local function onInitWorld()
    processVehicleDistributions()
end

Events.OnPostDistributionMerge.Add(onPostDistributionMerge)
Events.OnInitWorld.Add(onInitWorld)
