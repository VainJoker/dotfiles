-- set up LSP signs
local signs = {
  Error = " ",
  Warn =  " " ,
  Hint = " " ,
  Info =  " " ,
}

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end


-- set up vim.diagnostics
-- vim.diagnostic.config opts
vim.diagnostic.config({
  underline = true,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    header = { ' Diagnostics:', 'Normal' },
    source = 'always',
  },
  virtual_text = {
    spacing = 4,
    source = 'always',
    severity = {
      min = vim.diagnostic.severity.HINT,
    },
  },
})

