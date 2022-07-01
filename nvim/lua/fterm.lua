local fterm = require("FTerm")
fterm.setup({
    border = 'single',
    dimensions  = {
        height = 0.7,
        width = 0.7,
    },
})

-- -- Example keybindings
-- vim.keymap.set('n', '<Leader>tt', '<CMD>lua require("FTerm").toggle()<CR>')
-- vim.keymap.set('t', '<Leader>tt', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

--
local gitui = fterm:new({
    ft = 'fterm_gitui', -- You can also override the default filetype, if you want
    cmd = "gitui",
    dimensions = {
        height = 0.8,
        width = 0.8
    }
})

 -- Use this to toggle gitui in a floating terminal
function _G.__fterm_gitui()
    gitui:toggle()
end

local btm = fterm:new({
    ft = 'fterm_btop',
    cmd = "btm"
})

 -- Use this to toggle btop in a floating terminal
function _G.__fterm_btm()
    btm:toggle()
end

-- vim.api.nvim_add_user_command('CargoBuild', function()
--     require('FTerm').scratch({ cmd = {'cargo', 'build', '--target', os.getenv("RUST_TARGET")} })
-- end, { bang = true })

