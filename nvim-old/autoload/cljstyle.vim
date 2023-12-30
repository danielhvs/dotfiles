" This can also go in autoload/cljstyle.vim
function cljstyle#fix()
    let cwd = getcwd()
    let winsave = winsaveview()
    execute "cd" . expand('%:p:h')

    :%!cljstyle pipe

    execute "cd" . cwd
    call winrestview(winsave)
endfunction


