    use {
        "karb94/neoscroll.nvim",
        opt = true,
        config = function() require("neoscroll").setup() end,

        -- lazy loading
        setup = function()
            require("core.utils").packer_lazy_load "neoscroll.nvim"
        end
    }

    use {
        "Pocco81/AutoSave.nvim",
        config = function()
            local autosave = require "autosave"

            autosave.setup {
                enabled = true,
                execution_message = "autosaved at : " ..
                    vim.fn.strftime "%H:%M:%S",
                events = {"InsertLeave", "TextChanged"},
                conditions = {
                    exists = true,
                    filetype_is_not = {},
                    modifiable = true
                },
                clean_command_line_interval = 2500,
                on_off_commands = true,
                write_all_buffers = false
            }
        end,
        disable = true
    }

    use {
        "Pocco81/TrueZen.nvim",
        cmd = {"TZAtaraxis", "TZMinimalist", "TZFocus"},
        disable = true
    }

    use {
        'sudormrfbin/cheatsheet.nvim',
        requires = {
            {'nvim-telescope/telescope.nvim'}, {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'}
        }
    }

    use {
        'KadoBOT/nvim-spotify',
        requires = 'nvim-telescope/telescope.nvim',
        config = function()
            local spotify = require 'nvim-spotify'

            spotify.setup {
                -- default opts
                status = {
                    update_interval = 10000, -- the interval (ms) to check for what's currently playing
                    format = '%s %t by %a' -- spotify-tui --format argument
                }
            }
        end,
        run = 'make',
        disable = true
    }

    use {
        "nvim-telescope/telescope-media-files.nvim",
        after = "telescope.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    media_files = {
                        filetypes = {"png", "webp", "jpg", "jpeg"},
                        find_cmd = "rg" -- find command (defaults to `fd`)
                    }
                }
            }
            require("telescope").load_extension "media_files"
        end
    }

-- vim:ft=lua:nowrap
