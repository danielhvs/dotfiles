return {
  'ap/vim-buftabline',
  config = function()
    vim.cmd [[
let g:buftabline_numbers    = 0
let g:buftabline_indicators = 1
let g:buftabline_separators = 1
]]
  end
}
