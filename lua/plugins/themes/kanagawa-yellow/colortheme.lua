return {
  {
    "rebelot/kanagawa.nvim",
    opts = {
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- Make window borders much more visible
          WinSeparator = { fg = colors.palette.autumnYellow, bold = true },

          -- Visual selection:
          Visual = { bg = colors.palette.carpYellow, fg = colors.palette.sumiInk0 },

          -- Replace purples in UI-like areas with warm yellows
          Keyword = { fg = colors.palette.autumnYellow },
        }
      end,
    },
  },
}
