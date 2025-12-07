require("eduardo.remap")
require("eduardo.options")
require("eduardo.lazy_init")
require("eduardo.open_env")
require("eduardo.json_to_env")
vim.cmd([[colorscheme solarized-osaka]])

function Hide()
	-- Set transparent background
	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

-- Create a command to call the function
vim.api.nvim_create_user_command("Hide", function()
	Hide()
end, { nargs = 0 })

--Hide()
