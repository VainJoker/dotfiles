local global = require "init-global"
local vim = vim

local function bind_option(options)
    for k, v in pairs(options) do
        if v == true then
            vim.cmd("set " .. k)
        elseif v == false then
            vim.cmd("set no" .. k)
        else
            vim.cmd("set " .. k .. "=" .. v)
        end
    end
end

local function load_options()
    local global_local = {
        termguicolors = true,
        mouse = "a",
        errorbells = true,
        visualbell = true,
        hidden = true,
        fileformats = "unix,mac,dos",
        magic = true,
        virtualedit = "block",
        encoding = "utf-8",
        viewoptions = "folds,cursor,curdir,slash,unix",
        sessionoptions = "curdir,help,tabpages,winsize",
        clipboard = "unnamedplus",
        wildignorecase = true,
        wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
        backup = false,
        writebackup = false,
        swapfile = false,
        undodir = global.cache_dir .. "undo/",
        -- directory = global.cache_dir .. "swap/",
        -- backupdir = global.cache_dir .. "backup/",
        -- viewdir = global.cache_dir .. "view/",
        -- spellfile = global.cache_dir .. "spell/en.uft-8.add",
        history = 2000,
        shada = "!,'300,<50,@100,s10,h",
        backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
        smarttab = true,
        shiftround = true,
        timeout = true,
        ttimeout = true,
        timeoutlen = 500,
        ttimeoutlen = 0,
        updatetime = 100,
        redrawtime = 1500,
        ignorecase = true,
        smartcase = true,
        infercase = true,
        incsearch = true,
        wrapscan = true,
        complete = ".,w,b,k",
        inccommand = "nosplit",
        grepformat = "%f:%l:%c:%m",
        grepprg = "rg --hidden --vimgrep --smart-case --",
        breakat = [[\ \	;:,!?]],
        startofline = false,
        whichwrap = "h,l,<,>,[,],~",
        splitbelow = true,
        splitright = true,
        switchbuf = "useopen",
        backspace = "indent,eol,start",
        diffopt = "filler,iwhite,internal,algorithm:patience",
        completeopt = "menuone,noselect",
        jumpoptions = "stack",
        showmode = false,
        shortmess = "aoOTIcF",
        scrolloff = 2,
        sidescrolloff = 5,
        foldlevelstart = 99,
        ruler = true,
        cursorline = true,
        cursorcolumn = true,
        list = true,
        showtabline = 2,
        winwidth = 30,
        winminwidth = 10,
        pumheight = 15,
        helpheight = 12,
        previewheight = 12,
        showcmd = false,
        cmdheight = 2,
        cmdwinheight = 5,
        equalalways = false,
        laststatus = 2,
        display = "lastline",
        showbreak = "↳  ",
        listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
        pumblend = 10,
        winblend = 10,
        autoread = true,
        autowrite = true
    }

    local bw_local = {
        undofile = true,
        synmaxcol = 2500,
        formatoptions = "1jcroql",
        textwidth = 80,
        expandtab = true,
        autoindent = true,
        tabstop = 4,
        shiftwidth = 4,
        softtabstop = -1,
        breakindentopt = "shift:2,min:20",
        wrap = false,
        linebreak = true,
        number = true,
        relativenumber = true,
        foldenable = true,
        signcolumn = "yes",
        conceallevel = 0,
        concealcursor = "niv"
    }

    if global.is_mac then
        vim.g.clipboard = {
            name = "macOS-clipboard",
            copy = {["+"] = "pbcopy", ["*"] = "pbcopy"},
            paste = {["+"] = "pbpaste", ["*"] = "pbpaste"},
            cache_enabled = 0
        }
        vim.g.python_host_prog = "/usr/bin/python"
        vim.g.python3_host_prog = "/usr/local/bin/python3"
    end
    for name, value in pairs(global_local) do vim.o[name] = value end
    bind_option(bw_local)
end


-- Create cache dir and subs dir
local createdir = function()
    local data_dir = {
        global.cache_dir .. "backup", global.cache_dir .. "session",
        global.cache_dir .. "swap", global.cache_dir .. "tags",
        global.cache_dir .. "undo"
    }
    -- There only check once that If cache_dir exists
    -- Then I don't want to check subs dir exists
    if vim.fn.isdirectory(global.cache_dir) == 0 then
        os.execute("mkdir -p " .. global.cache_dir)
        for _, v in pairs(data_dir) do
            if vim.fn.isdirectory(v) == 0 then
                os.execute("mkdir -p " .. v)
            end
        end
    end
end

local disable_distribution_plugins = function()
    vim.g.loaded_fzf = 1
    vim.g.loaded_gtags = 1
    vim.g.loaded_gzip = 1
    vim.g.loaded_tar = 1
    vim.g.loaded_tarPlugin = 1
    vim.g.loaded_zip = 1
    vim.g.loaded_zipPlugin = 1
    vim.g.loaded_getscript = 1
    vim.g.loaded_getscriptPlugin = 1
    vim.g.loaded_vimball = 1
    vim.g.loaded_vimballPlugin = 1
    vim.g.loaded_matchit = 1
    vim.g.loaded_matchparen = 1
    vim.g.loaded_2html_plugin = 1
    vim.g.loaded_logiPat = 1
    vim.g.loaded_rrhelper = 1
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.g.loaded_netrwSettings = 1
    vim.g.loaded_netrwFileHandlers = 1
end

local leader_map = function()
    vim.g.mapleader = " "
    vim.api.nvim_set_keymap("n", " ", "", {noremap = true})
    vim.api.nvim_set_keymap("x", " ", "", {noremap = true})
end

local neovide_config = function()
    vim.cmd [[set guifont=JetBrainsMono\ Nerd\ Font:h12]]
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_no_idle = true
    vim.g.neovide_cursor_animation_length = 0.03
    vim.g.neovide_cursor_trail_length = 0.05
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_vfx_opacity = 200.0
    vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
    vim.g.neovide_cursor_vfx_particle_speed = 20.0
    vim.g.neovide_cursor_vfx_particle_density = 5.0
end

local dashboard_config = function()
    vim.g.dashboard_footer_icon = "🐬 "
    vim.g.dashboard_default_executive = "telescope"

    vim.g.dashboard_custom_header = {
[[ ██▒   █▓ ▄▄▄       ██▓ ███▄    █  ▄▄▄██▀▀▀▒█████   ██ ▄█▀▓█████  ██▀███  ]],
[[▓██░   █▒▒████▄    ▓██▒ ██ ▀█   █    ▒██  ▒██▒  ██▒ ██▄█▒ ▓█   ▀ ▓██ ▒ ██▒]],
[[ ▓██  █▒░▒██  ▀█▄  ▒██▒▓██  ▀█ ██▒   ░██  ▒██░  ██▒▓███▄░ ▒███   ▓██ ░▄█ ▒]],
[[  ▒██ █░░░██▄▄▄▄██ ░██░▓██▒  ▐▌██▒▓██▄██▓ ▒██   ██░▓██ █▄ ▒▓█  ▄ ▒██▀▀█▄  ]],
[[   ▒▀█░   ▓█   ▓██▒░██░▒██░   ▓██░ ▓███▒  ░ ████▓▒░▒██▒ █▄░▒████▒░██▓ ▒██▒]],
[[   ░ ▐░   ▒▒   ▓▒█░░▓  ░ ▒░   ▒ ▒  ▒▓▒▒░  ░ ▒░▒░▒░ ▒ ▒▒ ▓▒░░ ▒░ ░░ ▒▓ ░▒▓░]],
[[   ░ ░░    ▒   ▒▒ ░ ▒ ░░ ░░   ░ ▒░ ▒ ░▒░    ░ ▒ ▒░ ░ ░▒ ▒░ ░ ░  ░  ░▒ ░ ▒░]],
[[     ░░    ░   ▒    ▒ ░   ░   ░ ░  ░ ░ ░  ░ ░ ░ ▒  ░ ░░ ░    ░     ░░   ░ ]],
[[      ░        ░  ░ ░           ░  ░   ░      ░ ░  ░  ░      ░  ░   ░     ]],
[[     ░                                                                    ]],
    }

    vim.g.dashboard_custom_section = {
        change_colorscheme = {
            description = {" Scheme change              comma s c "},
            command = "DashboardChangeColorscheme"
        },
        find_frecency = {
            description = {" File frecency              comma f r "},
            command = "Telescope frecency"
        },
        find_history = {
            description = {" File history               comma f e "},
            command = "DashboardFindHistory"
        },
        find_project = {
            description = {" Project find               comma f p "},
            command = "Telescope project"
        },
        find_file = {
            description = {" File find                  comma f f "},
            command = "DashboardFindFile"
        },
        file_new = {
            description = {" File new                   comma f n "},
            command = "DashboardNewFile"
        },
        find_word = {
            description = {" Word find                  comma f w "},
            command = "DashboardFindWord"
        }
    }
end

local load_core = function()
    local pack = require("~/dotfiles/nvim/lua/init-pack")
    createdir()
    disable_distribution_plugins()
    leader_map()
    pack.ensure_plugins()
    neovide_config()
    dashboard_config()
    require("~/dotfiles/nvim/lua/init-mapping")
    require("~/dotfiles/nvim/lua/keymap")
    require("~/dotfiles/nvim/lua/init-event")
    pack.load_compile()

    vim.cmd [[colorscheme kanagawa]]
end

load_core()
load_options()
