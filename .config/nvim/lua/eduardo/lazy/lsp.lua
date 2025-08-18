return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim",           version = "^1.0.0" },
		{ "williamboman/mason-lspconfig.nvim", version = "^1.0.0" },
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
		"dart-lang/dart-vim-plugin",
		"natebosch/vim-lsc",
		"natebosch/vim-lsc-dart"
	},
	config = function()
		vim.lsp.enable('dartls')
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = buffer,
			callback = function()
				vim.lsp.buf.format { async = false }
			end
		})

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_installation = false, -- or false if you prefer
			-- ↓ add this line
			automatic_setup = true,      -- explicitly disable auto-setup if needed
			ensure_installed = {
				"lua_ls",
				"eslint",
				"ts_ls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, { remap = false }),
				vim.keymap.set("n", "<leader>gi", function()
					vim.lsp.buf.implementation()
				end, { remap = false, desc = "Go to implementation" }),
				vim.keymap.set("n", "<leader>gr", function()
					vim.lsp.buf.references()
				end, { remap = false, desc = "Go to references" }),
				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, { remap = false, desc = "Go to definition" }),
				vim.keymap.set("n", "<leader>vrn", function()
					vim.lsp.buf.rename()
				end, { remap = false }),
				vim.keymap.set("n", "<leader>vws", function()
					vim.lsp.buf.workspace_symbol()
				end, { remap = false }),
				vim.keymap.set("n", "<leader>vd", function()
					vim.diagnostic.open_float()
				end, { remap = false }),
				vim.keymap.set("n", "<leader>ca", function()
					vim.lsp.buf.code_action()
				end, { remap = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
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
