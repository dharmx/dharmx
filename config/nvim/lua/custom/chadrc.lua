local M = {}

M.ui = {theme = "nord", hl_override = "custom.highlights"}

M.plugins = {
    status = {
        nvim_tree = true,
        dashboard = true,
        colorizer = false,
        telescope_media = true,
        feline = true,
        autopairs = false
    },

    options = {
        statusline = {
            -- hide, show on specific filetypes
            hidden = {"help", "dashboard", "NvimTree", "terminal"},
            shown = {},

            -- truncate statusline on small screens
            shortline = true,
            style = "round_mod"
        }
    },

    default_plugin_config_replace = {
        vimsence = "custom.vimsence",
        dashboard = "custom.dashboard",
        feline = "custom.feline"
    }
}

require("custom.presence")
-- require("custom.vimsence")
require("custom.null")
-- require("custom.lualine")

return M
