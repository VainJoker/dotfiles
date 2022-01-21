math.randomseed(os.time())

local present, alpha = pcall(require, "alpha")
if not present then
  return
end

local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
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
--dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.header.opts.hl = "green"

-- Set the menu
local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "AlphaButtonText"
  b.opts.hl_shortcut = "AlphaButtonShortcut"
  return b
end
dashboard.section.buttons.val = {
  button("SPC f f", "   Find file", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>"),
  button("SPC f r", "   Recently opened files", ":Telescope frecency<CR>"),
  button("SPC f w", "   Find word", ":Telescope live_grep path_display=smart<CR>"),
  button("SPC f n", "   New file", ":ene <BAR> startinsert <CR>"),
  button("SPC s l", "   Recently session", ":Telescope sessions<CR>"),
  button("SPC u u", "   Update plugins", ":PackerSync<CR>"),
}


-- Set the footer
 local function footer()
--   local total_plugins = #vim.tbl_keys(packer_plugins)
   local datetime = os.date("%d-%m-%Y  %H:%M:%S")
--   return total_plugins .. " plugins  " .. datetime
   return datetime
 end
 dashboard.section.footer.val = footer()
-- dashboard.section.footer.opts.hl = "Constant"
-- Send config to alpha
alpha.setup(dashboard.opts)

