local dap = require("dap")
require("dapui").setup()
require("nvim-dap-virtual-text").setup()

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<F5>", '<CMD>lua require"dap".continue()<CR>', opts)
vim.api.nvim_set_keymap("n", "<F7>", '<CMD>lua require"dap".step_into()<CR>', opts)
vim.api.nvim_set_keymap("n", "<F8>", '<CMD>lua require"dap".step_over()<CR>', opts)
vim.api.nvim_set_keymap("n", "<S-F8>", '<CMD>lua require"dap".step_out()<CR>', opts)
vim.api.nvim_set_keymap("n", "<Leader>db", '<CMD>lua require"dap".toggle_breakpoint()<CR>', opts)
vim.api.nvim_set_keymap(
"n",
"<Leader>dB",
'<CMD>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
opts
)
vim.api.nvim_set_keymap("n", "<Leader>dr", '<CMD>lua require"dapui".toggle()<CR>', opts)

dap.adapters.python = {
  type = "executable",
  command = "python",
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return "/usr/bin/python"
    end,
  },
}

-- dap.adapters.codelldb = function(on_adapter)
--   local stdout = vim.loop.new_pipe(false)
--   local stderr = vim.loop.new_pipe(false)
--   -- CHANGE THIS!
--   local extension_path = '/home/vainjoker/.vscode-oss/extensions/vadimcn.vscode-lldb-1.6.10/'
--   local codelldb_path = extension_path .. 'adapter/codelldb'
--   local cmd = codelldb_path
--   local hosts= 'x86_64'
--   local handle, pid_or_err
--   local opts = {
--     stdio = {nil, stdout, stderr},
--     detached = true,
--   }
--   handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
--     stdout:close()
--     stderr:close()
--     handle:close()
--     if code ~= 0 then
--       print("codelldb exited with code", code)
--     end
--   end)
--   assert(handle, "Error running codelldb: " .. tostring(pid_or_err))
--   stdout:read_start(function(err, chunk)
--     assert(not err, err)
--     if chunk then
--       local port = chunk:match('Listening on port (%d+)')
--       if port then
--         vim.schedule(function()
--           on_adapter({
--             type = 'server',
--             host = '127.0.0.1',
--             port = port
--           })
--         end)
--       else
--         vim.schedule(function()
--           require("dap.repl").append(chunk)
--         end)
--       end
--     end
--   end)
--   stderr:read_start(function(err, chunk)
--     assert(not err, err)
--     if chunk then
--       vim.schedule(function()
--         require("dap.repl").append(chunk)
--       end)
--     end
--   end)
-- end
-- dap.configurations.cpp = {
--   {
--     name = "Launch file",
--     type = "codelldb",
--     request = "launch",
--     -- program = function()
--     --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     -- end
--     program = "${file}",
--     cwd = '${workspaceFolder}',
--     stopOnEntry = true,
--   },
-- }
-- -- If you want to use this for rust and c, add something like this:
-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp

