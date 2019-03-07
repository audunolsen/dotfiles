" =======
" M I S C
" =======

" Turn off line wrapping
set nowrap

" Turn off auto-insert comment on new line
augroup Format-Options
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=cro
augroup END

" ===========
" S P L I T S
" ===========

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright


" =============
" P L U G I N S
" =============

call plug#begin('~/.vim/plugged')

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'pangloss/vim-javascript'
Plug 'Quramy/vim-js-pretty-template'

Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-surround'

Plug 'TaDaa/vimade'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 
" Plug 'scrooloose/nerdtree'

call plug#end()

" =========
" F U Z Z Y
" =========

" FZF - Global config options:
" let g:fzf_layout = { 'down': '~40%' }

let src = 'find
    \ . -type f
    \ ! -path "**/node_modules/*"
    \ ! -path "**/.git/*"
    \ ! -name ".DS_Store"
    \ ! -name ".jpg"
    \ ! -name ".tif"
    \ ! -name ".gif"
    \ ! -name ".png"
    \ 2>/dev/null'

nnoremap <C-p> :w<CR> :call fzf#run({
    \ 'source': src,
    \ 'sink': 'e',
    \ 'down': '~40%'
    \ })<CR>

" :Find <term>
" 'Term' is a string which will recursively be
" searched for in all files in current dir
command! -bang -nargs=*
    \ Find call fzf#vim#grep(
    \ 'rg
    \ --column
    \ --line-number
    \ --no-heading
    \ --fixed-strings
    \ --ignore-case 
    \ --no-ignore
    \ --hidden
    \ --follow
    \ --glob "!.git/*"
    \ --color "always"
    \ '.shellescape(<q-args>), 1, <bang>0)

" Move highlight to color file
function! s:fzf_statusline()
  " Override statusline as you like
  " highlight fzf1 guifg=#FFF490 guibg=none gui=bold
  " highlight fzf2 guifg=none guibg=none
  " highlight fzf3 guifg=none guibg=none
  setlocal statusline=%#fzf1#—
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

let g:fzf_colors =
\ { 'fg':      ['fg', '#FFF490'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" ===============
" M A P P I N G S
" ===============

" Change map leader key to a comma
let mapleader = ","

" Clear search highlightning
nnoremap <Space><Space> :noh<cr>

" delete line & clear line
nnoremap -d dd
nnoremap -c ddO

" Nerdtree toggle. Opens NERDTree if nerdtree buffer doesn't exist, focuses
" nerdtree if already open, but not focused. Closes if already focused.
map <silent> <C-n> :call NerdToggleOrFocus()<CR>
function! NerdToggleOrFocus()
    let buf = strpart(bufname(''), 0, 10)
    if (exists("g:NERDTree") && g:NERDTree.IsOpen()) && buf == "NERD_tree_"
        NERDTreeToggle
        hi CursorLine guifg=#FF0000 guibg=NONE
        " Close - call function highliting curosorline in an 'INactive state'
    elseif (exists("g:NERDTree") && g:NERDTree.IsOpen())
        NERDTreeFocus
        hi CursorLine guifg=#000000 guibg=#FFFFFF
        " call function highliting curosorline in 'active state'
    else

        let inCwd = FileInCwd()
        if inCwd
            NERDTreeFind
        else
            NERDTreeToggle
        endif
        
        hi CursorLine guifg=#000000 guibg=#FFFFFF
        " Open - call function highliting curosorline in an 'active state'

    endif 
endfunc

" Get highlight group under cursor
nmap <leader>g :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Insert char at end/beginning of line, but keep caret pos. FIX: Beginning of
" line should perhaps be first char of line, not 0

nnoremap <silent> <leader>h :call InsertChar('start')<CR>
nnoremap <silent> <leader>l :call InsertChar('end')<CR>

nnoremap <silent> <leader><C-h> :call InsertChar('start', true)<CR>
nnoremap <silent> <leader><C-l> :call InsertChar('end', true)<CR>

function! InsertChar(key, ...)
    echo('Insert character at '
    \ . (a:key == 'start' ? 'beginning' : 'end') .' of file: ')
    let char = getchar()
    let pos  = getcurpos()[2]
    execute ':normal! ' . (a:key == 'start' ? 'I' : 'A') . nr2char(char)
    execute ':normal!' . pos . '|'
endfunc

" Kill buffer but keep split.
nnoremap <leader>d :bp\|bd #<CR>

function! DeleteBuffer()
    try
        :bp\|bd #<CR>
    catch
        echo "whats up nigga"
    endtry
endfunc

" ===========
" S - L I N E
" ===========

hi statuslinenc gui=none
hi statusline gui=none

function! SetStatusLinePath()
    return system('print -P %~')[:-2] . "/"
endfunction

function! SetStatusLineFile()
    return fnamemodify(expand("%:p"), ":~")[len(system('print -P %~')):]
endfunction

function! SetStatusLineSaveState()
    return l
endfunction

set statusline=%#leftPad#————\ 

set statusline+=%#pwd#%{SetStatusLinePath()}
set statusline+=%#file#%{SetStatusLineFile()}

set statusline+=%#separator# \|\ 
set statusline+=%#linenum#%l
set statusline+=·
set statusline+=%#colnum#%c

set statusline+=%#line#\ 

" =================
" F I L L C H A R S
" =================

set fcs=stl:—,stlnc:—,eob:\ 
set fillchars+=vert:⎸

" Relative line numbers – absolute current line
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave
    \ *.* if &modifiable | set relativenumber | endif
  autocmd BufLeave,FocusLost,InsertEnter
    \ *.* if &modifiable | set norelativenumber | endif
augroup END

" =======
" T A B S
" =======

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" ===========
" C O L O R S
" ===========

" support for true-color
set termguicolors

" load custome local theme
colorscheme warm_nature

" Enable Italics
set t_ZH=^[[3m
set t_ZR=^[[23m
highlight Comment gui=bold

" ===============
" N E R D T R E E
" ===============


let g:NERDTreeDirArrowExpandable = "" "
let g:NERDTreeDirArrowCollapsible = "" "
let g:NERDTreeStatusline = '—'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1

" autocmd BufEnter * :NERDTreeFind 
"function! SyncTree()
"  if &modifiable && rc:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"    NERDTreeFind
"    wincmd p
"  endif
"endfunction
augroup nerdLeave
    autocmd!
    autocmd BufEnter * call NerdCursorBlur()
augroup END

function! NerdCursorOff()
    hi cursorline guifg=none guibg=none gui=none
endfunc

function! NerdCursorBlur()

    if !&modifiable
        call NerdCursorOff()
        return
    endif

    let buf = strpart(bufname(''), 0, 10)

    if buf != "NERD_tree_"

        hi cursorline guifg=#ff0000 guibg=none gui=bold
        
        if exists("g:NERDTree") && g:NERDTree.IsOpen() 

            let win  = winnr()
            
            if FileInCwd() 
                NERDTreeFind
                exe win . "wincmd w"
            
            else | call NerdCursorOff()	

            endif

        endif
    endif

endfunction

function! FileInCwd()

    let cmd = "[ -e " . getcwd() . "/" . @% . " ] && echo 1 || echo 0"
    return str2nr(system(cmd))

endfunc

" ===========
" V I M A D E
" ===========

" let g:vimade = {}
" let g:vimade.fadelevel = 0.7
