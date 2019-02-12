"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Created  : 2012-09-22 14:30:00
"  Modified : 2019-02-12 23:23:22
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set nocompatible               " be iMproved
" 中文编码支持，同时支持GBK和UTF-8编码
set termencoding=utf-8
set encoding=utf-8 " the default encoding of vim 
" detect the current filetype whether is in following list one by one, if the answer is yes, then set fileencoding to the filetype
set fileencodings=utf-8,gb18030,utf-16,big5,cp936,ucs-bom,ucs-bom,unicode

set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)    
set colorcolumn=80     " max line length to 80
set history=256        " Number of things to remember in history.
set timeoutlen=250     " Time to wait after ESC (default causes an annoying delay)
set clipboard+=unnamed " Yanks go on clipboard instead.
set shiftround         " round indent to multiple of 'shiftwidth'
set cm=blowfish2
set modeline
set modelines=5                " default numbers of lines to read for modeline instructions
" 当文件在外部被修改，自动更新该文件
set autoread 
set autowrite
" 失去焦点后自动保存文件
autocmd FocusLost * :up
" 避免在操作中频繁出现“请按Enter或其他命令继续”
" 以及出现“更多”的提示而需要按空格键继续
set nomore
autocmd BufLeave,FocusLost silent! wall

set hlsearch                   " highlight search
set ignorecase                 " be case insensitive when searching
set smartcase                  " be case sensitive when input has a capital letter
set incsearch                  " show matches while typing

" Formatting 
set formatoptions+=o           " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r                      " Do not automatically insert a comment leader after an enter
set fo-=t                      " Do no auto-wrap text using textwidth (does not apply to comments)
set nowrap
set textwidth=0                " Don't wrap lines by default
" set linebreak off

set tabstop=4                  " tab size eql 2 spaces
set softtabstop=4
set shiftwidth=4               " default shift width for indents
set expandtab                  " replace tabs with ${tabstop} spaces
set smarttab                   

set backspace=indent
set backspace+=eol
set backspace+=start

" 高亮当前行
set cursorline
set cursorcolumn
set autoindent
set cindent
set indentkeys-=0#            " do not break indent on #
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case

" syntax on                      " enable syntax, 但是插件管理器已经默认开启syntax
set synmaxcol=250              " limit syntax highlighting to 128 columns

set mouse=a "enable mouse in GUI mode
set mousehide                 " Hide mouse after chars typed

set number                  " line numbers on
set showmatch                 " Show matching brackets.
set matchtime=5               " Bracket blinking.

set wildmode=longest,list     " At command line, complete longest common string, then list alternatives.

set novisualbell              " No blinking
set noerrorbells              " No noise.
set vb t_vb=                  " disable any beeps or flashes on error

" set laststatus=2              " always show status line.
" set shortmess=atI             " shortens messages
set showcmd                   " display an incomplete command in statusline
" set statusline=%<%f\          " custom statusline
" set stl+=[%{&ff}]             " show fileformat
" set stl+=%y%m%r%=
" set stl+=%-14.(%l,%c%V%)\ %P,%L


set foldenable                " Turn on folding
set foldmethod=marker         " Fold on the marker
set foldlevel=80             " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,tag    " what movements open folds
set foldopen+=percent,mark
set foldopen+=quickfix

set virtualedit=block

set splitbelow
set splitright

set list                      " display unprintable characters f12 - switches
set listchars=tab:\ ·,eol:¬
set listchars+=trail:·
set listchars+=extends:»,precedes:«
set invlist
map <silent> <F12> :set invlist<CR>

" 使注释倾斜斜体
hi Comment cterm=italic

" vim自带目录浏览器netrw, 功能没有NERDTree强大, 但是支持ssh和http
" use the previous window to open file
let g:netrw_browse_split = 4
let g:netrw_altv = 1
" absolute width of netrw window
let g:netrw_winsize = 20
" do not display info on the top of window
let g:netrw_banner = 0
" tree-view
let g:netrw_liststyle = 3
" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'


set nobackup
set nowritebackup
set noswapfile




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" keymap 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

"let maplocalleader = '	'      " Tab as a local leader

" resize the window
nmap w= :resize +3<CR>
nmap w- :resize -3<CR>
nmap w, :vertical resize +3<CR>
nmap w. :vertical resize -3<CR>

" Make Control-direction switch between windows (like C-W h, etc)
nmap <silent> wk <C-W><C-k>
nmap <silent> wj <C-W><C-j>
nmap <silent> wh <C-W><C-h>
nmap <silent> wl <C-W><C-l>
nmap <silent> wt <C-W><C-t>
nmap <silent> wb <C-W><C-b>
nmap <silent> wp <C-W><C-p>


map <C-A> ggVG$
map <C-X> "+x
" 选中状态下 Ctrl+c 复制 
map <C-c> "+y

"普通模式下,Ctrl+c,插入系统剪切板中的内容到光标之后
noremap <C-V> "+p
"选中模式下,Ctrl+c,插入系统剪切板中的内容到光标之前
vnoremap <C-V> "+P
"插入模式下,Ctrl+c,插入系统剪切板中的内容到光标之后
inoremap <C-V> <esc>"+pa
" copy to clipboard in vim of Bash On windows, WSL
if !has("clipboard") && executable("clip.exe")
    vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
    map <C-v> :r ~/.vimbuffer<CR>
endif
" copy filename
map <silent> <leader>. :let @+=expand('%:p').':'.line('.')<CR>
" copy path
map <silent> <leader>/ :let @+=expand('%:p:h')<CR>

" when pasting copy pasted text back to 
" buffer instead replacing with owerride
xnoremap p pgvy


nnoremap tn :e ~/Desktop/tmp.md<CR>


" open help in vertical split
autocmd BufWinEnter *.txt if &ft == 'help' | wincmd H | vertical resize 85 | nmap q :q<CR> | endif
noremap <leader>h :help <C-R>=expand("<cword>")<CR><CR>


function! Do_Update_Modified()
    let save_cursor = getcurpos()
    call cursor(1, 1) "把cursor定位到1行1列，便于search()从1行开始搜索
    let b:line_number = search('Modified\|lastmod','nw')
    if b:line_number < 8 && match(getline(b:line_number), 'lastmod:\ [0-9]\{4\}') >= 0
        let b:line_content = 'lastmod: '.strftime("%Y-%m-%d %T")
        call setline(b:line_number, b:line_content)
    elseif b:line_number < 8 && match(getline(b:line_number), 'Modified\ :\ [0-9]\{4\}') >= 0
        let b:line_content = substitute(getline(b:line_number),"[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9]",strftime("%Y-%m-%d %T"),"g") 
        call setline(b:line_number, b:line_content)
    endif
    call setpos('.', save_cursor)
endfunction
autocmd BufWritePre,FileWritePre * call Do_Update_Modified()

" 定义函数Do_Set_Title，自动插入文件头 
function! Do_Set_Title() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\################################################################################") 
        call append(line("."), "\# File     : ".expand("%")) 
        call append(line(".")+1, "\# Author   : tainzhi") 
        call append(line(".")+2, "\# Mail     : qfq61@qq.com") 
        call append(line(".")+3, "\# Created  : ".strftime("%Y-%m-%d %T")) 
        call append(line(".")+4, "\# Modified : ".strftime("%Y-%m-%d %T")) 
        call append(line(".")+5, "\################################################################################") 
        call append(line(".")+6, "\#!/bin/bash") 
        call append(line(".")+7, "") 
        call append(line(".")+8, "") 
        call cursor(line(".")+8, 1)
    elseif &filetype == 'text'
        call setline(1,"********************************************************************************") 
        call append(line("."), " > File     : ".expand("%")) 
        call append(line(".")+1, " > Author   : tainzhi") 
        call append(line(".")+2, " > Mail     : qfq61@qq.com") 
        call append(line(".")+3, " > Created  : ".strftime("%Y-%m-%d %T")) 
        call append(line(".")+4, " > Modified : ".strftime("%Y-%m-%d %T")) 
        call append(line(".")+5, "********************************************************************************") 
        call append(line(".")+6, "") 
        call append(line(".")+7, "") 
        call cursor(line(".")+7, 1)
    elseif &filetype == 'c'
        call setline(1,"/*******************************************************************************") 
        call append(line("."), "* File     : ".expand("%")) 
        call append(line(".")+1, "* Author   : tainzhi") 
        call append(line(".")+2, "* Mail     : qfq61@qq.com") 
        call append(line(".")+3, "* Created  : ".strftime("%Y-%m-%d %T")) 
        call append(line(".")+4, "* Modified : ".strftime("%Y-%m-%d %T")) 
        call append(line(".")+5, "*******************************************************************************/") 
        call append(line(".")+6, "") 
        call append(line(".")+7, "#include <stdio.h>") 
        call append(line(".")+8, "#include <string.h>") 
        call append(line(".")+9, "#include <stdlib.h>") 
        call append(line(".")+10, "") 
        call append(line(".")+11, "") 
        call append(line(".")+12, "") 
        call cursor(line(".")+12, 1)
    elseif &filetype == 'cpp' || &filetype == 'h' || &filetype == 'cc'
        call setline(1,"/*******************************************************************************") 
        call append(line("."), "* File     : ".expand("%")) 
        call append(line(".")+1, "* Author   : tainzhi") 
        call append(line(".")+2, "* Mail     : qfq61@qq.com") 
        call append(line(".")+3, "* Created  : ".strftime("%Y-%m-%d %T")) 
        call append(line(".")+4, "* Modified : ".strftime("%Y-%m-%d %T")) 
        call append(line(".")+5, "*******************************************************************************/") 
        call append(line(".")+6, "") 
        call append(line(".")+7, "#include <stdio.h>") 
        call append(line(".")+8, "#include <string.h>") 
        call append(line(".")+9, "#include <stdlib.h>") 
        call append(line(".")+10, "#include <iostream>") 
        call append(line(".")+11, "") 
        call append(line(".")+12, "using namespace std;") 
        call append(line(".")+13, "") 
        call append(line(".")+14, "") 
        call append(line(".")+15, "") 
        call cursor(line(".")+15, 1)
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python3#########################################################")
        call setline(2,"# -*- coding: utf-8 -*-########################################################")
        call append(line(".")+1, "# File        : ".expand("%")) 
        call append(line(".")+2, "# Author      : tainzhi") 
        call append(line(".")+3, "# Mail        : qfq61@qq.com") 
        call append(line(".")+4, "# Created     : ".strftime("%Y-%m-%d %T")) 
        call append(line(".")+5, "# Modified    : ".strftime("%Y-%m-%d %T")) 
        call append(line(".")+6, "# Description :") 
        call append(line(".")+7, "# #############################################################################/") 
        call append(line(".")+8, "") 
        call append(line(".")+9, "") 
        call append(line(".")+10, "") 
        call append(line(".")+11, "") 
        call append(line(".")+12, "") 
        call append(line(".")+13, "") 
        call cursor(line(".")+13, 1)
    endif
    "新建文件后，自动定位到文件末尾
    call cursor('$',0)
endfunc 
" 匹配任意文件
" ma     保存当前位置到'a'标记
" 'a     光标回到旧位置
" autocmd BufWritePre,FileWritePre * ma|call Do_File()|'a
autocmd BufNewFile *.sh,*.txt,*.[ch],*.cpp,*.cc,*.python,*.py exec ":call Do_Set_Title()" 




if has("win32")
    try
        source ~/vimfiles/vimrc.win
    catch
        " No Such file? No problem, just ignore it
    endtry
elseif has('mac')
    if has('gui_running')
        set macmeta
        set guifont=Andale\ Mono:h13
        set guioptions=M    " 不需要菜单栏和工具栏, 而且不source "$VIMRUNTIME/menu.vim"
                            " this flag must be added before :syntax and :filetype
    else
        set noantialias
        set fuoptions=maxvert,maxhorz ",background:#00AAaaaa
    endif
    echo "Todo: set my vim runpath"
else
    try
        source ~/.vim/vimrc.linux
    catch
        " No Such file? No problem, just ignore it
    endtry
endif




