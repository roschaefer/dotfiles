local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
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

  { 'ntpeters/vim-better-whitespace' },

  { 'mfussenegger/nvim-dap' },
  { 'mxsdev/nvim-dap-vscode-js' },
  { "rcarriga/nvim-dap-ui" },
  { 'microsoft/vscode-js-debug' },

  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
  },

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

  { 'lewis6991/gitsigns.nvim' },

  { 'echasnovski/mini.nvim', version = false },

  { 'sindrets/diffview.nvim' },

  { 'windwp/nvim-ts-autotag' },
  { 'nvim-lualine/lualine.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  { 'Bekaboo/dropbar.nvim' },

  { 'f-person/git-blame.nvim' },

  { "nvim-neotest/nvim-nio" },

  { 'lucidph3nx/nvim-sops', event = { 'BufEnter' }},

  { 'MagicDuck/grug-far.nvim' },

  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>-",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory" ,
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        '<c-up>',
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    ---@type YaziConfig
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      use_ya_for_events_reading = true,
      use_yazi_client_id_flag = true,


      -- enable these if you are using the latest version of yazi
      -- use_ya_for_events_reading = true,
      -- use_yazi_client_id_flag = true,

      keymaps = {
        show_help = '<f1>',
      },
    },
  }
})

vim.o.clipboard = 'unnamedplus'
vim.wo.number = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.keymap.set('n', 'T', '<cmd>tabnew<cr>')
vim.keymap.set('n', 'H', '<cmd>tabprevious<cr>')
vim.keymap.set('n', 'L', '<cmd>tabnext<cr>')


vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = ','
vim.cmd('colorscheme gruvbox')


require("mason").setup()
require("mason-lspconfig").setup()

require'lspconfig'.html.setup{}
require'lspconfig'.volar.setup{}

local mason_registry = require('mason-registry')
local ts_plugin_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin'
require'lspconfig'.ts_ls.setup{
  capabilities = capabilities,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = ts_plugin_path,
        languages = {"javascript", "typescript", "vue"},
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
}

require'lspconfig'.eslint.setup{}
require'lspconfig'.solargraph.setup{}
require'lspconfig'.rubocop.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.svelte.setup{}
require'lspconfig'.tailwindcss.setup{}
require'lspconfig'.helm_ls.setup{}
-- require'lspconfig'.harper_ls.setup{}
require'lspconfig'.jsonls.setup{}

require('lualine').setup({
  options = { theme = 'gruvbox' },
})
require('grug-far').setup({});
require("luasnip.loaders.from_snipmate").load({ path = { "./snippets" } })

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require('gitsigns').setup()
require('mini.align').setup({})
require('mini.ai').setup({})
require('mini.move').setup({})
require('mini.basics').setup({
  mappings = {
    windows = true,
  }
})
require('mini.bracketed').setup({})
require('nvim-ts-autotag').setup()


-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { noremap=true, silent=true, buffer=bufnr }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, bufopts)
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
vim.keymap.set('n', '<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, bufopts)
vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', '<leader>fo', function() vim.lsp.buf.format { async = true } end, bufopts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fH', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fh', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>t', builtin.treesitter, {})
vim.keymap.set('n', '<leader>gb', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>gbr', builtin.git_bcommits_range, {})
vim.keymap.set('n', '<leader>T', builtin.builtin, {})

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local cmp = require'cmp'
local luasnip = require'luasnip'
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})


-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

