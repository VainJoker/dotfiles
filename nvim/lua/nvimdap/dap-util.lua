local M = {}
local dap =  require'dap'

function M.reload_continue()
  package.loaded['nvimdap.dap-config'] = nil
  require('nvimdap.dap-config').setup()
  dap.continue()
end

return M
