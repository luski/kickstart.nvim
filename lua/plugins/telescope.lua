-- Fuzzy Finder (files, lsp, etc)
return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    'andrew-george/telescope-themes',
    'BurntSushi/ripgrep',
  },
  config = function()
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      extensions = {
        import = {
          -- Add imports to the top of the file keeping the cursor in place
          insert_at_top = true,
          -- Support additional languages
          custom_languages = {
            {
              -- The regex pattern for the import statement
              regex = [[^(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
              -- The Vim filetypes
              filetypes = { 'typescript', 'typescriptreact', 'javascript', 'react' },
              -- The filetypes that ripgrep supports (find these via `rg --type-list`)
              extensions = { 'js', 'ts' },
            },
          },
        },
      },
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    }

    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'import')
  end,
}
