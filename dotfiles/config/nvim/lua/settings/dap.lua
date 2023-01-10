local M = {}

local function configuration()
  local dap_breakpoint = {
    error = {
      text = '',
      texthl = 'LspDiagnosticsSignError',
      linehl = '',
      numhl = '',
    },
    rejected = {
      text = '',
      texthl = 'LspDiagnosticsSignHint',
      linehl = '',
      numhl = '',
    },
    stopped = {
      text = '',
      texthl = 'LspDiagnosticsSignInformation',
      linehl = 'DiagnosticUnderlineInfo',
      numhl = 'LspDiagnosticsSignInformation',
    },
  }

  vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
  vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)
  vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
end

local function configure_exts()
  require('nvim-dap-virtual-text').setup({
    commented = true,
  })

  local dap, dapui = require('dap'), require('dapui')
  dapui.setup() -- use default
  dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open({})
  end
  dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close({})
  end
  dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close({})
  end
end

local function configure_debuggers()
  require('lsp.dap.rust').setup()
  require('lsp.dap.javascript').setup()
end

local function configure_keymaps()
  local whichkey = require('which-key')
  local opt = { mode = 'n', prefix = '<leader>' }
  local keymap_d = {
    d = {
      name = 'Debug',
      R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", 'Run to Cursor' },
      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", 'Evaluate Input' },
      C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", 'Conditional Breakpoint' },
      U = { "<cmd>lua require'dapui'.toggle()<cr>", 'Toggle UI' },
      b = { "<cmd>lua require'dap'.step_back()<cr>", 'Step Back' },
      c = { "<cmd>lua require'dap'.continue()<cr>", 'Continue' },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", 'Disconnect' },
      e = { "<cmd>lua require'dapui'.eval()<cr>", 'Evaluate' },
      g = { "<cmd>lua require'dap'.session()<cr>", 'Get Session' },
      h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", 'Hover Variables' },
      S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", 'Scopes' },
      i = { "<cmd>lua require'dap'.step_into()<cr>", 'Step Into' },
      o = { "<cmd>lua require'dap'.step_over()<cr>", 'Step Over' },
      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", 'Pause' },
      q = { "<cmd>lua require'dap'.close()<cr>", 'Quit' },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", 'Toggle Repl' },
      s = { "<cmd>lua require'dap'.continue()<cr>", 'Start' },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", 'Toggle Breakpoint' },
      x = { "<cmd>lua require'dap'.terminate()<cr>", 'Terminate' },
      u = { "<cmd>lua require'dap'.step_out()<cr>", 'Step Out' },
    },
  }
  whichkey.register(keymap_d, opt)

  local keymap_d_v = {
    d = {
      name = 'Debug',
      e = { "<cmd>lua require'dapui'.eval()<cr>", 'Evaluate' },
    },
  }
  opt = { mode = 'v', prefix = '<leader>' }
  whichkey.register(keymap_d_v, opt)
end

function M.setup()
  configure_exts()
  configuration()
  configure_debuggers()
  configure_keymaps()
end

return M
