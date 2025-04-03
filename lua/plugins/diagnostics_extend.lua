return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = false,
      signs = true, -- Ensure signs are enabled
    },
  },
}
