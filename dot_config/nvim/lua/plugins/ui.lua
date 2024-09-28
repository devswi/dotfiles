return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
      },
      cmdline = {
        enabled = false,
      },
      messages = {
        enabled = false,
      },
      routes = {
        {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = {
            skip = true,
          },
        },
      },
      presets = {
        lsp_doc_border = true,
        long_message_to_split = true,
      },
    },
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        window = {
          winblend = 0,
        },
      },
    },
  },
  -- dashboard
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.starter",
    event = "VimEnter",
    opts = function()
      local function greeting(name)
        local date = os.date("*t")
        local hour = date.hour
        local greetings = {
          [1] = "  Good morning",
          [2] = "  Good afternoon",
          [3] = "  Good evening",
        }
        local greetingIndex
        if hour == 24 or hour < 12 then
          greetingIndex = 1
        elseif hour >= 12 and hour < 18 then
          greetingIndex = 2
        elseif hour >= 18 and hour < 24 then
          greetingIndex = 3
        end
        return greetings[greetingIndex] .. ", " .. name .. "\n" .. "Cease to struggle and you cease to live."
      end

      local username = "swiswi"
      local greetingLabel = greeting(username)
      local pad = string.rep(" ", 0)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end

      local starter = require("mini.starter")
      --stylua: ignore
      local config = {
        evaluate_single = true,
        header = greetingLabel,
        items = {
          new_section("Find file",    "Telescope find_files", "Telescope"),
          new_section("Recent files", "Telescope oldfiles",   "Telescope"),
          new_section("Grep text",    "Telescope live_grep",  "Telescope"),
          new_section("init.lua",     "e $MYVIMRC",           "Config"),
          new_section("Lazy",         "Lazy",                 "Config"),
          new_section("New file",     "ene | startinsert",    "Built-in"),
          new_section("Quit",         "qa",                   "Built-in"),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. "░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
      }
      return config
    end,
    config = function(_, config)
      -- close Lazy and re-open when starter is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "MiniStarterOpened",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      local starter = require("mini.starter")
      starter.setup(config)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local pad_footer = string.rep(" ", 0)
          starter.config.footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(starter.refresh)
        end,
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 0,
      },
      current_line_blame_formatter = "<author> • <author_time> • <summary>",
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        diagnostics = false,
        always_show_bufferline = false,
        offsets = {
          {
            text = "File Explorer",
          },
        },
      },
    },
  },
  {
    "echasnovski/mini.indentscope", -- https://github.com/echasnovski/mini.indentscope
    lazy = true,
    opts = {
      -- symbol = "│",
      symbol = "▏",
      draw = {
        animation = function()
          return 0
        end,
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      local navic = require("nvim-navic")

      local hide_in_width = function()
        return vim.fn.winwidth(0) > 60
      end

      local lazy_icons = require("lazyvim.config").icons

      local diff = {
        "diff",
        colored = true,
        symbols = {
          added = lazy_icons.git.added,
          modified = lazy_icons.git.modified,
          removed = lazy_icons.git.removed,
        },
        cond = hide_in_width,
      }

      local diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = {
          "error",
          "warn",
          "hint",
          "info",
        },
        symbols = {
          error = lazy_icons.diagnostics.Error,
          warn = lazy_icons.diagnostics.Warn,
          info = lazy_icons.diagnostics.Info,
          hint = lazy_icons.diagnostics.Hint,
        },
        colored = true,
        update_in_insert = true,
        always_visible = true,
      }

      local function lsp_name()
        local buf = vim.api.nvim_get_current_buf()
        local active_clients = vim.lsp.get_clients({
          bufnr = buf,
        })
        local client_names = {}
        for _, client in pairs(active_clients or {}) do
          if vim.lsp.buf_is_attached(buf, client.id) then
            table.insert(client_names, client.name)
          end
        end

        if not vim.tbl_isempty(client_names) then
          table.sort(client_names)
        end

        return string.format("%d", #client_names) .. " server(s)"
      end

      local lsp_tbl = {
        function()
          return lsp_name()
        end,
        cond = function()
          return lsp_name() ~= nil
        end,
        icon = "󰝴 ",
        color = { bg = "#ff9e64", fg = "#24283b" },
      }

      return {
        options = {
          component_separators = "",
          section_separators = "",
          disabled_filetypes = {
            statusline = {
              "ministarter",
              "lazy",
              "alpha",
              "aerial",
              "Trouble",
              "Outline",
            },
            winbar = {
              "ministarter",
              "aerial",
              "Trouble",
              "neo-tree",
              "Outline",
              "lazy",
              "dap-repl",
              "dapui",
              "dapui_watches",
              "dapui_breakpoints",
              "dapui_scopes",
              "dapui_stacks",
              "dapui_console",
            },
          },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(str)
                return "󰊠 " .. str
              end,
            },
          },
          lualine_b = {
            { "branch", shorten = true, icon = " " },
            diff,
          },
          lualine_c = {
            LazyVim.lualine.root_dir(),
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { LazyVim.lualine.pretty_path() },
          },
          lualine_x = {
            diagnostics,
            lsp_tbl,
          },
          lualine_y = {
            { "encoding" },
            {
              "%B",
              fmt = function(str)
                return "0x" .. str
              end,
            },
          },
          lualine_z = {
            { "progress" },
            { "location" },
          },
        },
        winbar = {
          lualine_a = {
            {
              "filetype",
              icon_only = true,
              color = { bg = "#25273b" },
            },
            {
              "filename",
              path = 1,
              file_status = false,
              color = { bg = "#25273b", fg = "#a9b1d6" },
            },
          },
          lualine_b = {
            {
              function()
                return navic.get_location()
              end,
              cond = navic.is_available,
            },
          },
        },
        inactive_winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        extensions = {
          "neo-tree",
        },
      }
    end,
  },
}
