local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
parser_configs.norg = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    files = { "src/parser.c", "src/scanner.cc" },
    branch = "main"
  },
}

parser_configs.norg_meta = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
    files = { "src/parser.c" },
    branch = "main"
  },
}

parser_configs.norg_table = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
    files = { "src/parser.c" },
    branch = "main"
  },
}
require('neorg').setup {
  -- Tell Neorg what modules to load
  load = {
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.norg.concealer"] = {}, -- Allows for use of icons
    ["core.norg.journal"] = {}, -- Allows for use of icons
    ["core.gtd.base"] = {}, -- Allows for use of icons
    ["core.norg.qol.toc"] = {}, -- Allows for use of icons
    ["core.presenter"] = {},
    ["core.keybinds"] = { -- Configure core.keybinds
    config = {
      default_keybinds = true, -- Generate the default keybinds
      neorg_leader = "<Leader>o" -- This is the default if unspecified
    }},
    ["core.norg.completion"] = {
    config = {
      engine = "nvim-cmp" -- We current support nvim-compe and nvim-cmp only
    }},
    ["core.norg.dirman"] = { -- Manage your directories with Neorg
    config = {
    workspaces = {
      my_workspace = "~/neorg"
    }
  }
}
}
}
