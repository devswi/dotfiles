local path = require("util.path")

return {
  {
    "mason.nvim",
    opts = {
      ensure_installed = {
        "cspell",
      },
    },
  },
  -- hide cspell virtual text
  {
    "nvim-lspconfig",
    opts = function(_, opts)
      -- do not know why only works when `source == false`
      if opts.diagnostics.virtual_text.source == false then
        local format = opts.diagnostics.virtual_text.format

        opts.diagnostics.virtual_text.format = function(diagnostics)
          if diagnostics.source ~= "cspell" then
            if format then
              return format(diagnostics)
            else
              return diagnostics.message
            end
          end
        end
      end
    end,
    keys = {
      {
        "<leader>ad",
        "<cmd>lua require('util.cspell').add_word_to_c_spell_dictionary()<CR>",
        desc = "Add unknown to cspell dictionary",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    init = function()
      local config_file_name = "cspell.json"
      local function find_json(cwd)
        local workspace_cspell_json_file_path = path.join(cwd, config_file_name)
        local global_cspell_json_file_path = path.join(vim.loop.os_homedir(), config_file_name)

        if vim.fn.filereadable(workspace_cspell_json_file_path) == 1 then
          return workspace_cspell_json_file_path
        elseif vim.fn.filereadable(global_cspell_json_file_path) == 1 then
          return global_cspell_json_file_path
        end
      end

      local config_json = find_json(vim.fn.getcwd())
      if config_json ~= nil then
        local cspell = require("lint").linters.cspell

        table.insert(cspell.args, "-c")
        table.insert(cspell.args, config_json)
      end
    end,
    opts = {
      linters_by_ft = {
        ["*"] = { "cspell" },
      },
    },
  },
}
