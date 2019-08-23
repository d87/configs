local isVisible = false

local function toggleOSC()
    if isVisible then
        mp.commandv("script-message", "osc-visibility", "never", "no-osd")
    else
        mp.commandv("script-message", "osc-visibility", "always", "no-osd")
    end
    isVisible = not isVisible
end

mp.add_key_binding(nil, "toggle", toggleOSC)