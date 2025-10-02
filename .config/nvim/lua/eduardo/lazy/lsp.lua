return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim",           version = "^1.0.0" },
		{ "williamboman/mason-lspconfig.nvim", version = "^1.0.0" },
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"nvimtools/none-ls.nvim", 
	},
	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "eslint", "tsserver", "html" },
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = { globals = { "vim" } },
							},
						},
					})
				end,
			},
		})

		-- none-ls setup (Prettier)
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier, -- enable Prettier
			},
		})

		-- Format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function(args)
				vim.lsp.buf.format({
					async = false,
					bufnr = args.buf,
				})
			end,
		})

		-- cmp setup
		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { remap = false }),
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { remap = false, desc = "Go to definition" }),
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { remap = false, desc = "Go to references" }),
				vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { remap = false, desc = "Go to implementation" }),
				vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { remap = false }),
				vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { remap = false }),
				vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { remap = false }),
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { remap = false }),
			}),
			sources = cmp.config.sources({ { name = "nvim_lsp" } }),
		})

		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
