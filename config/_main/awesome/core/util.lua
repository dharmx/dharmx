local M = {}

local Gears = require("gears")
local Awful = require("awful")
local Path = require("path")

local functional = require("core.functional")
local std = require("core.std")

function M.stem(path) return std.string.split(Path.basename(path), ".", { plain = true })[1] end

local function spawn_wrap(cmd) return function() Awful.spawn(cmd) end end
function M.apply_bindings(binding_chunks, mouse, mouse_binder, keyboard_binder)
  mouse = functional.if_nil(mouse, false)
  local wrapped_types = { "string", "table" }

  std.table.foreach(functional.if_nil(binding_chunks, {}), function(group, binding_chunk)
    std.table.foreachi(binding_chunk, function(_, binding)
      binding.group = group
      if Gears.table.hasitem(wrapped_types, type(binding.on_press)) then
        binding.on_press = spawn_wrap(binding.on_press)
      end
      if Gears.table.hasitem(wrapped_types, type(binding.on_release)) then
        binding.on_release = spawn_wrap(binding.on_release)
      end

      if mouse then
        mouse_binder(Awful.button(binding))
      else
        keyboard_binder(Awful.key(binding))
      end
    end)
  end)
end

function M.apply_client_bindings(binding_chunks, mouse)
  M.apply_bindings(binding_chunks, mouse, Awful.mouse.append_client_mousebinding, Awful.keyboard.append_client_keybinding)
end

function M.apply_global_bindings(binding_chunks, mouse)
  M.apply_bindings(binding_chunks, mouse, Awful.mouse.append_global_mousebinding, Awful.keyboard.append_global_keybinding)
end

return M
