return {
  { 'neovim/nvim-lspconfig' },

  { "ellisonleao/gruvbox.nvim" },

  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim' },

  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer'},
  { 'hrsh7th/cmp-path'},
  { 'hrsh7th/cmp-cmdline'},
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },

  { 'nvim-treesitter/nvim-treesitter' },

  { 'ggandor/leap.nvim' },

  { 'ntpeters/vim-better-whitespace' },

  { 'mfussenegger/nvim-dap' },
  { 'mxsdev/nvim-dap-vscode-js' },
  { "rcarriga/nvim-dap-ui" },
  { 'microsoft/vscode-js-debug' },
  -- run = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out'

  { 'folke/neodev.nvim' },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  { 'kdheepak/lazygit.nvim' },

  { 'lewis6991/gitsigns.nvim' },

  {'is0n/fm-nvim'},

  { 'echasnovski/mini.nvim', version = false },

  { 'sindrets/diffview.nvim' },

  { 'windwp/nvim-ts-autotag' },
}
