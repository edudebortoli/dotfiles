return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	config = function(_, opts)
		require("noice").setup(opts)

		-- Map <Esc> in insert mode and command-line mode to dismiss notifications
		vim.keymap.set({ "n", "c" }, "<leader>m", function()
			require("noice").cmd("dismiss")
		end)
	end,
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
}
