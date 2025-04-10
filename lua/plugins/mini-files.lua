return {
  "echasnovski/mini.files",
  keys = {
    {
      "<leader>e",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini.files (directory of current file)",
    },
    {
      "<leader>E",
      function()
        require("mini.files").open(vim.uv.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
    {
      "<leader>fm",
      function()
        require("mini.files").open(LazyVim.root(), true)
      end,
      desc = "Open mini.files (root)",
    },
  },
  opts = {
    windows = {
      width_nofocus = 20,
      width_focus = 50,
      width_preview = 100,
    },
    options = {
      use_as_default_explorer = true,
    },
  },
  config = function(_, opts)
    require("mini.files").setup(opts)

    -- Remap Enter to behave like 'l'
    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        vim.keymap.set("n", "<CR>", "l", { buffer = args.data.buf_id, remap = true })
      end,
    })

    -- 🟡 Use warm yellow colors from Kanagawa
    local kanagawa = require("kanagawa.colors").setup()
    local p = kanagawa.palette

    -- Apply highlights
    vim.api.nvim_set_hl(0, "MiniFilesNormal", { fg = p.oldWhite, bg = "#16161D" }) -- File text
    vim.api.nvim_set_hl(0, "MiniFilesDirectory", { fg = p.carpYellow, bold = true }) -- Directories
    vim.api.nvim_set_hl(0, "MiniFilesCursorLine", { bg = p.sumiInk3 }) -- Highlight current line
    vim.api.nvim_set_hl(0, "MiniFilesBorder", { fg = p.autumnYellow, bg = "#16161D" }) -- Border with yellow
  end,
}
