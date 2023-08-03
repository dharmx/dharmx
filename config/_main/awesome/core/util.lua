local M = {}

local Awful = require("awful")
local Path = require("path")

local functional = require("core.functional")
local std = require("core.std")

function M.stem(path)
  return std.split(Path.basename(path), ".", { plain = true })[1]
end

function M.apply_keybinds(mapping_chunks, mouse)
  mouse = functional.if_nil(mouse, false)
  std.tbl_foreach(functional.if_nil(mapping_chunks, {}), function(group, mapping_chunk)
    std.tbl_foreachi(mapping_chunk, function(_, mapping)
      mapping.group = group
      if mouse then
        Awful.mouse.append_client_mousebinding(Awful.button(mapping))
      else
        Awful.keyboard.append_global_keybinding(Awful.key(mapping))
      end
    end)
  end)
end

return M
