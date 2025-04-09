return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    diagnostics = {
      virtual_text = false,
      signs = true,
      underline = true,
      severity_sort = true,
      float = {
        border = "rounded",
        format = function(diagnostic)
          if diagnostic.source then
            return string.format("[%s] %s", diagnostic.source, diagnostic.message)
          end
          return diagnostic.message
        end,
      },
    },

    servers = {
      pyright = {},
    },
    setup = {
      clangd = function(_, opts)
        table.insert(opts.cmd, "--limit-results=0")
        return false
      end,
    },
  },
}
