-- "gc" to comment visual regions/lines
return {
  'numToStr/Comment.nvim',
  opts = {},
  config = function()
    require('Comment').setup()
  end,
}
