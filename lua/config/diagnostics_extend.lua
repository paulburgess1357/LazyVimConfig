local M = {}

local diagnostic_win = nil -- track the floating window

function M.toggle_line_diagnostics()
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
  })
end

return M
