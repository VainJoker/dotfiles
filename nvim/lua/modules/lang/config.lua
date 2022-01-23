local config = {}

function config.rust_tools()
    local extension_path = '/home/vainjoker/.vscode-oss/extensions/vadimcn.vscode-lldb-1.6.10/'
    local codelldb_path = extension_path .. 'adapter/codelldb'
    local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
    local opts = {
        hover_actions = {
            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
                {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                {"╰", "FloatBorder"}, {"│", "FloatBorder"}
            },
            -- whether the hover action window gets automatically focused
            auto_focus = true
        },
        dap = {
            adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
        }
    }
    require('rust-tools').setup(opts)
end

function config.lang_go() vim.g.go_doc_keywordprg_enabled = false end

    return config
