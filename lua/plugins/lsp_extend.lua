return {
  "neovim/nvim-lspconfig",
  opts = {
    -- Global LSP config
    inlay_hints = {
      enabled = false,
    },
    diagnostics = {
      virtual_text = false,
      signs = true,
    },

    setup = {
      clangd = function(_, opts)
        -- No need to check opts.cmd — just add the arg
        table.insert(opts.cmd, "--limit-results=0")

        return false -- continue with LazyVim's default LSP setup
      end,
    },
  },
}
