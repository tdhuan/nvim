local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	log.err("Can not load toggle term")
end

toggleterm.setup()

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>t", ":ToggleTerm size=20 dir=/Users/huantd direction=float <CR>", opts)
