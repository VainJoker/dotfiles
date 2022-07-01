local dap = require('dap')
dap.adapters.lldb = {
    type = 'executable',
    -- command = 'lldb-vscode', -- I tried this
    -- command = 'vscode-lldb', -- also tried this
    -- command = 'rust-lldb', -- and this
    command = '/home/vainjoker/.vscode-oss/extensions/vadimcn.vscode-lldb-1.6.10/lldb/bin/lldb', -- even this
    name = "lldb"
}

-- configure the adapter for Rust Debugging
dap.configurations.rust = {
    {
        name = 'Launch Debug',
        type = 'lldb',
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/' .. '')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        initCommand = {},
        runInTerminal = false
    }
}
