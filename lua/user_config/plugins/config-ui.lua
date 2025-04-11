-- ~/.config/nvim/lua/plugins/user_whichkey.lua
return {
  "folke/which-key.nvim",
  optional = true,
  event = "VeryLazy",
  opts = {
    spec = {
      {
        mode = { "n" },
        { "<leader>z", group = "Whitespace" },
        {
          "<leader>za",
          function()
            _G.WhitespaceToggles.toggle_autoformat_global()
          end,
          desc = "Toggle Autoformat (Global)",
        },
        {
          "<leader>zb",
          function()
            _G.WhitespaceToggles.toggle_autoformat_buffer()
          end,
          desc = "Toggle Autoformat (Buffer)",
        },
        {
          "<leader>zm",
          function()
            _G.WhitespaceToggles.toggle_clean_mode()
          end,
          desc = "Toggle Clean Mode (all/modified)",
        },
        {
          "<leader>zt",
          function()
            _G.WhitespaceToggles.toggle_trim_blank_lines()
          end,
          desc = "Toggle Trim Trailing Blank Lines",
        },
      },
    },
  },
}
