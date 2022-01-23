local tools = {}
local conf = require("modules.tools.config")

tools["rcarriga/nvim-notify"] = {
    opt = false,
    config = conf.notify,
}

tools["kristijanhusak/orgmode.nvim"] = {
    opt = true,
    after = "nvim-treesitter",
    config = conf.lang_org,
}
tools["akinsho/org-bullets.nvim"] = { opt = true,ft = "org",conf = conf.bullets}
tools["lukas-reineke/headlines.nvim"] = {opt = true,ft = "org",conf = conf.headlines}

tools["RishabhRD/popfix"] = {opt = false}
tools["nvim-lua/plenary.nvim"] = {opt = false}
tools["nvim-telescope/telescope.nvim"] = {
    opt = true,
    module = "telescope",
    cmd = "Telescope",
    config = conf.telescope,
    requires = {
        {"nvim-lua/plenary.nvim", opt = false},
        {"nvim-lua/popup.nvim", opt = true}
    }
}
tools["nvim-telescope/telescope-fzf-native.nvim"] = {
    opt = true,
    run = "make",
    after = "telescope.nvim"
}
tools["nvim-telescope/telescope-project.nvim"] = {
    opt = true,
    after = "telescope.nvim"
}
tools["nvim-telescope/telescope-frecency.nvim"] = {
    opt = true,
    after = "telescope.nvim",
    requires = {{"tami5/sqlite.lua", opt = true}}
}
tools["jvgrootveld/telescope-zoxide"] = {opt = true, after = "telescope.nvim"}
tools["thinca/vim-quickrun"] = {opt = true, cmd = {"QuickRun", "Q"}}
tools["michaelb/sniprun"] = {
    opt = true,
    run = "bash ./install.sh",
    cmd = {"SnipRun", "'<,'>SnipRun"}
}
tools["folke/which-key.nvim"] = {
    opt = true,
    after = "nvim-treesitter",
    config = conf.whichkey
}
tools["folke/trouble.nvim"] = {
    opt = true,
    cmd = {"Trouble", "TroubleToggle", "TroubleRefresh"},
    config = conf.trouble
}
tools["dstein64/vim-startuptime"] = {opt = true, cmd = "StartupTime"}
tools["gelguy/wilder.nvim"] = {
    event = "CmdlineEnter",
    config = conf.wilder,
    requires = {{"romgrk/fzy-lua-native", after = "wilder.nvim"}}
}

return tools
