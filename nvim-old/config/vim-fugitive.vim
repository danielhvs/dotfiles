map <leader>gc :vertical topleft Git commit -v<CR>
map <leader>gp :G push<CR>
map <leader>gP yiW:G push --set-upstream origin <C-R>0
map <leader>gg :vertical topleft Git<CR>
map <leader>gf :G pull<CR>
map <leader>gt :terminal git difftool -- %<CR>
map <leader>gT :terminal git difftool 
map <leader>gl :Git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=iso<CR>
map <leader>gL :Git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=iso
map <leader>g0 :0Gclog<CR>
map <leader>g) :!git co . && git status<CR>
map <leader>G :G status<CR>
map <leader>go :Git checkout %<CR>
map <leader>ga :Git add %<CR>
map <leader>gw :GBrowse<CR>:!i3-msg workspace number 3<CR>
map <leader>gb :Git blame<CR>
map <leader>gs :G show --decorate<CR>
map <leader>gS :terminal git difftool HEAD^ HEAD<CR>
map <leader>ge :Gedit<CR>
map <leader>gd "gyiw:G show <C-R>g<CR>
map <leader>gD "gyiw:terminal git difftool <C-R>g^ <C-R>g<CR>
map <leader>gC "yyiw:G cherry-pick <C-R>y<CR>
" WUT get file from other branch
nnoremap <leader>gW :G co master -- %
map <leader>gr "yyiw:G revert <C-R>y<CR>
map <leader>g! :G push --force-with-lease
map <leader>gu :G reset HEAD -- %<CR>
nnoremap <leader>g\| :e 2<CR>:diffthis<CR>:e 1<CR>:diffthis<CR>:vs 2<CR>
nnoremap <leader>gm :G diff origin/master %<CR>
nnoremap <leader>gM :G diff origin/master<CR>
nnoremap <leader>gn :terminal git difftool origin/master -- %<CR>
nnoremap <leader>gN :terminal git difftool origin/master<CR>
" konflict
nnoremap <leader>gkh :diffget //2<CR>
nnoremap <leader>gkl :diffget //3<CR>
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

nnoremap <leader>cva :G commit --amend -v<CR>
nnoremap <leader>cvc :G commit -v<CR>
nnoremap <leader>gG :G commit -m up<CR>
