local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim")
	use("sainnhe/gruvbox-material")
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("nvim-lua/plenary.nvim")

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	use("rescript-lang/vim-rescript")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"lewis6991/gitsigns.nvim",
		-- tag = 'release' -- To use the latest release
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({ "akinsho/bufferline.nvim", tag = "*", requires = "kyazdani42/nvim-web-devicons" })
	use({
		"numToStr/Comment.nvim",
		config = [[require"comment"]],
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup()
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
