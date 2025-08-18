-- dap.lua (Core Debug Adapter Protocol)
return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	config = function()
		local dap = require("dap")

		-- Dart/Flutter Adapter
		dap.adapters.dart = {
			type = "executable",
			command = "dart",
			args = { "debug_adapter" },
		}

		-- Dart/Flutter Configurations
		dap.configurations.dart = {
			{
				type = "dart",
				request = "launch",
				name = "Launch Flutter",
				program = "${workspaceFolder}/lib/main.dart",
				cwd = "${workspaceFolder}",
			},
		}
		-- TypeScript/JavaScript Adapter
		dap.adapters.node2 = {
			type = "executable",
			command = "node",
			args = { os.getenv("HOME") .. "/.local/share/nvim/dap_adapters/vscode-node-debug2/out/src/nodeDebug.js" },
		}

		-- TypeScript/JavaScript Configurations
		dap.configurations.typescript = {
			{
				type = "node2",
				request = "launch",
				name = "Launch TypeScript",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
			},
		}

		dap.configurations.javascript = dap.configurations.typescript

		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>ds", "<cmd>lua require'dap'.step_over()<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>do", "<cmd>lua require'dap'.step_out()<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>dr", "<cmd>lua require'dap'.restart()<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>dq", "<cmd>lua require'dap'.terminate()<CR>", opts)
	end,
}
