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
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
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
          -- { section = "terminal", cmd = "curl -s 'wttr.in/?0'" },
          {
            section = "keys",
            padding = 2,
            indent = 2,
          },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
          { section = "recent_files", icon = " ", title = "Recent Files", padding = 2, indent = 2 },
          function()
            local command = "git --no-pager diff --stat-width=98 --stat-count=8 -B -M -C"
            local status_len = vim.fn.system(command .. " | head -255 | wc -l")
            local has_status = tonumber(status_len) > 0
            local in_git = Snacks.git.get_root() ~= nil
            return {
              icon = " ",
              title = "Git Status",
              section = "terminal",
              cmd = "echo ''; " .. command,
              enabled = in_git and has_status,
              padding = 2,
              indent = 1,
            }
          end,
          -- { section = "terminal", cmd = "printf 'Cease to struggle and you cease to live.'" },
          -- { section = "keys", gap = 0, padding = 1 },
          { section = "startup" },
        },
      },
      indent = {
        enabled = true,
      },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = {
        enabled = true,
        folds = {
          open = true,
          git_hl = true,
        },
      },
      words = { enabled = true },
      zen = {
        enabled = false,
      },
    },
  },
}
