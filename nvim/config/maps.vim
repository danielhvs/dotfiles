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
nnoremap <leader>ft mm:%s/\t/  /ge<CR>`m
vnoremap <leader>f, :s/,//ge<CR>
vnoremap <leader>f: :s/://ge<CR>
vnoremap <leader>f\ :s/\\//ge<CR>
vnoremap <leader>f<space> :s/ //ge<CR>
vnoremap <leader>f- :s/-/ /ge<CR>
nnoremap <leader>fs vap:!sql-formatter<CR>

" similar to format
nnoremap <leader>` mm{I```<ESC>O<ESC>}I```<ESC>o<ESC>`m

" format around
nmap <leader>, mmcsW``mf`
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
nnoremap <leader>fe "yvap: :!jet --from json --to edn -k<CR>
nnoremap <leader>fE "yvap: :!jet --from edn --to json<CR>

" source 
nmap <leader>sv :source $MYVIMRC<CR>

" section
nnoremap <leader>- {I-<ESC>mm"yx80"ypO<ESC>j}<ESC>80"ypo<ESC>'m030lR
nnoremap <leader>_ {O-<ESC>mm"yx80"ypO<ESC>j}<ESC>80"ypo<ESC>'m030lR

nmap <leader>cp :!cd ~/Downloads && ls -rt \|tail -n1\|xargs -d"\n" detox<CR>:!ls -tr ~/Downloads\|tail -n1\|xclip -selection clipboard<CR>:!cp -v ~/Downloads/<C-R>+ .<CR>

" integrate with other apps
" option: use the detox application to fix filenames
" /usr/bin/detox
nmap <leader>fw yiW:!xdg-open  <C-R>0 &<CR>
nmap <leader>fW :!xdg-open -n %<CR>:bd!<CR>

" format limit 80 chars
nmap <leader>fl :set textwidth=80<CR>gqas
nmap <leader>fL ma:set textwidth=80<CR>gggqG`a

" determine a file's MIME type
" $ mimetype photo.jpeg
" photo.jpeg: image/jpeg

" # choose the default application for this file
" $ mimeopen -d photo.jpeg
" Please choose an application

"     1) Feh (feh)
"     2) GNU Image Manipulation Program (gimp)
"     3) Pinta (pinta)

" use application #

" # open a file with its default application
" $ mimeopen -n photo.jpeg

nmap <leader>lE <cmd>lua require('diaglist').open_all_diagnostics()<cr>/error\|<cr>
nmap <leader>le <cmd>lua require('diaglist').open_buffer_diagnostics()<cr>/error\|<cr>

nnoremap <leader>Y :%y<CR>
nnoremap <leader>Pe :!tmux switch-client -t eco<CR>
nnoremap <leader>Pf :!tmux switch-client -t flex<CR>
nnoremap <leader>Pv :!tmux switch-client -t vpn<CR>

nnoremap <localleader>w bi
nnoremap <localleader>W ea

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
