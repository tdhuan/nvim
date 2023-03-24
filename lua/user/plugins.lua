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

	-- Color schemes
	use("sainnhe/gruvbox-material")
	use("rebelot/kanagawa.nvim")
	use("sainnhe/everforest")
	use("loctvl842/monokai-pro.nvim")
	use("sainnhe/sonokai")

	-- Language support
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("nvim-lua/plenary.nvim")
	use("rescript-lang/vim-rescript")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("folke/neodev.nvim")
	use("preservim/tagbar")
	use("simrat39/symbols-outline.nvim")

	-- Completion
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- Git support
	use({
		"lewis6991/gitsigns.nvim",
		-- tag = 'release' -- To use the latest release
	})
	use({ "tpope/vim-fugitive" })

	-- Status line, buffer
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "kyazdani42/nvim-web-devicons" })

	-- Comment code
	use({ "numToStr/Comment.nvim" })
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Code actions, formatting
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup()
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Find, filer, preview, pick
	use({
		"junegunn/fzf.vim",
		requires = { "junegunn/fzf", dir = "~/.fzf", run = "./install --all" },
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Explorer tree
	use({
		"ms-jpq/chadtree",
		branch = "chad",
		run = "python3 -m chadtree deps",
		cmd = "CHADopen",
	})

	-- Misc
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("lukas-reineke/indent-blankline.nvim")
	use("norcalli/nvim-colorizer.lua")

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
	})

	-- easily search for, substitute, and abbreviate multiple variants of a word
	use({ "tpope/vim-abolish" })
	use({ "github/copilot.vim" })

	-- Markdown preview
	use({ "ellisonleao/glow.nvim", branch = "main" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
