return require('packer').startup(function()
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}
  -- Lsp
  use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- lsp UI staffs
  use("tami5/lspsaga.nvim")
  -- nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
  use 'hrsh7th/cmp-path'     -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
  use 'hrsh7th/nvim-cmp'
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use 'rafamadriz/friendly-snippets'
  use 'honza/vim-snippets'
  -- lspkind
  use 'onsails/lspkind-nvim'
  -- dap support
  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("theHamsta/nvim-dap-virtual-text")
  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  -- Colorscheme
  use 'NTBBloodbath/doom-one.nvim'
  use 'folke/which-key.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'akinsho/bufferline.nvim'
  use 'windwp/windline.nvim'
  use {'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end}
  use 'blackCauldron7/surround.nvim'
  use 'numToStr/FTerm.nvim'
  use 'h-hg/fcitx.nvim'
  use {'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end}
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end 
  }
  use 'aserowy/tmux.nvim'
  use { 'michaelb/sniprun', run = 'bash ./install.sh'}
  use 'nvim-telescope/telescope-file-browser.nvim' 
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-symbols.nvim'
  use 'nvim-telescope/telescope-packer.nvim'
  use 'camgraff/telescope-tmux.nvim'
  use 'nvim-telescope/telescope-frecency.nvim'
  use 'tami5/sqlite.lua'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'Shatur/neovim-session-manager'
  use 'goolord/alpha-nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'ray-x/go.nvim'
  use 'leoluz/nvim-dap-go'
  use {'windwp/nvim-ts-autotag',
    config = function ()
      require'nvim-treesitter.configs'.setup {
        autotag = {
          enable = true,
        }
      }
    end}
  use 'simrat39/rust-tools.nvim'
  --use 'nvim-neorg/neorg'
  use 'nvim-orgmode/orgmode'
  use 'akinsho/org-bullets.nvim'
  use 'lukas-reineke/headlines.nvim'
  use {'lewis6991/spellsitter.nvim',
    config = function()
      require('spellsitter').setup()
    end}
  use {'xiyaowong/nvim-transparent',
    require("transparent").setup({
      enable = false})
  }
  use{
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  use {'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }
end)
