map <leader>gc :vertical topleft Git commit -v<CR>
map <leader>gp :Git push<CR>
map <leader>gP yiW:Git push --set-upstream origin <C-R>0
map <leader>gg :vertical topleft Git<CR>
map <leader>gf :G pull<CR>
map <leader>gt yiW:G tag <C-R>0
map <leader>gT :G push --tags<CR> 
map <leader>gl :Git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=iso<CR>
map <leader>gL :Git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=iso
map <leader>g0 :0Gclog<CR>
map <leader>go :Git checkout %<CR>
map <leader>ga :Git add %<CR>
map <leader>gw :GBrowse<CR>:!i3-msg workspace number 3<CR>
map <leader>gb :Git blame<CR>
map <leader>gs :G show<CR>
map <leader>gS :Git! log --all -p -- %<CR>:wincmd w<CR>:wincmd o<CR>
map <leader>ge :Gedit<CR>
map <leader>gd "yyiw:G show <C-R>y<CR>
map <leader>gD "yyiw:G diff HEAD <C-R>y %<CR>
map <leader>gC "yyiw:G cherry-pick <C-R>y<CR>
" WUT get file from other branch
nnoremap <leader>gW :G co master -- %
map <leader>gr "yyiw:G revert <C-R>y<CR>
map <leader>g! :G push --force-with-lease
nnoremap <leader>g\| :e 2<CR>:diffthis<CR>:e 1<CR>:diffthis<CR>:vs 2<CR>
nnoremap <leader>gm :G diff master %<CR>
nnoremap <leader>gM :G diff master<CR>
" konflict
nnoremap <leader>gK :Gvdiffsplit!<CR> 
nnoremap <leader>gkh :diffget //2<CR>
nnoremap <leader>gkl :diffget //3<CR>
" both
nnoremap <leader>gkb ?^<<<<CR>ddk/^=======<CR>ddk/^>>>>>>><CR>dd
" up
nnoremap <leader>gku ?^<<<<CR>"zddk/^=======<CR>"zd/^>>>>>>><CR>"zdd
nnoremap <leader>gkd ?^<<<<CR>"zd/^=======<CR>"zdd/^>>>>>>><CR>"zdd
nnoremap <leader>gç :G rebase master -i<CR>
