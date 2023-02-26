return {
  'windwp/nvim-ts-autotag',
  opts = function()
    return {
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
