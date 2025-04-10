return {
  "dummy_plugin",
  dir = ".",
  lazy = false,
  config = function()
    local user_config = require("user_config.config")
    vim.notify("🔥 whitespace plugin config loaded")

    ---------------------------------------------------------------------------
    --  Config setting for whitespace mode
    ---------------------------------------------------------------------------
    local CLEAN_WHITESPACE_MODE = user_config.clean_whitespace_mode

    ---------------------------------------------------------------------------
    -- Whitespace cleanup on save
    ---------------------------------------------------------------------------

    local function remove_all_whitespace()
      local view = vim.fn.winsaveview()
      vim.cmd([[%s/\s\+$//e]])
      vim.fn.winrestview(view)
    end

    local function remove_modified_whitespace()
      local gs = require("gitsigns")
      local hunks = gs.get_hunks()
      if not hunks then
        return
      end

      local view = vim.fn.winsaveview()
      for _, hunk in ipairs(hunks) do
        local start_line = hunk.added.start
        local count = hunk.added.count
        if count > 0 then
          local end_line = start_line + count - 1
          vim.cmd(string.format("%d,%ds/\\s\\+$//e", start_line, end_line))
        end
      end
      vim.fn.winrestview(view)
    end

    local function on_save()
      vim.notify("🔥 on_save triggered with mode: " .. CLEAN_WHITESPACE_MODE)

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
  end,
}
