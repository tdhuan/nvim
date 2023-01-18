local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	log.err("Can not load toggle term")
end

toggleterm.setup()

local opts = { noremap = true, silent = true }

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, size = 20, direction = "float" })

function lazygit_toggle()
	lazygit:toggle()
end

keymap("n", "<leader>lz", "<cmd>lua lazygit_toggle()<CR>", opts)

keymap("n", "<Leader>t", ":ToggleTerm size=20 direction=float <CR>", opts)
