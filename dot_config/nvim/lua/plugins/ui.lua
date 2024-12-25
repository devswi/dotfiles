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
      popupmenu = {
        enabled = false,
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
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 0,
      },
      current_line_blame_formatter = "  <author> • <author_time> • <summary>",
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = {
        char = "▏",
        tab_char = "▏",
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "neo-tree",
        },
      },
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
              "lazy",
              "snacks_dashboard",
              "alpha",
              "aerial",
              "Trouble",
              "Outline",
            },
            winbar = {
              "snacks_dashboard",
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
              color = { bg = "transparent" },
            },
            {
              "filename",
              path = 1,
              file_status = false,
              color = { bg = "transparent", fg = "#a9b1d6" },
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
