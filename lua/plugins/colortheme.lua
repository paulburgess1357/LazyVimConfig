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
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "kanagawa-wave" },
  },
}
