return {
  'nvim-neotest/neotest',
  dependencies = {
    {
      'marilari88/neotest-vitest',
    },
  },
  opts = function()
    return {
      adapters = {
        require('neotest-vitest'),
      },
    }
  end,
}
