return {
  'rhysd/git-messenger.vim',
  config = function()
    vim.cmd [[
" <leader>gm is the default mapping
let g:git_messenger_always_into_popup = v:true
let g:git_messenger_floating_win_opts = { 'border': 'single' }
" let g:git_messenger_include_diff = "current"
]]
  end
}
