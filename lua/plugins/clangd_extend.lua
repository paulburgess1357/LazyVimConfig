return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      clangd = function(_, opts)
        -- Only add to the existing cmd if it's already set
        if opts.cmd then
          table.insert(opts.cmd, "--limit-results=0")
        end
        return false -- continue with LazyVim's default setup
      end,
    },
  },
}
