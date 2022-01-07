-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 本地变量
local map = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap
local opt = {
  noremap = true,
  silent = true
}

-- map("i", ";;<CR>", "<C-o>A;", opt)
map("n", "<leader>uu", ":PackerSync<CR>", opt)
map("n", "<leader><F1>", ":TransparentToggle<CR>", opt)
map("n", "<leader><F2>", ":source ~/.config/nvim/lua/init-colorscheme.lua<CR>", opt)
-- Telescope
map("n", "<leader>ff", ":lua require 'telescope'.extensions.file_browser.file_browser()<CR>", opt)
map("n", "<leader>fr", ":Telescope frecency<CR>", opt)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opt)
map("n", "<leader>fn", ":vsplit new ", opt)
map("n", "<leader>sl", ":Telescope sessions<CR>", opt)
map("n", "<leader>bb", ":Telescope buffers<CR>", opt)
-- nvimTree
map("n", "<leader>fe", ":NvimTreeToggle<CR>", opt)
-- bufferline
map("n", "<leader>bp", ":BufferLinePick<CR>", opt)
map("n", "<leader><Tab>", ":BufferLineCycleNext<CR>", opt)
--FTerm
map('n', '<leader>tt', ":lua require('FTerm').toggle()<CR>", opt)
map('t', '<leader>tt', "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>", opt)
--Comment
--NORMAL mode
map('n', '<leader>cc', ':lua require("Comment.api").toggle_current_linewise()<CR>',opt)
map('n', '<leader>cb', ':lua require("Comment.api").call("toggle_blockwise_op")<CR>g@',opt)
--VISUAL mode
map('x', '<leader>cc', '<ESC>:lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>',opt)
map('x', '<leader>cb', '<ESC>:lua require("Comment.api").toggle_blockwise_op(vim.fn.visualmode())<CR>',opt)

map('n', '<leader>/l', ':HopLine<CR>',opt)
map('n', '<leader>/w', ':HopChar1<CR>',opt)
map('n', '<leader>/c', ':HopWordCurrentLine<CR>',opt)
