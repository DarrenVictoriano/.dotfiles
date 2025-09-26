local M = {}

function M.get_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	-- Conditionally get cmp-nvim-lsp capabilities
	local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if status_ok then
		capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
	end

	-- Set position encoding to utf-16, which is the Neovim default
	capabilities.general.positionEncodings = { "utf-16" }

	return capabilities
end

return M