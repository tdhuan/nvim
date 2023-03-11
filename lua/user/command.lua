local M = {}

M.create_filter_command = function()
	local cmd = vim.api.nvim_create_user_command
	cmd("Calm", function()
		vim.cmd([[silent exec "!open https://github.com/camelohq/camelo/pulls"]])
	end, { nargs = 0 })
end

return M
