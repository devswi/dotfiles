return {
  'windwp/nvim-ts-autotag',
  opts = function()
    return {
      enable_close_on_slash = false, -- disable case: `<div /` become `<div /div>`
      filetypes = {
        'html',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'vue',
        'tsx',
        'jsx',
        'markdown.mdx',
        'markdown',
      },
    }
  end,
}
