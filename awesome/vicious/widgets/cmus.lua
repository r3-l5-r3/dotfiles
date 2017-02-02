---------------------------------------------------
-- Licensed under the GNU General Public License v2
-- Based on mpd vidget for vicions by Adrian C. <anrxc@sysphere.org>
---------------------------------------------------

-- {{{ Grab environment
local tonumber = tonumber
local io = { popen = io.popen }
local setmetatable = setmetatable
local string = { gmatch = string.gmatch }
local helpers = require("vicious.helpers")
-- }}}


-- Provides information from cmus, a small, fast and powerful console music player for Unix-like operating systems
module("vicious.widgets.cmus")


-- {{{ cmus widget type
local function worker(format, warg)
    local cmus_state  = {
        ["{status}"] = "N/A",
        ["{artist}"] = "N/A",
        ["{title}"]  = "N/A",
        ["{album}"]  = "",
        ["{genre}"]  = "",
    }


    -- Get data from cmus 
    local f = io.popen("cmus-remote -Q")

    for line in f:lines() do
        for k, v in string.gmatch(line, "([%w]+)[%s]([%w]+)$") do
            if     k == "status" then cmus_state["{"..k.."}"] = helpers.capitalize(v)
            end
        end
        for k, v in string.gmatch(line, "tag[%s]([%w]+)[%s](.*)$") do
            if     k == "artist" then cmus_state["{"..k.."}"] = helpers.escape(v)
            elseif k == "status" then cmus_state["{"..k.."}"] = helpers.escape(v)
            elseif k == "title"  then cmus_state["{"..k.."}"] = helpers.escape(v)
            elseif k == "album"  then cmus_state["{"..k.."}"] = helpers.escape(v)
            elseif k == "genre"  then cmus_state["{"..k.."}"] = helpers.escape(v)
            end
        end
    end
    f:close()

    return cmus_state
end
-- }}}

setmetatable(_M, { __call = function(_, ...) return worker(...) end })
