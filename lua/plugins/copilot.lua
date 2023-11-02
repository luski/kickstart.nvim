return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  build = ':Copilot auth',
  config = function()
    require('copilot').setup {
      panel = {
        enabled = true,
        auto_refresh = true,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
      filetypes = {
        javascript = true,
        typescript = true,
        typescriptreact = true,
        markdown = true,
        help = true,
      },
    }
  end,
}
