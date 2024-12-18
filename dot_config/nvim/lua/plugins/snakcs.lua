return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        preset = {
          -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
          ---@type fun(cmd:string, opts:table)|nil
          pick = nil,
          -- Used by the `keys` section to show keymaps.
          -- Set your custom keymaps here.
          -- When using a function, the `items` argument are the default keymaps.
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
          -- Used by the `header` section
          header = "Welcome back, " .. vim.fn.expand("$USER") .. "! Have a nice day!",
          --           header = [[
          -- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
          -- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
          -- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
          -- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
          -- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
          -- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        },
        formats = {
          key = function(item)
            return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
          end,
        },
        sections = {
          { section = "header" },
          {
            section = "terminal",
            cmd = "fortune -s | kittysay -c 10 4",
            hl = "dir",
            padding = 1,
            indent = 8,
            height = 30,
            ttl = 0,
            pane = 2,
          },
          -- { section = "terminal", cmd = "curl -s 'wttr.in/?0'" },
          {
            section = "keys",
            padding = 1,
            indent = 2,
          },
          -- { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            section = "recent_files",
            icon = " ",
            title = "Recent Files",
            padding = 1,
            indent = 2,
          },
          function()
            local command = "git --no-pager diff --stat-width=98 --stat-count=8 -B -M -C"
            local status_len = vim.fn.system(command .. " | head -255 | wc -l")
            return {
              icon = " ",
              title = "Git Status",
              section = "terminal",
              padding = 1,
              enabled = function()
                local in_git = Snacks.git.get_root() ~= nil
                return in_git and tonumber(status_len) > 0
              end,
              cmd = "echo ''; " .. command,
              indent = 1,
            }
          end,
          -- { section = "terminal", cmd = "printf 'Cease to struggle and you cease to live.'" },
          { section = "startup" },
        },
      },
      indent = {
        enabled = false,
        indent = {
          char = "▏",
        },
        scope = {
          char = "▏",
          only_current = true,
        },
      },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = {
        enabled = true,
        folds = {
          open = false,
          git_hl = false,
        },
      },
      words = { enabled = true },
      zen = {
        enabled = false,
      },
    },
  },
}
