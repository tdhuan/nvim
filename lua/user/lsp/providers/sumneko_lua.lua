local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
local opts = {
  settings = {
    Lua = {
      runtime = {
        version = 'Lua 5.4',
        path = {
          '?.lua',
          '?/init.lua',
          vim.fn.expand'~/.luarocks/share/lua/5.4/?.lua',
          vim.fn.expand'~/.luarocks/share/lua/5.4/?/init.lua',
          '/usr/share/5.4/?.lua',
          '/usr/share/lua/5.4/?/init.lua'
        }
      },
      diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
  },
}

-- local lua_dev_loaded, neodev = pcall(require, "neodev")
-- if not lua_dev_loaded then
--   return opts
-- end
--
-- local dev_opts = {
--   library = {
--     enabled = true,
--     vimruntime = true, -- runtime path
--     types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
--     -- plugins = true, -- installed opt or start plugins in packpath
--     -- you can also specify the list of plugins to make available as a workspace library
--     plugins = { "plenary.nvim" },
--   },
--   setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
--   -- for your Neovim config directory, the config.library settings will be used as is
--   -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
--   -- for any other directory, config.library.enabled will be set to false
--   lspconfig = opts,
--   pathStrict = true,
-- }
--
-- return neodev.setup(dev_opts)
return opts
