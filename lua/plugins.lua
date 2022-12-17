local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'
  -- Debugger
  use "mfussenegger/nvim-dap"
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
  -- Dap extensions
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npm run compile",
    tag = 'v1.74.1'
  }
  use "mxsdev/nvim-dap-vscode-js"
  use {
    "golang/vscode-go",
    -- Put in opt folder
    opt = true,
    run = "npm install && npm run compile"
  }
  use {
    "Dart-Code/Dart-Code",
    -- Put in opt folder
    opt = true,
    run = "npm install && npx webpack --mode production"
  }
  -- Tab manager
  use 'romgrk/barbar.nvim'
  -- end tab manager
  use 'nvim-lualine/lualine.nvim'
  -- lsp ui
  use({
    "glepnir/lspsaga.nvim",
    requires = { { "nvim-tree/nvim-web-devicons" } },
    branch = "main",
    config = function()
      require("lspsaga").setup({})
    end,
  })
  -- lsp
  use {
    "folke/neodev.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- tmux
  use 'christoomey/vim-tmux-navigator'
  -- autocomplete
  use {
    'hrsh7th/nvim-cmp',
    -- suggestions from current buffer
    'hrsh7th/cmp-buffer',
    -- suggestions from path
    'hrsh7th/cmp-path',
    -- suggestions from lsp
    'hrsh7th/cmp-nvim-lsp',
    -- suggestions from lua api
    'hrsh7th/cmp-nvim-lua',
    -- Snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip'
  }
  -- Snippets
  use "rafamadriz/friendly-snippets"
  -- Formatter
  use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile && yarn compile' }
  -- Git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  use 'tpope/vim-surround'
  -- Visual stuff
  use 'norcalli/nvim-colorizer.lua'
  use { 'folke/tokyonight.nvim', branch = 'main' }

  -- Auto pairs
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use 'nvim-tree/nvim-tree.lua'
  use {
    'nvim-treesitter/nvim-treesitter-context',
    config = function() require("treesitter-context").setup {} end
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- Syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'tpope/vim-commentary'
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
  if packer_bootstrap then
    require('packer').sync()
  end
  -- Folding
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
end)
