-- lua/json_to_env.lua
local M = {}

function M.json_to_env()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local content = table.concat(lines, "\n")

	-- Parse JSON
	local ok, decoded = pcall(vim.fn.json_decode, content)
	if not ok then
		vim.notify("Invalid JSON", vim.log.levels.ERROR)
		return
	end

	-- Sort keys alphabetically
	local keys = {}
	for k in pairs(decoded) do
		table.insert(keys, k)
	end
	table.sort(keys)

	local env_lines = {}
	for _, key in ipairs(keys) do
		local value = decoded[key]

		-- Convert to string
		local val = tostring(value)

		-- Remove wrapping single quotes if present
		val = val:gsub("^'(.*)'$", "%1")

		-- Replace any newlines/tabs with spaces to keep .env valid
		val = val:gsub("[\r\n]+", " ")

		table.insert(env_lines, string.format("%s=%s", key, val))
	end

	-- Replace buffer content safely
	vim.api.nvim_buf_set_lines(0, 0, -1, false, env_lines)
	vim.notify("Converted JSON → ENV (alphabetical)", vim.log.levels.INFO)
end

-- Create the command :JsonToEnv
vim.api.nvim_create_user_command("JsonToEnv", function()
	M.json_to_env()
end, {})

return M
