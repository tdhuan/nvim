local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions

local sources = {
	-- formatting.eslint_d,
	-- code_actions.eslint_d,
	--
	formatting.prettier,
	formatting.rescript,
	formatting.stylua,
	formatting.erb_lint,
}

null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
		end
	end,
})
