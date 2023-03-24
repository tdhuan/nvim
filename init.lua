local cmd = vim.cmd
local api = vim.api
_G.keymap = vim.api.nvim_set_keymap

_G.log = {
	info = function(msg)
		vim.notify(msg, vim.log.levels.INFO)
	end,
	warn = function(msg)
		vim.notify(msg, vim.log.levels.WARN)
	end,
	err = function(msg)
		vim.notify(msg, vim.log.levels.ERROR)
	end,
}

cmd([[filetype plugin indent on]])
cmd([[syntax enable]])

require("user.options")
require("user.keymaps")

require("user.plugins")

require("user.lsp")
require("user.cmp")
require("user.gitsigns")
require("user.lualine")
require("user.bufferline")
require("user.comment")
require("user.chadtree")
require("user.indent-blankline")
require("user.auto-pairs")
require("user.auto-tag")
require("user.treesitter")
require("user.toggle-term")
require("user.fugitive")
require("user.glow")
require("user.telescope")
require("user.colorizer")
require("user.tagbar")
require("user.symbol-outline")
require("user.monokai-pro")
require("user.copilot")
local command = require("user.command")

command.create_filter_command()
api.nvim_set_var("gruvbox_material_palette", "mix")
api.nvim_set_var("gruvbox_material_background", "hard")
api.nvim_set_var("gruvbox_material_better_performance", "1")
cmd([[colorscheme gruvbox-material]])

api.nvim_set_var("sonokai_style", "andromeda")
-- api.nvim_set_var("sonokai_better_performance", "1")
-- cmd([[colorscheme sonokai]])

-- Everforest themes
api.nvim_set_var("everforest_background", "hard")
api.nvim_set_var("everforest_better_performance", "1")

-- cmd([[colorscheme everforest]])

-- vim.cmd([[colorscheme monokai-pro]])
