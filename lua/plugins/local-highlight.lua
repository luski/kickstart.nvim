return {
  'tzachar/local-highlight.nvim',
  config = function()
    require('local-highlight').setup {
      file_types = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'tsx' },
    }
  end,
}
