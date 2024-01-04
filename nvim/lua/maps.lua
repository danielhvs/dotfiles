local map = vim.keymap.set

-- Deleting buffers
map("n", "<localleader>d", ":bd!<CR>")
map("n", "<leader>d", ":Bdelete this<CR>")
map("n", "<leader>D", ":Bdelete other<CR>")
map("n", "<localleader>t", ":e t<CR>")
map("n", "<localleader>m", ":e Makefile<CR>")
map("n", "<localleader>2", ":e ~/.m2/settings.xml<CR>")
map("n", "<leader>ss", ":Switch<CR>")
map("n", "<leader>e", ":Neotree toggle reveal=true<CR>")

vim.cmd [[
" bug? so me fix telescope has removed netrw gx?!
nmap gx :silent execute "!xdg-open " . shellescape("<cWORD>")<CR>
" bug? fix for vim-fugitive rhubarb :GBrowse
command! -nargs=1 Browse silent execute '!xdg-open' shellescape(<q-args>,1)
"
" git
nnoremap <leader>alm :read ~/.gitmessage<CR>2j

" window
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

" disable ex mode
nnoremap Q mm0"yy$:r! <C-R>y<CR>`m
vnoremap Q mm"yy:r! <C-R>y<CR>`m
nnoremap gQ mm0!!sh<CR>`m

" custom display
nnoremap '' ``
nnoremap z<CR> zt
nnoremap Y y$
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap J mzJ`z

" removendo setas
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" custom leader commands
map <leader>q :q<CR>
nmap <leader>w :update<CR>
map <leader>x :x<CR>
" removed in favor to vim-unimpaired ]ol
" usar ]b do vim-unimpaired
noremap <leader>cd :cd %:p:h<CR>:pwd<CR>
noremap <leader>cw :pwd<CR>
" copy realpath to clipboard
noremap <leader>cr :let @+ = expand("%:p")<CR>

" terminal
tnoremap <Esc> <C-\><C-n>

" formats starts with f
nmap <leader>fJ :%.!jq .<CR>
nmap <leader>fj vap:.!jq .<CR>
nmap <leader>fh :%!tidy --show-errors 0 -i -q 2>/dev/null<CR>
nnoremap <leader>f<space> mm:%s/\s\+$//e<CR>`m
nnoremap <leader>f<tab> mm:%s/\t/  /ge<CR>`m
" format file - to _
nnoremap <leader>ff V:s/-/_/g<CR>
vnoremap <leader>f, :s/,//ge<CR>
vnoremap <leader>fo :s/; (out) //ge<CR>
vnoremap <leader>f: :s/://ge<CR>
vnoremap <leader>f\ :s/\\//ge<CR>
nnoremap <leader>f\ vap:s/\\//ge<CR>
vnoremap <leader>f<space> :s/ //ge<CR>
vnoremap <leader>f- :s/-/ /ge<CR>
nnoremap <leader>fs vap:!sql-formatter<CR>
vnoremap <leader>fs :!sql-formatter<CR>
nnoremap <leader>ft vap:!prettier --parser=typescript --trailing-comma=es5 -w<CR>
nnoremap <leader>fT :!prettier --parser=typescript --trailing-comma=es5 -w %<CR>
nnoremap <leader>fo vap:s/; (out) //ge<CR>

" similar to format
nnoremap <leader>` mm{I```<ESC>O<ESC>}I```<ESC>o<ESC>`m

" format around
nmap <leader>, mmcsW``mf`
nmap <leader>" mmcsw"`mf"
nmap <leader>) mmcsw)<ESC>`m
nmap <leader>( mmcsW)<ESC>`m
nmap <leader>] mmcsw]<ESC>`m
nmap <leader>[ mmcsW]<ESC>`m
nmap <leader>} mmcsw}<ESC>`m
nmap <leader>} mmcsW}<ESC>`m

" moving lines
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv
" path autocomplete
inoremap <C-space> <C-x><C-f>

" from json to edn
nnoremap <leader>fe mm"yvap: :!jet --from json --to edn -k<CR>%o<ESC>`m
nnoremap <leader>fE mm"yvap: :!jet --from edn --to json<CR>%o<ESC>`m

" section
nnoremap <leader>- {I-<ESC>mm"yx80"ypO<ESC>j}<ESC>80"ypo<ESC>'m030lR
nnoremap <leader>_ {O-<ESC>mm"yx80"ypO<ESC>j}<ESC>80"ypo<ESC>'m030lR

nmap <leader>cp :!cd ~/Downloads && ls -rt \|tail -n1\|xargs -d"\n" detox<CR>:!ls -tr ~/Downloads\|tail -n1\|xclip -selection clipboard<CR>:!cp -v ~/Downloads/<C-R>+ .<CR>

" integrate with other apps
" option: use the detox application to fix filenames
" /usr/bin/detox
nmap <leader>fw yiW:!xdg-open  <C-R>0 &<CR>
nmap <leader>fW :!xdg-open -n %<CR>:bd!<CR>

nnoremap <leader>Y :%y<CR>
nnoremap <leader>Pe :!tmux switch-client -t eco<CR>
nnoremap <leader>Pf :!tmux switch-client -t flex<CR>
nnoremap <leader>Pv :!tmux switch-client -t vpn<CR>

" normalize
nnoremap <leader>fn :%s/,/\r/ge<CR>:%!sort<CR>:%s/ $//ge<CR>:%s/^ //ge<CR>:%s/^$\n//ge<CR>
" trim ,
nnoremap <leader>fN :%s/[ ,]/\r/ge<CR>:%!sort<CR>:%s/ $//ge<CR>:%s/^ //ge<CR>:%s/^$\n//ge<CR>

nnoremap co :Git checkout
nnoremap c* *Ncgn

" command direct to command mode just !
nnoremap ! "yyy:<C-R>y<CR>
nnoremap <leader>. :e #<CR>

nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

nnoremap <leader>rr "ryiw:%s/<C-r>r/<C-r>r
nnoremap <leader>rR "ryiw:%s/<C-r>r/
nnoremap <leader>c! "ryy:r !echo "scale=10; <C-r>r" \| bc<CR>

" leader c: change directory
nnoremap <leader>cc :cd ~/workspace-nvim/spring/eco-comum<CR>
nnoremap <leader>cb :cd ~/workspace-nvim/eco/eco-batch<CR>
nnoremap <leader>cs :cd ~/workspace-nvim/eco/eco-servico<CR>
nnoremap <leader>ct :cd ~/workspace-nvim/eco-ttt/eco-testes<CR>
nnoremap <leader>cT :cd ~/workspace-nvim/eco-ttt/eco-ws-testes<CR>
nnoremap <leader>ce :cd ~/workspace-nvim/spring<CR>
nnoremap <leader>cE :cd ~/workspace-nvim/eco<CR>
nnoremap <leader>ca :cd ~/workspace-nvim/spring/eco-api<CR>
nnoremap <leader>cg :cd ~/workspace-nvim/spring/eco-gestao-api<CR>
nnoremap <leader>cW :cd ~/workspace-nvim/eco/eco-ws<CR>
nnoremap <leader>cS :cd ~/workspace-nvim/eco/eco-inss-servico<CR>
nnoremap <leader>cz :cd ~/workspace-nvim/eco/eco-inss-ws<CR>
nnoremap <leader>ci :cd ~/workspace-nvim/eco/eco-sincronizacao<CR>
nnoremap <leader>cD :cd ~/workspace-nvim/dec/dec-service<CR>
nnoremap <leader>cN :cd ~/workspace-nvim/dec/dec-negocio<CR>


]]
