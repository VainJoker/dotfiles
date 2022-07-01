local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins for basic
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("lewis6991/impatient.nvim")
	use("github/copilot.vim") -- AI pair programmer which suggests line completions and entire function bodies as you type
	use("folke/which-key.nvim")
	use("tami5/sqlite.lua")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- Post-install/update hook with neovim command
	use("kyazdani42/nvim-web-devicons")
	use("folke/tokyonight.nvim")
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-tree.lua")
	use("numToStr/FTerm.nvim")
	use("ahmedkhalf/project.nvim")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("m-demare/hlargs.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim")
	use("folke/trouble.nvim")
	use("folke/todo-comments.nvim")
	use("RishabhRD/nvim-lsputils")
	use("RishabhRD/popfix")
	use("ray-x/lsp_signature.nvim")
	use("ethanholz/nvim-lastplace") -- auto return back to the last modified positon when open a file
	use("JoosepAlviste/nvim-ts-context-commentstring") -- jsx how to comment
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use("nvim-telescope/telescope-project.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")
	use("nvim-telescope/telescope-dap.nvim")
	use("lewis6991/gitsigns.nvim") --git
	use("rcarriga/nvim-notify")
	use("simrat39/symbols-outline.nvim")
	use("SmiteshP/nvim-gps") -- statusline show class structure
	use("andymass/vim-matchup")
	use("arkav/lualine-lsp-progress") -- show lsp progress
	use("phaazon/hop.nvim")
	use("famiu/bufdelete.nvim")
	use("AckslD/nvim-neoclip.lua")
	use("tami5/lspsaga.nvim")
	-- Debugger
	use("ravenxrz/DAPInstall.nvim") -- help us install several debuggers
	use("ravenxrz/nvim-dap")
	use("theHamsta/nvim-dap-virtual-text")
	use("haringsrob/nvim_context_vt")
	use("rcarriga/nvim-dap-ui")
	use("mfussenegger/nvim-dap-python") -- debug python
	use({ "leoluz/nvim-dap-go", module = "dap-go" }) -- debug golang
	use({ "jbyuki/one-small-step-for-vimkind", module = "osv" }) -- debug any Lua code running in a Neovim instance
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})
	use("simrat39/rust-tools.nvim")
	use("ray-x/go.nvim")
	use("karb94/neoscroll.nvim")
	use("hrsh7th/vim-eft")
	use("jdhao/better-escape.vim")
	use("edluffy/specs.nvim")
	use("xiyaowong/nvim-cursorword")
	use("gelguy/wilder.nvim")
	use({ "ellisonleao/glow.nvim", branch = "main" })
	use({ "michaelb/sniprun", run = "bash ./install.sh", cmd = { "SnipRun", "'<,'>SnipRun" } })
	-- use({
	-- 	"tonyfettes/fcitx5.nvim",
	-- 	-- Add luarocks dependencies
	-- 	rocks = { "lgi", "dbus_proxy" },
	-- })
	use("h-hg/fcitx.nvim")

	-- Post-install/update hook with call of vimscript function with argument
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
