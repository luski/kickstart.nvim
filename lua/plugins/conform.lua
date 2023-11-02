local Module = {
  'stevearc/conform.nvim',
}

function Module.config()
  -- Conform [Formatter]
  require('conform').setup {
    formatters_by_ft = {
      ['javascript'] = { 'prettier' },
      ['javascriptreact'] = { 'prettier' },
      ['typescript'] = { 'prettier' },
      ['typescriptreact'] = { 'prettier' },
      ['css'] = { 'prettier' },
      ['scss'] = { 'prettier' },
      ['less'] = { 'prettier' },
      ['html'] = { 'prettier' },
      ['json'] = { 'prettier' },
      ['jsonc'] = { 'prettier' },
      ['yaml'] = { 'prettier' },
      ['markdown'] = { 'prettier' },
      ['markdown.mdx'] = { 'prettier' },
      ['lua'] = { 'stylua' },
    },
  }
  vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function(args)
      require('conform').format { bufnr = args.buf }
    end,
  })
end

return Module
