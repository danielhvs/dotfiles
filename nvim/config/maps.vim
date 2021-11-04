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

" git 
map <leader>gc :vertical topleft Git commit -v<CR>
map <leader>gp :Git push<CR>
map <leader>gg :vertical topleft Git<CR>
map <leader>gf :G pull<CR>
map <leader>gt yiW:G tag <C-R>0
map <leader>gT :G push --tags<CR> 
map <leader>gl :Git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=iso<CR>
map <leader>g0 :0Gclog<CR>
map <leader>go :Git checkout %<CR>
map <leader>ga :Git add %<CR>
map <leader>gw :GBrowse<CR>:!i3-msg workspace number 2<CR>
map <leader>gb :Git blame<CR>
map <leader>gs :Git! show<CR>:wincmd w<CR>:wincmd o<CR>
map <leader>gS :Git! log --all -p -- %<CR>:wincmd w<CR>:wincmd o<CR>
map <leader>ge :Gedit<CR>

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

" java lsp
"  `code_action` is a superset of vim.lsp.buf.code_action and you'll be able to
"  use this mapping also with other language servers
nnoremap <leader>la <Cmd>lua require('jdtls').code_action()<CR>
vnoremap <leader>la <Esc><Cmd>lua require('jdtls').code_action(true)<CR>
nnoremap <leader>lm <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR> 
nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR> 
nnoremap <leader>ld <Cmd>lua vim.lsp.buf.declaration()<CR> 
nnoremap <leader>lt <cmd>lua vim.lsp.buf.type_definition()<CR> 
nnoremap <leader>lh <cmd>lua vim.lsp.buf.signature_help()<CR> 
nnoremap <leader>ln <cmd>lua vim.lsp.buf.rename()<CR> 
nnoremap <leader>le <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR> 
nnoremap <leader>lq <cmd>lua vim.lsp.diagnostic.set_loclist()<CR> 
nnoremap <leader>lf <cmd>lua vim.lsp.buf.formatting()<CR> 
nnoremap <leader>lj <cmd>lua vim.lsp.diagnostic.goto_next()<CR> 
nnoremap <leader>lk <cmd>lua vim.lsp.diagnostic.goto_prev()<CR> 
nnoremap <leader>lw :lua require('telescope.builtin').lsp_workspace_diagnostics()<CR> 
nnoremap <leader>lr :lua require('telescope.builtin').lsp_references()<CR> 
nnoremap <leader>lR :lua require('daniel').custom_lsp_java_references()<CR> 
nnoremap <leader>li :lua require('telescope.builtin').lsp_implementations()<CR> 
nnoremap <leader>lI :lua require('daniel').custom_lsp_implementations()<CR> 

" outline 
nmap <leader>lo :TagbarOpenAutoClose<CR>

" integracao com outros aplicativos
nmap <leader>fw yiW:!brave-browser <C-R>0 &<CR>
nmap <leader>fW :!brave-browser % &<CR>

" java
nnoremap <leader>jo ciWLOG.error("daniel: ");<esc>2hi
nnoremap <leader>jO ^y$oLOG.error("daniel: <esc>pa");<esc>
nnoremap <leader>jl mmyiwoSystem.out.println("daniel: <esc>pa");<esc>`m
nnoremap <leader>jL mmyiWoSystem.out.println("daniel: <esc>pa");<esc>`m

" 'escape':
" exemplo: deixar sempre no inicio o caracter a escapar inclusive colocando
" varios um do lado do outro
nmap <leader>fe xV:s/<C-R>"/\\<C-R>"/g<CR>

