local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

indent_blankline.setup({
	show_current_context = true,
	show_current_context_start = true,
	space_char_blankline_highlight = true,
})
vim.cmd([[highlight IndentBlanklineContextStart guifg=#E5C07B gui=nocombine]])
vim.cmd([[highlight IndentBlanklineSpaceChar guifg=#E5C07B gui=nocombine]])
