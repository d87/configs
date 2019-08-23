local mputils = require "mp.utils"
-- local msg = require "mp.msg"

local VOLUMEFILE = (os.getenv('APPDATA') or os.getenv('HOME')..'/.config')..'/mpv/persist_volume';

local isInitialized = false

local function onInitialLoad()
    local volumeFile = io.open(VOLUMEFILE, 'r')
    if volumeFile then
        local volumeNum = volumeFile:read("*n")
        mp.set_property_number("volume", volumeNum)
        -- msg.log("debug", "volume restored to "..volumeNum)
        volumeFile:close()
    end

    mp.unregister_event(onInitialLoad)
    isInitialized = true
end

mp.register_event("file-loaded", onInitialLoad)

mp.observe_property("volume", "number", function(name)
    if isInitialized then
        local cv = mp.get_property_native(name)
        -- msg.log("debug", "new volume: "..cv)

        local volumeFile = io.open(VOLUMEFILE, 'w+')
        volumeFile:write(cv)
        volumeFile:close()
    end
end)
