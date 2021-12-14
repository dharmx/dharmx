-- This is an example init file , its supposed to be placed in /lua/custom dir
-- lua/custom/init.lua

-- This is where your custom modules and plugins go.
-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!

local hooks = require "core.hooks"

-- MAPPINGS
-- To add new plugins, use the "setup_mappings" hook,

hooks.add("setup_mappings", function(map)
   map("n", "<leader>cc", ":Telescope <CR>", opt)
   map("n", "<leader>q", ":q <CR>", opt)
end)

-- NOTE : opt is a variable  there (most likely a table if you want multiple options),
-- you can remove it if you dont have any custom options

-- Install plugins
-- To add new plugins, use the "install_plugin" hook,

-- examples below:

hooks.add("install_plugins", function(use)
  use {
      "rinx/nvim-minimap"
  }

  use {
      "karb94/neoscroll.nvim",
       opt = true,
       config = function()
          require("neoscroll").setup()
       end,

       -- lazy loading
       setup = function()
         require("core.utils").packer_lazy_load "neoscroll.nvim"
       end,
  }

  use {
   "Pocco81/AutoSave.nvim",
   config = function()
      local autosave = require "autosave"

      autosave.setup {
         enabled = true,
         execution_message = "autosaved at : " .. vim.fn.strftime "%H:%M:%S",
         events = { "InsertLeave", "TextChanged" },
         conditions = {
            exists = true,
            filetype_is_not = {},
            modifiable = true,
         },
         clean_command_line_interval = 2500,
         on_off_commands = true,
         write_all_buffers = false,
      }
   end,
  }

  use {
      "Pocco81/TrueZen.nvim",
      cmd = {
         "TZAtaraxis",
         "TZMinimalist",
         "TZFocus",
      },
      config = function()
          -- check https://github.com/Pocco81/TrueZen.nvim#setup-configuration (init.lua version)
      end
   }

  use { "nathom/filetype.nvim" }

  use {
      "luukvbaal/stabilize.nvim",
      config = function() require("stabilize").setup() end
  }

  use {
    "vimsence/vimsence"
  }
end)

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough
