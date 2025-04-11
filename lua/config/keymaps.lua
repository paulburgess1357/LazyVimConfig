-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Delete existing window-resizing mappings
vim.keymap.del("n", "<C-Up>")
vim.keymap.del("n", "<C-Down>")
vim.keymap.del("n", "<C-Left>")
vim.keymap.del("n", "<C-Right>")

-- Using Alt instead of Ctrl
vim.keymap.set("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
vim.keymap.set("n", "<A-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<A-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })

-- Upper left of file:
vim.keymap.set("n", "gg", "1G0", { desc = "Go to top of file at column 0" })

-- Toggle diagnostics window
vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float(0, {
    scope = "line",
    border = "rounded",
    focusable = false,
    close_events = { "CursorMoved", "InsertEnter", "BufHidden" },
  })
end, { noremap = true, silent = true, desc = "Show diagnostics for current line" })

-- Faster J and K:
-- Move down two lines with Shift + J
vim.keymap.set("n", "J", "3j", { noremap = true, silent = true })
vim.keymap.set("n", "K", "3k", { noremap = true, silent = true })
