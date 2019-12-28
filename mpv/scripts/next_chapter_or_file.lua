-- local msg = require "mp.msg"

-- local print = function(...)
--     return msg.log("info", ...)
-- end

mp.add_key_binding(nil, "next-chapter-or-file", function()
    local num_chapters = mp.get_property_native("chapters")
    if num_chapters > 0 then
        local chapter = mp.get_property_native("chapter")
        if chapter then
            if chapter + 1 >= num_chapters then
                mp.command("playlist-next")
            else
                mp.set_property_native("chapter", chapter+1)
            end
            return
        end
    end
    mp.command("playlist-next")
end)

mp.add_key_binding(nil, "prev-chapter-or-file", function()
    local num_chapters = mp.get_property_native("chapters")
    if num_chapters > 0 then
        local chapter = mp.get_property_native("chapter")
        if chapter then
            if chapter <= 0 then
                mp.command("playlist-prev")
            else
                mp.set_property_native("chapter", chapter-1)
            end
            return
        end
    end
    mp.command("playlist-prev")
end)