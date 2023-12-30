let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
nnoremap <expr> <leader>e g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
nnoremap <leader>E :NERDTree<CR>
let g:NERDTreeMapHelp            = ''
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeAutoDeleteBuffer = 1
