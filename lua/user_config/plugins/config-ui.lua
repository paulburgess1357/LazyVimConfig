return {
  "folke/which-key.nvim",
  optional = true,
  event = "VeryLazy",
  opts = {
    spec = {
      {
        mode = { "n" },
        { "<leader>z", group = "User Config" },

        {
          "<leader>za",
          function()
            _G.WhitespaceToggles.toggle_autoformat_global()
          end,
          desc = function()
            local val = vim.g.autoformat and "on" or "off"
            return "Toggle Autoformat (Global: " .. val .. ")"
          end,
        },

        {
          "<leader>zb",
          function()
            _G.WhitespaceToggles.toggle_autoformat_buffer()
          end,
          desc = function()
            local val = vim.b.autoformat and "on" or "off"
            return "Toggle Autoformat (Buffer: " .. val .. ")"
          end,
        },

        {
          "<leader>zm",
          function()
            _G.WhitespaceToggles.toggle_clean_mode()
          end,
          desc = function()
            return "Toggle Clean Mode (Current: " .. tostring(_G.CLEAN_WHITESPACE_MODE) .. ")"
          end,
        },

        {
          "<leader>zt",
          function()
            _G.WhitespaceToggles.toggle_trim_blank_lines()
          end,
          desc = function()
            return "Toggle Trim Trailing Blank Lines ("
              .. tostring(_G.TRIM_TRAILING_BLANK_LINES and "on" or "off")
              .. ")"
          end,
        },
      },
    },
  },
}
