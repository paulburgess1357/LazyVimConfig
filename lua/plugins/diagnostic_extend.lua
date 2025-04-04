return {
  "nvim-lua/plenary.nvim",
  config = function()
    ---------------------------------------------------------------------------
    -- 🔧 Config setting for whitespace mode
    ---------------------------------------------------------------------------
    local CLEAN_WHITESPACE_MODE = "all" -- "all" or "modified"

    ---------------------------------------------------------------------------
    -- 🩺 Diagnostic float toggle ("gl")
    ---------------------------------------------------------------------------
    local diagnostic_win = nil

    local function toggle_line_diagnostics()
      local bufnr = vim.api.nvim_get_current_buf()
      local line = vim.api.nvim_win_get_cursor(0)[1] - 1

      -- If the float is already open, close it
      if diagnostic_win and vim.api.nvim_win_is_valid(diagnostic_win) then
        vim.api.nvim_win_close(diagnostic_win, true)
        diagnostic_win = nil
        return
      end

      -- Check if there's a diagnostic on this line
      local diagnostics = vim.diagnostic.get(bufnr, { lnum = line })
      if #diagnostics == 0 then
        vim.notify("No diagnostics on this line", vim.log.levels.INFO, { title = "Diagnostics" })
        return
      end

      -- Open the float and store its window ID
      vim.diagnostic.open_float(bufnr, {
        scope = "line",
        focusable = false,
        close_events = { "CursorMoved", "InsertEnter", "BufHidden" },
        border = "rounded",
      })

      -- Find the new float window
      local wins = vim.api.nvim_list_wins()
      for _, win in ipairs(wins) do
        local cfg = vim.api.nvim_win_get_config(win)
        if cfg.relative ~= "" then
          diagnostic_win = win
          break
        end
      end
    end

    vim.keymap.set(
      "n",
      "gl",
      toggle_line_diagnostics,
      { noremap = true, silent = true, desc = "Toggle line diagnostics float" }
    )

    ---------------------------------------------------------------------------
    -- 🧼 Whitespace cleanup on save
    ---------------------------------------------------------------------------

    local function remove_all_whitespace()
      local view = vim.fn.winsaveview()
      vim.cmd([[%s/\s\+$//e]])
      vim.fn.winrestview(view)
    end

    local function remove_modified_whitespace()
      local bufnr = vim.api.nvim_get_current_buf()
      local changed_lines = vim.fn["gitsigns"].get_hunks and vim.fn["gitsigns"].get_hunks()
      if not changed_lines then
        return
      end

      for _, hunk in ipairs(changed_lines) do
        for i = hunk.added.start, hunk.added.start + hunk.added.count - 1 do
          local line = vim.fn.getline(i)
          local trimmed = line:gsub("%s+$", "")
          if line ~= trimmed then
            vim.fn.setline(i, trimmed)
          end
        end
      end
    end

    local function on_save()
      if CLEAN_WHITESPACE_MODE == "all" then
        remove_all_whitespace()
      elseif CLEAN_WHITESPACE_MODE == "modified" then
        remove_modified_whitespace()
      end
    end

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = on_save,
    })

    vim.api.nvim_create_user_command("ToggleWhitespaceMode", function()
      CLEAN_WHITESPACE_MODE = (CLEAN_WHITESPACE_MODE == "all") and "modified" or "all"
      vim.notify("Whitespace cleanup mode: " .. CLEAN_WHITESPACE_MODE)
    end, {})
  end,
}
