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
map <leader>gC "yyiw:G cherry-pick <C-R>y<CR>
map <leader>gr "yyiw:G revert <C-R>y<CR>
