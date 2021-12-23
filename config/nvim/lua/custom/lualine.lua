local nordic = require("lualine.themes.nord")

local colors = {
  blue    = '#81a1c1',
  cyan    = '#85bfc8',
  green   = '#a3be8c',
  black   = '#343a46',
  white   = '#d8dee9',
  red     = '#bf616a',
  magenta = '#b48ead',
  grey    = '#3b4252',
  yellow  = '#ebcb8b',
  light_blue = '#88c0d0',
  nord_term_bg = '#343a46',
}

local nordic = {
  normal = {
    a = { fg = colors.black, bg = colors.blue },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.blue, bg = colors.nord_term_bg },
  },
  insert = { 
    a = { fg = colors.black, bg = colors.green },
    c = { fg = colors.blue, bg = colors.nord_term_bg },
  },
  visual = { 
    a = { fg = colors.black, bg = colors.magenta },
    c = { fg = colors.blue, bg = colors.nord_term_bg },
  },
  replace = { 
    a = { fg = colors.black, bg = colors.cyan },
    c = { fg = colors.blue, bg = colors.nord_term_bg },
  },
  command = {
    a = {bg = colors.red, fg = colors.black},
    b = {bg = colors.grey, fg = colors.white},
    c = {bg = colors.nord_term_bg, fg = colors.blue},
  },
  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.nord_term_bg },
  },
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = nordic,
    component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        separator = { left = '' }, right_padding = 1
      }
    },
    lualine_b = {'tabs', 'branch', 'diff', 'diagnostics', 'filesize', 
      {
        'filename',
        file_status = true,   
        path = 0,             
        shorting_target = 40, 
                              
        symbols = {
          modified = '[+]',   
          readonly = '[-]',   
          unnamed = '[No Name]',
        },
      }
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'filetype', 'encoding', {
      'fileformat',
      symbols = {
        unix = '',
        dos = '', 
        mac = '', 
      }
    }, 'hostname', 'progress'},
    lualine_z = {
      {
        'location',
        separator = { right = '' }, left_padding = 1
      }
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    -- lualine_c = {'filename'},
    -- lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {
    'quickfix', 
    'chadtree', 
    'fzf', 
    'toggleterm', 
    'symbols-outline'
  }
}

-- vim:ft=lua:nowrap
