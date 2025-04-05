return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    files = {
      hidden = false,
      actions = {
        -- add a mapping so that Ctrl+l also opens the selected file
        ["ctrl-l"] = require("fzf-lua").actions.file_edit_or_qf,
      },
    },
    keymap = {
      builtin = {
        true, -- inherit default keymaps
        ["<C-d>"] = "preview-page-down",
        ["<C-u>"] = "preview-page-up",
        ["C-k"] = "up",
        ["C-j"] = "down",
      },
      fzf = { true },
    },
  },
}
