" git 
nnoremap <leader>alm :read ~/.gitmessage<CR>2j

" window
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

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
nmap <leader>d :bd!<CR>
map <leader>q :q<CR>
nmap <leader>w :update<CR>
map <leader>x :x<CR>
map <leader>c :set list<CR>
map <leader>C :set nolist<CR>
" usar ]b do vim-unimpaired
noremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" terminal
tnoremap <Esc> <C-\><C-n>

" formats comeca com f
nmap <leader>fJ ggdG:r !jq '' %<CR><CR>
nmap <leader>fj y%:e /tmp/json.json<CR>p:w<CR>d%:r !jq '' %<CR>d%<C-O><C-O>gr%:bd! /tmp/json.json<CR>:!rm /tmp/json.json<CR><CR>
nmap <leader>fh :%!tidy --show-errors 0 -i -q 2>/dev/null<CR>

" terminal
nnoremap <leader>tt :lcd %:p:h<CR>:terminal<CR>A

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
nnoremap <leader>- S---------------------------------------------------------------------------------------------------<ESC>0

" integrate with other apps
" option: use the detox application to fix filenames
" /usr/bin/detox
nmap <leader>fw yiW:!mimeopen <C-R>0 &<CR>
nmap <leader>fW :!mimeopen -n %<CR>:bd!<CR>

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
