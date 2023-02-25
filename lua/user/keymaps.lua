local opts = { noremap = true, silent = true }
local no_silent_opts = { noremap = true, silent = false }

local term_opts = { silent = true }

-- Shorten function name
-- local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

---------------------------- NORMAL  ----------------------------
-- source file .lua
keymap("n", "<leader>sou", ":source<CR>", opts)

-- Copy all file
keymap("n", "<C-A>", "gg<S-V>G<CR>", opts)

-- Fix eslint
-- keymap("n", "<leader>fix", ":EslintFixAll<CR>", opts)
keymap("n", "<leader><leader>", "10j<cr>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>le", ":Lex 20<cr>", opts)

-- Resize with arrows
keymap("n", "=", ":resize +10<CR>", opts)
keymap("n", "-", ":resize -10<CR>", opts)
keymap("n", "+", ":vertical resize +10<CR>", opts)
keymap("n", "_", ":vertical resize -10<CR>", opts)

-- Navigate buffers
keymap("n", "L", ":bnext<CR>", opts)
keymap("n", "H", ":bprevious<CR>", opts)

-- Delete buffer
keymap("n", "bd", ":bd<CR>", opts)

-- Show list buffers
keymap("n", "<leader>ls", ":buffers<CR>", opts)

-- Quick move to begin/end line
keymap("n", "<leader>el", "$", opts)
keymap("n", "<leader>bl", "^", opts)

keymap("n", "vs", ":vsplit<CR>", opts)
keymap("n", "sp", ":split<CR>", opts)

-- Quick save, quick quit
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>Q", ":qa<CR>", opts)

-- Quick search, replace
keymap("n", "<leader>S", ":.,$s/foo/bar/g", no_silent_opts)

-- Turn off no highlight search
keymap("n", "<leader>nhl", ":nohl<CR>", opts)

-- Quick toggle between two files *CTRL-^* *CTRL-6*
keymap("n", "<Tab>", "<C-^>", no_silent_opts)

-- Moving in window
keymap("n", "<leader>ll", "L", opts)
keymap("n", "<leader>hh", "H", opts)
keymap("n", "<leader>mm", "M", opts)

---------------------------- INSERT  ----------------------------
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Press jks to fast switch Normal mode and save file
keymap("i", "jkw", "<ESC>:w<CR>", opts)

---------------------------- VISUAL  ----------------------------
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

---------------------------- VISUAL BLOCK  ----------------------------
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

---------------------------- TERMINAL  ----------------------------
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap("t", "<Esc>", "<ESC><C-\\><C-N>", term_opts)
