local cmp_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_lsp_status_ok then
	return
end

local lsp_status_ok, lsp_config = pcall(require, "lspconfig")
if not lsp_status_ok then
	return
end

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

lsp_installer.settings({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>ld", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
		-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])
	end

	-- if client.name == "eslint" then
	-- 	vim.diagnostic.config({
	-- 		virtual_text = {
	-- 			format = function(diagnostic)
	-- 				if diagnostic.severity == vim.diagnostic.severity.ERROR then
	-- 					return string.format("[%s - %s]: %s", diagnostic.source, diagnostic.code, diagnostic.message)
	-- 				end
	-- 				return diagnostic.message
	-- 			end,
	-- 		},
	-- 	})
	-- end

	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<space>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)

	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
    augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]],
			false
		)
	end

	if client.server_capabilities.colorProvider then
		require("user.lsp.lsp-documentcolors").buf_attach(bufnr, { single_column = true })
	end
end

-- Setup lspconfig.
local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.colorProvider = { dynamicRegistration = false }

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "sumneko_lua", "solargraph", "rescriptls", "tsserver", "bashls", "tailwindcss", "jsonls", "graphql" }
local setting_sumneko = require("user.lsp.providers.sumneko_lua")

local lang_configs = {
	sumneko_lua = setting_sumneko,
	solargraph = {
		cmd = { "solargraph", "stdio" },
		filetypes = { "ruby", "rb", "eruby", "rakefile" },
		init_options = { formatting = true },
		settings = { diagnostics = false, autoformat = false, formatting = true },
	},
	rescriptls = {
		cmd = {
			"node",
			"/Users/huantd/.local/share/nvim/site/pack/packer/start/vim-rescript/server/out/server.js",
			"--stdio",
		},
		filetypes = { "rescript" },
		settings = { diagnostics = true },
	},
	tsserver = {
		cmd = { "typescript-language-server", "--stdio" },
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		init_options = { hostInfo = "neovim" },
	},
	bashls = {
		cmd = { "bash-language-server", "start" },
		cmd_env = {
			GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
		},
		filetypes = { "sh" },
	},
	tailwindcss = {
		{
			settings = {
				tailwindCSS = {
					classAttributes = { "class", "className", "classList", "ngClass" },
					lint = {
						cssConflict = "warning",
						invalidApply = "error",
						invalidConfigPath = "error",
						invalidScreen = "error",
						invalidTailwindDirective = "error",
						invalidVariant = "error",
						recommendedVariantOrder = "warning",
					},
					validate = true,
					codeActions = true,
					files = {
						exclude = { "**/.git/**", "**/node_modules/**", "**/.hg/**" },
					},
					colorDecorators = true,
					showPixelEquivalents = true,
					suggestions = true,
					hover = true,
				},
			},
		},
	},
	jsonls = {},
	graphql = {},
}

for _, name in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

for _, lsp in pairs(servers) do
	lsp_config[lsp].setup(vim.tbl_deep_extend("force", lang_configs[lsp], {
		on_attach = on_attach,
		flags = {
			-- This will be the default in neovim 0.7+
			debounce_text_changes = 100,
		},
		capabilities = capabilities,
	}))
end

require("user.null-ls")
