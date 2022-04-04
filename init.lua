require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.lsp"

local cmd = vim.cmd
local a = vim.api

cmd [[filetype plugin indent on]]
cmd [[syntax enable]]

vim.api.nvim_set_var('gruvbox_material_palette', 'material')
vim.api.nvim_set_var('gruvbox_material_background', 'hard')
vim.api.nvim_set_var('g:gruvbox_material_better_performance', '1')
cmd [[colorscheme gruvbox-material]]
