return {
  "nvim-lua/plenary.nvim",
  config = function()
    ---------------------------------------------------------------------------
    -- 🔧 Config setting for whitespace mode
    ---------------------------------------------------------------------------
    local CLEAN_WHITESPACE_MODE = "modified" -- "all" or "modified"

    ---------------------------------------------------------------------------
    -- 🧼 Whitespace cleanup on save
    ---------------------------------------------------------------------------
    -- hi
    -- there

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
