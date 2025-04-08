return {
  "folke/trouble.nvim",
  cmd = { "Trouble" },
  opts = {
    win = {
      position = "left",
      size = 40, -- fallback width
    },
  },
  config = function(_, opts)
    local trouble = require("trouble")

    -- List of known modes in Trouble
    local known_modes = {
      "lsp",
      "symbols",
      "lsp_references",
      "lsp_definitions",
      "lsp_type_definitions",
      "lsp_implementations",
      "lsp_declarations",
      "quickfix",
      "loclist",
      "diagnostics",
    }

    opts.modes = opts.modes or {}
    for _, name in ipairs(known_modes) do
      opts.modes[name] = opts.modes[name] or {}
      opts.modes[name].win = vim.tbl_deep_extend("force", opts.modes[name].win or {}, {
        position = "left",
      })
    end

    trouble.setup(opts)

    -- Optional: dynamic auto-size on open
    vim.api.nvim_create_autocmd("User", {
      pattern = "TroubleOpen",
      callback = function()
        local win = vim.api.nvim_get_current_win()
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        local max_line = 0
        for _, line in ipairs(lines) do
          max_line = math.max(max_line, #line)
        end
        local width = math.min(math.max(30, max_line + 4), 80)
        vim.api.nvim_win_set_width(win, width)
      end,
    })
  end,
}
