return {
  -- No plugin needed, we just want to define a function and keymap
  -- LazyVim lets us use a plugin spec even for pure config
  "nvim-lua/plenary.nvim", -- dummy plugin to attach config to
  config = function()
    local diagnostic_win = nil

    local function toggle_line_diagnostics()
      local bufnr = vim.api.nvim_get_current_buf()
      local line = vim.api.nvim_win_get_cursor(0)[1] - 1

      if diagnostic_win and vim.api.nvim_win_is_valid(diagnostic_win) then
        vim.api.nvim_win_close(diagnostic_win, true)
        diagnostic_win = nil
        return
      end

      diagnostic_win = vim.diagnostic.open_float(bufnr, {
        scope = "line",
        focusable = false,
        close_events = { "CursorMoved", "InsertEnter", "BufHidden" },
        border = "rounded", -- optional: adds a nice border
      })
    end

    -- Keymap (you can change this to whatever you want)
    vim.keymap.set(
      "n",
      "gl",
      toggle_line_diagnostics,
      { noremap = true, silent = true, desc = "Toggle line diagnostics float" }
    )
  end,
}
