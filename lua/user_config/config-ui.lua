return {
  "folke/which-key.nvim",
  optional = true,
  opts = {
    spec = {
      {
        mode = { "n", "v" },
        {
          "<leader>z",
          name = "+whitespace", -- shows as a group in which-key
          a = {
            function()
              vim.g.autoformat = not vim.g.autoformat
              vim.notify("Autoformat (global): " .. tostring(vim.g.autoformat))
            end,
            "Toggle Autoformat (Global)",
          },
          b = {
            function()
              vim.b.autoformat = not vim.b.autoformat
              vim.notify("Autoformat (buffer): " .. tostring(vim.b.autoformat))
            end,
            "Toggle Autoformat (Buffer)",
          },
          m = {
            function()
              _G.CLEAN_WHITESPACE_MODE = (_G.CLEAN_WHITESPACE_MODE == "all") and "modified" or "all"
              vim.notify("Whitespace mode: " .. _G.CLEAN_WHITESPACE_MODE)
            end,
            "Toggle Whitespace Mode",
          },
          t = {
            function()
              _G.TRIM_TRAILING_BLANK_LINES = not _G.TRIM_TRAILING_BLANK_LINES
              vim.notify("Trim trailing lines: " .. tostring(_G.TRIM_TRAILING_BLANK_LINES))
            end,
            "Toggle Trim Trailing Lines",
          },
        },
      },
    },
  },
}
