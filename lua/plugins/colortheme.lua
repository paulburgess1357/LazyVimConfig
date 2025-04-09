return {
  {
    "rebelot/kanagawa.nvim",
    opts = {
      colors = {
        theme = {
          wave = {
            ui = {
              bg = "#16161D", -- Your darker background color
              bg_gutter = "#16161D",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- Make window borders much more visible
          WinSeparator = { fg = colors.palette.autumnYellow, bold = true },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "kanagawa-wave" },
  },
  {
    "nvim-lualine/lualine.nvim", -- If you have lualine
    optional = true,
    opts = function(_, opts)
      -- Make status line separators more visible
      opts.options = opts.options or {}
      opts.options.section_separators = { left = "", right = "" }
      opts.options.component_separators = { left = "│", right = "│" }
      return opts
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    config = function(_, opts)
      -- Add this chunk to set more visible window separators
      local wk = require("which-key")
      wk.setup(opts)
      -- Set up thicker window separators
      vim.opt.fillchars = {
        horiz = "━",
        horizup = "┻",
        horizdown = "┳",
        vert = "┃",
        vertleft = "┫",
        vertright = "┣",
        verthoriz = "╋",
      }
    end,
  },
}
