return {
'preservim/tagbar',
config = function()

vim.cmd[[
" outline 
nmap <leader>lo :TagbarOpenAutoClose<CR>
]]
end
}
