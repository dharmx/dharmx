local colors = require("colors").get()
local lsp = require "feline.providers.lsp"

local icon_styles = {
   default = {
      left = "",
      right = " ",
      -- main_icon = "  ",
      main_icon = "  ",
      vi_mode_icon = " ",
      position_icon = " ",
   },
   arrow = {
      left = "",
      right = "",
      main_icon = "  ",
      vi_mode_icon = " ",
      position_icon = " ",
   },

   block = {
      left = " ",
      right = " ",
      main_icon = "   ",
      vi_mode_icon = "  ",
      position_icon = "  ",
   },

   round = {
      left = "",
      right = "",
      main_icon = "  ",
      vi_mode_icon = " ",
      position_icon = " ",
   },

   slant = {
      left = " ",
      right = " ",
      main_icon = "  ",
      vi_mode_icon = " ",
      position_icon = " ",
   },
}

local config = require("core.utils").load_config().plugins.options.statusline
-- statusline style
local user_statusline_style = config.style
local statusline_style = icon_styles[user_statusline_style]
-- if show short statusline on small screens
local shortline = config.shortline == false and true

-- Initialize the components table
local components = {
   active = {},
   inactive = {},
}

-- Initialize left, mid and right
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

components.active[1][1] = {
   provider = statusline_style.main_icon,

   hl = {
      fg = colors.statusline_bg,
      bg = "#61afef",
   },

   right_sep = { str = statusline_style.right, hl = {
      fg = "#61afef",
      bg = colors.lightbg,
   } },
}

components.active[1][2] = {
   provider = function()
      local filename = vim.fn.expand "%:t"
      local extension = vim.fn.expand "%:e"
      local icon = require("nvim-web-devicons").get_icon(filename, extension)
      if icon == nil then
         icon = " "
         return icon
      end
      return " " .. icon .. " " .. filename .. " "
   end,
   enabled = shortline or function(winid)
      return vim.api.nvim_win_get_width(winid) > 70
   end,
   hl = {
      fg = colors.white,
      bg = colors.lightbg,
   },

   right_sep = { str = statusline_style.right, hl = { fg = colors.lightbg, bg = colors.lightbg2 } },
}

components.active[1][3] = {
   provider = function()
      local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      return "  " .. dir_name .. " "
   end,

   enabled = shortline or function(winid)
      return vim.api.nvim_win_get_width(winid) > 80
   end,

   hl = {
      fg = colors.grey_fg2,
      bg = colors.lightbg2,
   },
   right_sep = {
      str = statusline_style.right,
      hi = {
         fg = colors.lightbg2,
         bg = colors.statusline_bg,
      },
   },
}

components.active[1][4] = {
   provider = "git_diff_added",
   hl = {
      fg = colors.grey_fg2,
      bg = colors.statusline_bg,
   },
   icon = " ",
}
-- diffModfified
components.active[1][5] = {
   provider = "git_diff_changed",
   hl = {
      fg = colors.grey_fg2,
      bg = colors.statusline_bg,
   },
   icon = "   ",
}
-- diffRemove
components.active[1][6] = {
   provider = "git_diff_removed",
   hl = {
      fg = colors.grey_fg2,
      bg = colors.statusline_bg,
   },
   icon = "  ",
}

components.active[1][7] = {
   provider = "diagnostic_errors",
   enabled = function()
      return lsp.diagnostics_exist "Error"
   end,

   hl = { fg = colors.red },
   icon = "  ",
}

components.active[1][8] = {
   provider = "diagnostic_warnings",
   enabled = function()
      return lsp.diagnostics_exist "Warning"
   end,
   hl = { fg = colors.yellow },
   icon = "  ",
}

components.active[1][9] = {
   provider = "diagnostic_hints",
   enabled = function()
      return lsp.diagnostics_exist "Hint"
   end,
   hl = { fg = colors.grey_fg2 },
   icon = "  ",
}

components.active[1][10] = {
   provider = "diagnostic_info",
   enabled = function()
      return lsp.diagnostics_exist "Information"
   end,
   hl = { fg = colors.green },
   icon = "  ",
}

components.active[2][1] = {
   provider = function()
      local Lsp = vim.lsp.util.get_progress_messages()[1]
      if Lsp then
         local msg = Lsp.message or ""
         local percentage = Lsp.percentage or 0
         local title = Lsp.title or ""
         local spinners = {
            "",
            "",
            "",
         }

         local success_icon = {
            "",
            "",
            "",
         }

         local ms = vim.loop.hrtime() / 1000000
         local frame = math.floor(ms / 120) % #spinners

         if percentage >= 70 then
            return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
         else
            return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
         end
      end
      return ""
   end,
   enabled = shortline or function(winid)
      return vim.api.nvim_win_get_width(winid) > 80
   end,
   hl = { fg = colors.green },
}

components.active[3][1] = {
   provider = function()
      if next(vim.lsp.buf_get_clients()) ~= nil then
         return "  LSP"
      else
         return ""
      end
   end,
   enabled = shortline or function(winid)
      return vim.api.nvim_win_get_width(winid) > 70
   end,
   hl = { fg = colors.grey_fg2, bg = colors.statusline_bg },
}

components.active[3][2] = {
   provider = "git_branch",
   enabled = shortline or function(winid)
      return vim.api.nvim_win_get_width(winid) > 70
   end,
   hl = {
      fg = colors.grey_fg2,
      bg = colors.statusline_bg,
   },
   icon = "  ",
}

components.active[3][3] = {
   provider = " " .. statusline_style.left,
   hl = {
      fg = colors.one_bg2,
      bg = colors.statusline_bg,
   },
}

local mode_colors = {
   ["n"] = { "NORMAL", "#e06c75" },
   ["no"] = { "N-PENDING", "#e06c75" },
   ["i"] = { "INSERT", "#6f2dbd" },
   ["ic"] = { "INSERT", "#6f2dbd" },
   ["t"] = { "TERMINAL", "#98c379" },
   ["v"] = { "VISUAL", "#50a6b2" },
   ["V"] = { "V-LINE", "#50a6b2" },
   [""] = { "V-BLOCK", "#50a6b2" },
   ["R"] = { "REPLACE", "#d19a66" },
   ["Rv"] = { "V-REPLACE", "#d19a66" },
   ["s"] = { "SELECT", "#61afef" },
   ["S"] = { "S-LINE", "#61afef" },
   [""] = { "S-BLOCK", "#61afef" },
   ["c"] = { "COMMAND", "#c678dd" },
   ["cv"] = { "COMMAND", "#c678dd" },
   ["ce"] = { "COMMAND", "#c678dd" },
   ["r"] = { "PROMPT", "#2a9d8f" },
   ["rm"] = { "MORE", "#2a9d8f" },
   ["r?"] = { "CONFIRM", "#2a9d8f" },
   ["!"] = { "SHELL", "#98c379" },
}

local chad_mode_hl = function()
   return {
      fg = mode_colors[vim.fn.mode()][2],
      bg = colors.one_bg,
   }
end

components.active[3][4] = {
   provider = statusline_style.left,
   hl = function()
      return {
         fg = mode_colors[vim.fn.mode()][2],
         bg = colors.one_bg2,
      }
   end,
}

components.active[3][5] = {
   provider = statusline_style.vi_mode_icon,
   hl = function()
      return {
         fg = colors.statusline_bg,
         bg = mode_colors[vim.fn.mode()][2],
      }
   end,
}

components.active[3][6] = {
   provider = function()
      return " " .. mode_colors[vim.fn.mode()][1] .. " "
   end,
   hl = chad_mode_hl,
}

components.active[3][7] = {
   provider = statusline_style.left,
   enabled = shortline or function(winid)
      return vim.api.nvim_win_get_width(winid) > 90
   end,
   hl = {
      fg = colors.grey,
      bg = colors.one_bg,
   },
}

components.active[3][8] = {
   provider = statusline_style.left,
   enabled = shortline or function(winid)
      return vim.api.nvim_win_get_width(winid) > 90
   end,
   hl = {
      fg = colors.green,
      bg = colors.grey,
   },
}

components.active[3][9] = {
   provider = statusline_style.position_icon,
   enabled = shortline or function(winid)
      return vim.api.nvim_win_get_width(winid) > 90
   end,
   hl = {
      fg = colors.black,
      bg = colors.green,
   },
}

components.active[3][10] = {
   provider = function()
      local current_line = vim.fn.line "."
      local total_line = vim.fn.line "$"

      if current_line == 1 then
         return " Top "
      elseif current_line == vim.fn.line "$" then
         return " Bot "
      end
      local result, _ = math.modf((current_line / total_line) * 100)
      return " " .. result .. "%% "
   end,

   enabled = shortline or function(winid)
      return vim.api.nvim_win_get_width(winid) > 90
   end,

   hl = {
      fg = colors.green,
      bg = colors.one_bg,
   },
}

require("feline").setup {
   colors = {
      bg = colors.statusline_bg,
      fg = colors.fg,
   },
   components = components,
}
