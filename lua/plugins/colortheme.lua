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

          -- Visual selection:
          Visual = { bg = colors.palette.carpYellow, fg = colors.palette.sumiInk0 },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "kanagawa-wave" },
  },
}
