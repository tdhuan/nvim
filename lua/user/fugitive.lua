local no_silent_opts = { noremap = true, silent = false }
keymap("n", "<leader>ga", ":Gwrite<CR>", no_silent_opts)
keymap("n", "<leader>gc", ":Git commit<CR>", no_silent_opts)
keymap("n", "<leader>G", ":Git<CR>", no_silent_opts)
keymap("n", "<leader>gpush", ":Git push<CR>", no_silent_opts)
keymap("n", "<leader>gpul", ":Git pull", no_silent_opts)
