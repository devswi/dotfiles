-- @diagnostic disable: different-requiresnvimtree
local present, custom_packer = pcall(require, 'packer-install')

if not present then
  return false
end

local packer = custom_packer.packer
local use = packer.use

return packer.startup(function()
  use({
    'wbthomason/packer.nvim',
    'lewis6991/impatient.nvim',
    'nathom/filetype.nvim',
    'nvim-lua/plenary.nvim',
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'terryma/vim-multiple-cursors',
  })

  -- dashboard
  use({
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    commit = 'd688f46090a582be8f9d7b70b4cf999b780e993d',
    config = function()
      require('settings.alpha')
    end,
  })

  -- term
  use({
    'akinsho/toggleterm.nvim',
    commit = '62683d927dfd30dc68441a5811fdcb6c9f176c42',
    config = require('settings.toggleterm').setup,
  })

  -- theme
  use({
    'folke/tokyonight.nvim',
    as = 'tokyonight',
    disable = require('config').theme ~= 'tokyonight',
  })

  use({
    'catppuccin/nvim',
    as = 'catppuccin',
    disable = require('config').theme ~= 'catppuccin',
  })

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-lua/popup.nvim' },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      },
      {
        'nvim-telescope/telescope-live-grep-args.nvim',
      },
      { 'nvim-telescope/telescope-rg.nvim' },
      'cljoly/telescope-repo.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      { 'nvim-telescope/telescope-dap.nvim', disable = true },
    },
    config = function()
      require('settings.telescope')
    end,
    event = 'BufWinEnter',
  })

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-tree-docs',
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
    },
    config = function()
      require('settings.treesitter')
    end,
  })

  -- LSP
  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('lsp')
    end,
    requires = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'simrat39/rust-tools.nvim' },
      { 'jose-elias-alvarez/typescript.nvim' },
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require('lsp.null-ls')
        end,
        commit = '7cd491b7458a5dd23a6fa3abb6c94341be546f7b',
        after = 'nvim-lspconfig',
      },
      {
        'glepnir/lspsaga.nvim',
        config = function()
          require('lsp.lspsaga')
        end,
      },
      {
        'ray-x/lsp_signature.nvim',
        config = function()
          require('settings.lspsignature').setup()
        end,
        after = 'nvim-lspconfig',
      },
    },
  })

  use({
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup()
    end,
  })

  -- cmp plugins
  use({
    'hrsh7th/nvim-cmp',
    config = require('settings.cmp').setup,
    requires = {
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      {
        'L3MON4D3/LuaSnip',
        requires = {
          'rafamadriz/friendly-snippets',
        },
      },
      {
        'windwp/nvim-autopairs',
        after = 'nvim-cmp',
      },
      'onsails/lspkind-nvim', -- show pictograms in the auto complete popup
    },
    event = 'InsertEnter',
  })

  -- comments
  use({
    'numToStr/Comment.nvim',
    commit = 'ae8c440fe98c65f3a941d6fc6de75538c5c1ecde',
    config = function()
      require('settings.comments')
    end,
    event = 'BufWinEnter',
  })

  use({
    'norcalli/nvim-colorizer.lua',
    commit = '36c610a9717cc9ec426a07c8e6bf3b3abcb139d6',
    config = function()
      require('settings.colorizer')
    end,
    opt = true,
    event = 'BufRead',
  })

  -- highlighting indent
  use({
    'lukas-reineke/indent-blankline.nvim',
    tag = 'v2.20.0',
    config = function()
      require('settings.blankline')
    end,
    opt = true,
    event = 'BufRead',
  })

  -- gitsigns
  use({
    'lewis6991/gitsigns.nvim',
    commit = '16e5ecc5f5ddf89dc287b4caece9abc9f7ebb506',
    event = 'BufReadPre',
    wants = 'plenary.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('settings.gitsigns')
    end,
  })

  -- nvimtree
  use({
    'kyazdani42/nvim-tree.lua',
    commit = '3e49d9b7484e21f0b24ebdf21b8b7af227ea97a6',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('settings.nvimtree')
    end,
    opt = true,
    cmd = {
      'NvimTreeClose',
      'NvimTreeToggle',
      'NvimTreeFindFile',
    },
  })

  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('settings.statusline')
    end,
    after = require('config').theme,
  })

  -- bufferline
  use({
    'akinsho/bufferline.nvim',
    require = { 'nvim-web-devicons', opt = true },
    tag = 'v2.6.0',
    opt = true,
    event = 'BufRead',
    config = require('settings.buffer_line').setup,
  })

  -- todo highlights
  use({
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('settings.todo_comments')
    end,
    opt = true,
    event = 'BufWinEnter',
  })

  -- which key
  use({
    'folke/which-key.nvim',
    commit = '7d260629f7a7e9de6f80b31aa347e2c930925540',
    config = function()
      require('settings.which_key')
      require('core.keymappings.whichkey')
    end,
    event = 'BufWinEnter',
  })

  -- startuptime
  use({
    'dstein64/vim-startuptime',
    opt = true,
    cmd = 'StartupTime',
  })

  -- fidget
  use({
    'j-hui/fidget.nvim',
    opt = true,
    event = 'BufWinEnter',
    config = function()
      require('settings.fidget')
    end,
  })

  --
  use({
    'rcarriga/nvim-notify',
    config = function()
      require('settings.notify')
    end,
    after = require('config').theme,
  })

  -- hop
  use({
    'phaazon/hop.nvim',
    config = function()
      require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
    end,
    cmd = {
      'HopLine',
      'HopChar2',
      'HopChar1CurrentLine',
    },
  })

  -- trouble.nvim
  use({
    'folke/trouble.nvim',
    wants = 'nvim-web-devicons',
    cmd = { 'TroubleToggle', 'Trouble' },
    config = function()
      require('trouble').setup({
        use_diagnostic_signs = true,
      })
    end,
  })

  use({
    'stevearc/aerial.nvim',
    config = function()
      require('settings.aerial')
    end,
    module = { 'aerial' },
    cmd = { 'AerialToggle' },
  })

  use({
    'aserowy/tmux.nvim',
    config = function()
      require('tmux.init').setup({
        -- overwrite default configuration
        -- here, e.g. to enable default bindings
        copy_sync = {
          -- enables copy sync and overwrites all register actions to
          -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
          enable = true,
        },
        navigation = {
          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = true,
        },
        resize = {
          -- enables default keybindings (A-hjkl) for normal mode
          enable_default_keybindings = true,
        },
      })
    end,
  })

  use({
    'SmiteshP/nvim-navic',
    config = function()
      require('settings.nvim-navic').setup()
    end,
  })

  use({
    'mfussenegger/nvim-dap',
    requires = {
      {
        'rcarriga/nvim-dap-ui', -- ui for nvim-dap
        disable = true,
      },
      {
        'theHamsta/nvim-dap-virtual-text', -- virtual text during debugging
        disable = true,
      },
    },
    config = function()
      require('settings.dap').setup()
    end,
    disable = true,
  })

  -- markdown preview
  use({
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    setup = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  })

  -- ZenMode
  use({
    'folke/zen-mode.nvim',
    commit = 'f1cc53d32b49cf962fb89a2eb0a31b85bb270f7c',
    opt = true,
    cmd = 'ZenMode',
    config = function()
      require('settings.zenmode').setup()
    end,
  })

  -- lightbulb
  use({
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
    opt = true,
    event = 'BufWinEnter',
    config = require('settings.lightbulb').setup,
  })

  -- cargo crates for rust toml file
  use({
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('crates').setup()
    end,
  })

  -- neogen
  use({
    'danymat/neogen',
    config = require('settings.neogen').setup,
    cmd = { 'Neogen' },
    module = 'neogen',
  })
end)
