local M = {}

local Gears = require("gears")

local functional = require("core.functional")
local std = require("core.std")

M._defaults = {
  modules = {
    variables = {
      theme = "mountain",
      terminal = functional.if_nil(os.getenv("TERMINAL"), "xterm"),
      editor = functional.if_nil(os.getenv("EDITOR"), "nano"),
      modkey = "Mod4",
    },
  },
}

M._defaults.modules.variables.editor_cmd = functional.if_nil(M._defaults.modules.variables.terminal .. " -e " .. M._defaults.modules.variables.editor, "xterm -e nano")
M._current = Gears.table.clone(M._defaults, true)

function M.merge(options)
  M._current = std.tbl_deep_extend("keep", functional.if_nil(options, {}), M._current)
  return M._current
end

function M.extend(options) return std.tbl_deep_extend("keep", functional.if_nil(options, {}), M._current) end

function M.get() return M._current end

return M
