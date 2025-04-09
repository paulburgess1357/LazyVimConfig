-- TODO: Need to update fzf grep search to open files with my keymaps also

return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  defaults = {
    -- Override the default actions for all pickers so that both single- and multi-select
    -- always open the file rather than falling back to the quickfix list.
    actions = {
      ["default"] = require("fzf-lua.actions").file_edit,
      ["enter"] = require("fzf-lua.actions").file_edit,
      ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      ["<ctrl-d>"] = "preview-page-down",
      ["<ctrl-u>"] = "preview-page-up",
    },
  },

  opts = {
    files = {
      hidden = false,
      actions = {
        -- For the files picker the actions are explicitly set
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    -- Override for grep mode to prevent the quickfix list when multi-selecting
    grep = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    lsp = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    git = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    args = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    oldfiles = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    buffers = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    tabs = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    lines = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    tags = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    btags = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    colorschemes = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    awesome_colorschemes = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    keymaps = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    nvim_options = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    quickfix = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    quickfix_stack = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    diagnostics = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    marks = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    complete_path = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    complete_file = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    zoxide = {
      actions = {
        ["default"] = require("fzf-lua.actions").file_edit,
        ["ctrl-l"] = require("fzf-lua.actions").file_edit,
      },
    },

    keymap = {
      builtin = {
        false, -- do not inherit default keymaps
        ["<C-d>"] = "preview-page-down",
        ["<C-u>"] = "preview-page-up",
        ["C-k"] = "up",
        ["C-j"] = "down",
      },
      fzf = { true, ["ctrl-q"] = "abort", ["ctrl-l"] = "accept" },
    },
  },
}
