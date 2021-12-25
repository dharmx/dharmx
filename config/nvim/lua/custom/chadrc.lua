-- This is an example chadrc file , its supposed to be placed in /lua/custom dir
-- lua/custom/chadrc.lua

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "nord",
   hl_override = "custom.highlights",
}

M.plugins = {
  status = {
    nvim_tree = true,
    dashboard = true,
    colorizer = false,
    telescope_media = true,
    feline = true,
  },

  options = {
    statusline = {
      -- hide, show on specific filetypes
      hidden = {
        "help",
        "dashboard",
        "NvimTree",
        "terminal",
      },
      shown = {},

      -- truncate statusline on small screens
      shortline = true,
      style = "round", 
    }, 
  },

  default_plugin_config_replace = {
    vimsence = "custom.vimsence",
    dashboard = "custom.dashboard",
    feline = "custom.feline",
  },
}

-- require("custom.lualine")
require("custom.presence")
require("custom.null")

return M
