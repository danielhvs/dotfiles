" git 
nnoremap <leader>alm :read ~/.gitmessage<CR>2j

" window
nnoremap <C-l> :set nocursorline<CR><C-w><C-l>:set cursorline<CR>
nnoremap <C-h> :set nocursorline<CR><C-w><C-h>:set cursorline<CR>
nnoremap <C-j> :set nocursorline<CR><C-w><C-j>:set cursorline<CR>
nnoremap <C-k> :set nocursorline<CR><C-w><C-k>:set cursorline<CR>

" disable ex mode
nnoremap Q !!sh<CR>
nnoremap gQ <Nop>

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
nnoremap <leader>D :%bd\|e#\|bd#<CR>
nmap <leader>d :bd<CR>
nmap <leader>! :bd!<CR>
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

" formats comeca com f
nmap <leader>fJ :%.!jq .<CR>
nmap <leader>fj vap:.!jq .<CR>
nmap <leader>fh :%!tidy --show-errors 0 -i -q 2>/dev/null<CR>

" moving lines
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv
" path autocomplete
inoremap <C-space> <C-x><C-f>

" 'escape':
" exemplo: deixar sempre no inicio o caracter a escapar inclusive colocando
" varios um do lado do outro
nmap <leader>fe xV:s/<C-R>"/\\<C-R>"/g<CR>
  
" source 
nmap <leader>sv :source $MYVIMRC<CR>

" barra
nnoremap <leader>- O------------------------------------------------------------<ESC>030lR  <ESC>ha

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
nnoremap <leader>P mmo<ESC>pdgg

" last edited position
nnoremap 'e '`

nnoremap <localleader>w bi
nnoremap <localleader>W ea
nnoremap <leader>O <c-w>_ \| <c-w>\|
nnoremap <leader>C <c-w>=

" send to file
vnoremap <leader>ff V:e 1<CR>:bd! %<CR>:'<,'>w! 1<CR>:e 1<CR>
nnoremap <leader>ff :e 1<CR>:bd! %<CR>:%w! 1<CR>:e 1<CR>
" normalize
nnoremap <leader>fn :%s/,/\r/ge<CR>:%!sort<CR>:%s/ $//ge<CR>:%s/^ //ge<CR>:%s/^$\n//ge<CR>
" trim ,
nnoremap <leader>fN :%s/[ ,]/\r/ge<CR>:%!sort<CR>:%s/ $//ge<CR>:%s/^ //ge<CR>:%s/^$\n//ge<CR>

nnoremap co :Git checkout
nnoremap c* *Ncgn
