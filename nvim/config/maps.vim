nnoremap <leader>alm :read ~/.gitmessage<CR>2j

" window
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>

" disable ex mode
nnoremap Q <Nop>
nnoremap gQ <Nop>

" custom default remapping
nnoremap '' ``
nnoremap z<CR> zt

" removendo setas
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" custom leader commands
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

nnoremap Y y$
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap J mzJ`z

" telescope
nnoremap <leader>tp :Telescope live_grep<CR>
nnoremap <leader>to :Telescope find_files<CR>
nnoremap <leader>tY y$:Telescope live_grep<CR><C-R>0<ESC>:s/)/\\)/g<CR>:s/(/\\(/g<CR><esc>
nnoremap <leader>tg yiw:Telescope live_grep<CR><C-R>0<ESC>:s/)/\\)/g<CR>:s/(/\\(/g<CR><esc>
nnoremap <leader>tG yiW:Telescope live_grep<CR><C-R>0<ESC>:s/)/\\)/g<CR>:s/(/\\(/g<CR><esc>
nnoremap <leader>tf yiw:Telescope find_files<CR><C-R>0<esc>
nnoremap <leader>tF yiW:Telescope find_files<CR><C-R>0<esc>
nnoremap <leader>tx :let @0=expand("%:t")<CR>:Telescope live_grep<CR><C-R>0<esc>
nnoremap <leader>tX :let @0=expand("%")<CR>:Telescope live_grep<CR><C-R>0<esc>
nnoremap <leader>tv yiw:Telescope live_grep<CR>id = "<C-R>0"<esc>
nnoremap <leader>ts b2l"aywbgeb~"cyiwu:buffer <C-R>c.java<CR>/ .*<C-R>a(<CR>zz
nnoremap <leader>te yiw:Telescope find_files<CR>entity/<C-R>0<esc>

" terminal
nnoremap <leader>tt :lcd %:p:h<CR>:terminal<CR>A

" mover linhas
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv
" autocompletar path
inoremap <C-space> <C-x><C-f>

" outline 
nmap <leader>lo :TagbarOpenAutoClose<CR>

" integracao com outros aplicativos
nmap <leader>fw yiW:!brave-browser <C-R>0 &<CR>
nmap <leader>fW :!brave-browser % &<CR>

" 'escape':
" exemplo: deixar sempre no inicio o caracter a escapar inclusive colocando
" varios um do lado do outro
nmap <leader>fe xV:s/<C-R>"/\\<C-R>"/g<CR>

