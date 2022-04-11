require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.lsp"
require "user.cmp"
require "user.gitsigns"

local cmd = vim.cmd
local api = vim.api

cmd [[filetype plugin indent on]]
cmd [[syntax enable]]

api.nvim_set_var('gruvbox_material_palette', 'material')
api.nvim_set_var('gruvbox_material_background', 'hard')
api.nvim_set_var('g:gruvbox_material_better_performance', '1')
cmd [[colorscheme gruvbox-material]]
