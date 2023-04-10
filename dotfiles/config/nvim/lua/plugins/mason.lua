return {
  'williamboman/mason.nvim',
  opts = {
    ensure_installed = {
      'bash-language-server',
      'css-lsp',
      'html-lsp',
      'emmet-ls',
      'tailwindcss-language-server',
      'rust-analyzer',
      'vue-language-server', -- volar for vue3.x
      'marksman',
      'prisma-language-server',
      'vetur-vls', -- vue2.x
    },
  },
}
