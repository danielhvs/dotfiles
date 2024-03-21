return {
  'tpope/vim-fugitive',
  dependencies = {
    'tpope/vim-rhubarb',
    'shumphrey/fugitive-gitlab.vim'
  },
  config = function()
    vim.cmd [[
let g:fugitive_gitlab_domains = ['http://gitlab.sig-gis.com/']
nnoremap <leader>gc :G commit -v<CR>
nnoremap <leader>cva :G commit --amend -v<CR>
nnoremap <leader>cvc :G commit -v<CR>
nnoremap <leader>gG :G commit -m up<CR>
nnoremap <leader>cvc :G commit -v<CR>
nnoremap <leader>gp :G push<CR>
nnoremap <leader>gP yiW:G push --set-upstream origin <C-R>0
nmap <leader>gg :vertical topleft Git<CR><C-w>ogUW
nnoremap <leader>gf :G pull<CR>
nnoremap <leader>gl :Git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=iso<CR>
nnoremap <leader>g0 :0Gclog<CR>
nnoremap <leader>G :G status<CR>
nnoremap <leader>go :Git checkout %<CR>
nnoremap <leader>ga :Git add %<CR>
nnoremap <leader>gw :GBrowse<CR>
nnoremap <leader>gb :Git blame<CR>

" main thing!
nnoremap <leader>gs :G show --decorate<CR>
nnoremap <leader>gS :terminal git difftool HEAD^ HEAD<CR>
"delta
nnoremap <leader>gd :terminal git diff -- <cWORD><CR>
nnoremap <leader>gD :terminal git diff <cword>^ <cword><CR>
"difftastic
nnoremap <leader>gt :terminal git difftool -- <cWORD><CR>
nnoremap <leader>gT :terminal git difftool <cword>^ <cword><CR>

nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gC "yyiw:G cherry-pick <C-R>y<CR>
" WUT get file from other branch
nnoremap <leader>gW :G co main -- %
nnoremap <leader>gr "yyiw:G revert <C-R>y<CR>
nnoremap <leader>g! :G push --force-with-lease
nnoremap <leader>gu :G reset HEAD -- %<CR>
" nnoremap <leader>gm :G diff origin/master %<CR> see git-messenger
nnoremap <leader>gM :G diff origin/master<CR>
nnoremap <leader>gn :terminal git difftool origin/master -- %<CR>
nnoremap <leader>gN :terminal git difftool origin/master<CR>
" both
nnoremap <leader>gkb ?^<<<<CR>ddk/^=======<CR>ddk/^>>>>>>><CR>dd
" up
nnoremap <leader>gku ?^<<<<CR>"zddk/^=======<CR>"zd/^>>>>>>><CR>"zdd
" down
nnoremap <leader>gkd ?^<<<<CR>"zd/^=======<CR>"zdd/^>>>>>>><CR>"zdd
nnoremap <leader>gç :G rebase origin/master -i<CR>
nnoremap <leader>gÇ :G rebase -i
nnoremap <leader>gk/ ?^<<<<CR>j"uy/^=======<CR>:redir! > /tmp/u.clj \| silent echo @u \| redir END<CR>/^=======<CR>j"dy/^>>>>>>><CR>:redir! > /tmp/d.clj \| silent echo @d \| redir END<CR>:terminal difft /tmp/u.clj /tmp/d.clj<CR>
nnoremap <leader>gk? ?^<<<<CR>j"uy/^=======<CR>:redir! > /tmp/u.clj \| silent echo @u \| redir END<CR>/^=======<CR>j"dy/^>>>>>>><CR>:redir! > /tmp/d.clj \| silent echo @d \| redir END<CR>:!meld /tmp/u.clj /tmp/d.clj<CR><
]]
  end
}
