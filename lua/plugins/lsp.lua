return {
	-- Main LSP Configuration
	"neovim/nvim-lspconfig",

	dependencies = {
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup()
			end
		},
		{
			"williamboman/mason-lspconfig.nvim"
		},
		{
			-- Useful status updates for LSP.
			"j-hui/fidget.nvim",
			config = function()
				require("fidget").setup()
			end
		},
		{
			-- Allows extra capabilities
			-- Language servers provide different completion results depending on the capabilities of the client.
			-- Neovim's default omnifunc has basic support for serving completion candidates.
			-- nvim-cmp supports more types of completion candidates provided by nvim-cmp
			"hrsh7th/cmp-nvim-lsp"
		},
		{
			"hrsh7th/nvim-cmp"
		}
	},

	config = function()
		-- This function gets run when an LSP attaches to a particular buffer.
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),

			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				local telescope = require("telescope.builtin")
				-- Jump to the definition of the word under your cursor.
				-- To jump back, press <C-t>.
				map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")

				-- Find references for the word under your cursor.
				map("gr", telescope.lsp_references, "[G]oto [R]eferences")

				-- Jump to the implementation of the word under your cursor.
				map("gi", telescope.lsp_implementations, "[G]oto [I]mplementation")

				-- Jump to the type of the word under your cursor.
				map("gt", telescope.lsp_type_definitions, "[G]oto [T]ype Definition")

				-- Fuzzy find all the symbols in your current document.
				-- Symbols are things like variables, functions, types, etc.
				map("<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")

				-- Fuzzy find all the symbols in your current workspace.
				--  Similar to document symbols, except searches over your entire project.
				map("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				-- Rename the variable under your cursor.
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

				-- Execute a code action, usually your cursor needs to be on top of an error
				-- or a suggestion from your LSP for this to activate.
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

				-- WARN: This is not Goto Definition, this is Goto Declaration.
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			
				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				
				if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
				then
					local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				-- The following code creates a keymap to toggle inlay hints in your
				-- code, if the language server you are using supports them
				--
				-- This may be unwanted, since they displace some of your code
				if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
				then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end
			end
		})

		-- Diagnostic Config
		-- See :help vim.diagnostic.Opts
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = {},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end
			}
		})

		-- LSP servers and clients are able to communicate to each other what features they support.
		-- By default, Neovim doesn't support everything that is in the LSP specification.
		-- When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
		-- So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		require("mason-lspconfig").setup({
			-- A list of servers to automatically install if they're not already installed.
			ensure_installed = {
					"gopls",
					"golangci_lint_ls",
					"lua_ls"
				},

			-- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
			automatic_installation = false,

			handlers = {
				function(server_name)
					local server = {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end
			}
		})
	end
}
