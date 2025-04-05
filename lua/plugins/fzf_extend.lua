return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    files = {
      hidden = false, -- Exclude hidden files
    },
    winopts = { fullscreen = false },
  },
}
