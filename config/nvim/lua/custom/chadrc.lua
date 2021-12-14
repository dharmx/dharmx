-- This is an example chadrc file , its supposed to be placed in /lua/custom dir
-- lua/custom/chadrc.lua

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "nord",
}

M.plugins = {
  status = {
    nvim_tree = true,
    dashboard = true,
    colorizer = true,
    telescope_media = true,
  },

  default_plugin_config_replace = {
    vimsence = "custom.vimsence",
    dashboard = "custom.dashboard",
    feline = "custom.statusline",
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
      style = "round_arch", 
    }, 
  },
}

return M
