-- vim.g.copilot_filetypes = {
--     ["*"] = false,
--     ["javascript"] = true,
--     ["typescript"] = true,
--     ["lua"] = false,
--     ["rust"] = true,
--     ["c"] = true,
--     ["c#"] = true,
--     ["c++"] = true,
--     ["go"] = true,
--     ["python"] = true,
--   }
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- vim.api.nvim_set_keymap("i", "<C-J>", '<Plug>copilot-next', { silent = true, expr = true })
-- vim.api.nvim_set_keymap("i", "<C-K>", '<Plug>copilot-previous', { silent = true, expr = true })

