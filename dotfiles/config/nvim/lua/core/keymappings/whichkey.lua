local normal_mode_opts = {
  mode = 'n',
  prefix = '<leader>',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local noremal_mode_mappings = {
  a = {
    name = 'Aerial',
    t = { ':AerialToggle<CR>', 'Toggle' },
    a = { ':AerialOpenAll<CR>', 'Open All' },
    c = { ':AerialCloseAll<CR>', 'Close All' },
    s = { ':AerialTreeSyncFolds<CR>', 'Sync code folding' },
    i = { ':AerialInfo<CR>', 'Info' },
  },
  -- s = {
  --   name = 'Shell',
  --   h = { ':ToggleTerm<CR>', 'Horizontal' },
  --   v = { ':ToggleTerm direction=vertical<CR>', 'Vertical' },
  --   f = { ':ToggleTerm direction=float<CR>', 'Float' },
  -- },
  b = {
    name = 'Buffer',
    c = {
      '<cmd>bdelete!<CR>',
      'Close buffer',
    },
    C = {
      '<cmd>%bd|e#<CR>',
      'Close other buffers',
    },
    p = {
      '<cmd>BufferLinePick<cr>',
      'Pick a buffer',
    },
  },
  c = {
    name = 'Code',
    f = {
      '<cmd>Neogen func<CR>',
      'Func doc',
    },
    c = {
      '<cmd>Neogen class<CR>',
      'Class doc',
    },
    t = {
      '<cmd>Neogen type<CR>',
      'Type doc',
    },
  },
  e = {
    '<cmd>NvimTreeToggle<cr>',
    'Toggle NvimTree(Explorer)',
  },
  f = {
    name = 'Find',
    b = {
      "<cmd>lua require('telescope.builtin').buffers()<cr>",
      'Buffers',
    },
    c = { "<cmd>lua require('telescope.builtin').commands()<cr>", 'Commands' },
    h = {
      "<cmd>lua require('telescope.builtin').help_tags()<cr>",
      'Help',
    },
    m = {
      "<cmd>lua require('telescope.builtin').marks()<cr>",
      'Marks',
    },
    o = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", 'Old Files' },
    g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", 'Live Grep' },
    r = { "<cmd>lua require'telescope'.extensions.file_browser.file_browser()<cr>", 'File Browser' },
  },
  g = {
    name = 'Git',
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", 'Blame' },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", 'Preview Hunk' },
    o = { '<cmd>Telescope git_status<cr>', 'Open changed file' },
    d = { '<cmd>Gitsigns diffthis HEAD<cr>', 'Git Diff' },
  },
  h = {
    '<cmd>nohlsearch<CR>',
    'No highlight',
  },
  j = {
    name = 'Jump',
    j = {
      '<cmd>HopChar2<CR>',
      'Jump to any char',
    },
    l = {
      '<cmd>HopLine<CR>',
      'Jump to line',
    },
    c = {
      '<cmd>HopChar1CurrentLine<CR>',
      'Jump to char in line',
    },
    f = {
      '<cmd>NvimTreeFindFile<CR>',
      'Jump to current file',
    },
  },
  q = {
    '<cmd>q!<cr>',
    'Quit',
  },
  r = {
    name = 'Rust',
    r = { ':RustRunnables<CR>', 'Runnables' },
    d = { ':RustDebuggables<CR>', 'Debuggables' },
    e = { ':RustExpandMacro<CR>', 'Expand Macro' },
    c = { ':RustOpenCargo<CR>', 'Open Cargo.toml' },
    g = { ':RustViewCrateGraph<CR>', 'View Crate Graph' },
    m = { ':RustParentModule<CR>', 'Parent Module' },
    j = { ':RustJoinLines<CR>', 'Join Lines' },
    a = { ':RustHoverActions<CR>', 'Hover Actions' },
    h = { ':RustHoverRange<CR>', 'Range Hover Actions' },
    b = { ':RustMoveItemDown<CR>', 'Move Item Down' },
    u = { ':RustMoveItemUp<CR>', 'Move Item Up' },
    s = { ':RustStartStandaloneServerForBuffer<CR>', 'New Server for Buffer' },
    -- t = { '<cmd>lua require("settings.toggleterm").run_float("cargo test")<CR>', 'Run tests' },
  },
  w = {
    '<cmd>w!<cr>',
    'Save',
  },
  v = {
    '<cmd>vsplit<cr>',
    'Split window vertically',
  },
  V = {
    '<cmd>split<cr>',
    'Split window horizontal',
  },
}

local visual_mode_opts = {
  mode = 'v',
  prefix = '<leader>',
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local visual_mode_mappings = {}

local which_key = require('which-key')
which_key.register(noremal_mode_mappings, normal_mode_opts)
which_key.register(visual_mode_mappings, visual_mode_opts)
