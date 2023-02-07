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
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'terryma/vim-multiple-cursors',
    'kyazdani42/nvim-web-devicons',
  })

  -- dashboard
  use({
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('settings.alpha')
    end,
  })

  -- term
  use({
    'akinsho/toggleterm.nvim',
    config = require('settings.toggleterm').setup,
    disable = true,
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
      { 'nvim-telescope/telescope-dap.nvim' },
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
      'nvim-treesitter/nvim-treesitter-textobjects',
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
      {
        'akinsho/flutter-tools.nvim',
        config = require('lsp.servers.dart').setup,
      },
      { 'jose-elias-alvarez/typescript.nvim' },
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require('lsp.null-ls')
        end,
        after = 'nvim-lspconfig',
      },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
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
    config = function()
      require('settings.comments')
    end,
    event = 'BufWinEnter',
  })

  use({
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('settings.colorizer')
    end,
    opt = true,
    event = 'BufRead',
  })

  -- highlighting indent
  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('settings.blankline')
    end,
    opt = true,
    event = 'BufRead',
  })

  -- gitsigns
  use({
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    wants = 'plenary.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('settings.gitsigns')
    end,
  })

  -- renamer
  use({
    'filipdutescu/renamer.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = require('settings.renamer').setup,
  })

  -- nvimtree
  use({
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
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
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('settings.statusline')
    end,
    after = require('config').theme,
  })

  -- bufferline
  use({
    'akinsho/bufferline.nvim',
    require = { 'nvim-web-devicons', opt = true },
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
      },
      {
        'theHamsta/nvim-dap-virtual-text', -- virtual text during debugging
      },
      { 'mxsdev/nvim-dap-vscode-js' },
      {
        'microsoft/vscode-js-debug',
        opt = true,
        run = 'npm install --legacy-peer-deps && npm run compile',
      },
    },
    config = function()
      require('settings.dap').setup()
    end,
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

  use({
    'glepnir/lspsaga.nvim',
    config = require('settings.lspsaga_setting').setup,
    event = 'BufRead',
    requires = { { 'nvim-tree/nvim-web-devicons' } },
  })

  -- ZenMode
  use({
    'folke/zen-mode.nvim',
    opt = true,
    cmd = 'ZenMode',
    config = function()
      require('settings.zenmode').setup()
    end,
    disable = true,
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

  -- fold
  use({
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = require('settings.ufo').setup,
  })
end)
