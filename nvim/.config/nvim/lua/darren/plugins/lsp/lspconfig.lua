return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		local lsp_keymaps = require("darren.core.lsp_keymaps")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				lsp_keymaps.on_attach(client, args.buf)
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = require("darren.core.lsp_capabilities").get_capabilities()

		-- Conditionally enable folding support if nvim-ufo is installed
		if pcall(require, "ufo") then
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}
		end

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Inject Poetry virtual env if available
		local venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
		if vim.fn.isdirectory(venv) == 1 then
			vim.env.VIRTUAL_ENV = venv
			vim.env.PATH = venv .. "/bin:" .. vim.env.PATH
		end

		-- Auto-detect virtualenv in project
		local function get_venv_python()
			if venv and vim.fn.executable(venv .. "/bin/python") == 1 then
				return venv .. "/bin/python"
			end

			-- Fallback: look for .venv in current project
			local cwd = vim.loop.cwd()
			if vim.fn.isdirectory(cwd .. "/.venv") == 1 then
				return cwd .. "/.venv/bin/python"
			end

			-- Fallback: use system Python
			return "python3"
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["rust_analyzer"] = function()
				lspconfig["rust_analyzer"].setup({
					capabilities = capabilities,
					diagnostics = {
						enable = true,
					},
				})
			end,
			["cmake"] = function()
				lspconfig["cmake"].setup({
					capabilities = capabilities,
				})
			end,
			["clangd"] = function()
				lspconfig["clangd"].setup({
					capabilities = capabilities,
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--header-insertion=iwyu",
						"--completion-style=detailed",
						"--function-arg-placeholders",
						"--fallback-style=Microsoft",
					},
					init_options = {
						usePlaceholders = true,
						completeUnimported = true,
						clangdFileStatus = true,
					},
					root_dir = lspconfig.util.root_pattern(
						".clangd",
						".clang-tidy",
						".clang-format",
						"compile_commands.json",
						"compile_flags.txt",
						"configure.ac",
						".git"
					),
				})
			end,
			["pyright"] = function()
				-- configure lua server (with special settings)
				lspconfig["pyright"].setup({
					capabilities = capabilities,
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								diagnosticMode = "openFilesOnly",
								useLibraryCodeForTypes = true,
							},
						},
					},
					-- Disable built-in formatting so it doesn't conflict with ruff
					on_attach = function(client)
						-- Disable formatting capabilities
						client.server_capabilities.documentFormattingProvider = false
						client.server_capabilities.documentRangeFormattingProvider = false
					end,
				})
			end,
			-- ["omnisharp"] = function()
			-- 	lspconfig["omnisharp"].setup({
			-- 		capabilities = capabilities,
			-- 		-- this dll needs to be downloaded:
			-- 		-- instructions: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#omnisharp
			-- 		-- download: https://github.com/OmniSharp/omnisharp-roslyn/releases
			-- 		cmd = { "dotnet", "/Users/dxv1220/code/omnisharp/OmniSharp.dll" },
			-- 		settings = {
			-- 			FormattingOptions = {
			-- 				EnableEditorConfigSupport = true,
			-- 				OrganizeImports = nil,
			-- 			},
			-- 			MsBuild = {
			-- 				LoadProjectsOnDemand = nil,
			-- 			},
			-- 			RoslynExtensionsOptions = {
			-- 				EnableAnalyzersSupport = nil,
			-- 				EnableImportCompletion = nil,
			-- 				AnalyzeOpenDocumentsOnly = nil,
			-- 			},
			-- 			Sdk = {
			-- 				IncludePrereleases = true,
			-- 			},
			-- 		},
			-- 	})
			-- end,
			["robotframework_ls"] = function()
				lspconfig["robotframework_ls"].setup({
					capabilities = capabilities,
					settings = {
						robot = {
							trace = {
								server = "verbose",
							},
							["language-server"] = {
								python = get_venv_python(),
							},
							python = {
								executable = get_venv_python(),
							},
							pythonpath = {
								"/Users/dxv1220/code/DataPlatformValidationV2",
							},
							lint = {
								enabled = true,
								undefinedKeywords = true,
							},
						},
					},
				})
			end,
			["yamlls"] = function()
				lspconfig["yamlls"].setup({
					capabilities = capabilities,
					settings = {
						yaml = {
							schemas = {
								["https://squidfunk.github.io/mkdocs-material/schema.json"] = "mkdocs.yml",
							},
							validate = true,
							hover = true,
							completion = true,
						},
					},
				})
			end,
		})
	end,
}
