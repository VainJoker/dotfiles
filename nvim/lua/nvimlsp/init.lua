local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("nvimlsp.lsp-installer")
require("nvimlsp.handlers").setup()
require("nvimlsp.null-ls")
require("nvimlsp.diagnostics")
