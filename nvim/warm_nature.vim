" DOTFILES SYMLINK [ .vim/colors/ ]

" Clear all predefined colors
highlight clear
if exists("syntax_on")
  syntax reset
endif

" Allow italics
" set t_ZH=^[[3m
" set t_ZR=^[[23m

" Function for setting fg, bg and optional gui values ——————————————————————————

" Example call: GuiFor("Normal", "#000000", "#afafaf")
function! g:GuiFor(group, ...)
  let histring = 'hi ' . a:group . ' '

  if strlen(a:1)
    let histring .= 'guibg=' . a:1 . ' '
  endif

  if strlen(a:2)
    let histring .= 'guifg=' . a:2 . ' '
  endif

  if a:0 >= 3 && strlen(a:3)
    let histring .= 'gui=' . a:3 . ' '
  endif

  execute histring
endfunction

" Color variables ——————————————————————————————————————————————————————————————

let g:green = "#B7E847"
let g:amber = "#FFC245"
let g:red   = "#FA6E6A"
let g:blue  = "#96C9FF"
let g:pink  = "#E851C0"
let g:gray  = "#939DB5"
let g:white = "#FFFFFF"
let g:black = "#000000"

let grayHack = "#929bb5"

" Misc/universal gui elements ——————————————————————————————————————————————————

" ~CURSORLINE~
" call GuiFor("CursorLine", "NONE", red, "bold") FIX: APPLY TO GOYO ONLY
call GuiFor("CursorLine", white, black, "bold")

" ~LINELENGTH~
call GuiFor("OverLength", "NONE", red, "underline")
match OverLength /\%>80v.\+/

" ~GUTTER~
call GuiFor("LineNr", "NONE", gray)
call GuiFor("CursorLineNr", "NONE", white, "bold")

" ~VSPLITS~
hi VertSplit cterm=NONE gui=NONE
hi StatusLine cterm=NONE gui=NONE
hi StatusLineNC cterm=NONE gui=NONE
call GuiFor("VertSplit", "NONE", gray)

" ~S-LINE~
call GuiFor("leftPad", "NONE", gray)
call GuiFor("pwd", "NONE", white, "bold")
call GuiFor("file", "NONE", amber, "bold")
call GuiFor("separator", "NONE", gray)
call GuiFor("linenum", "NONE", gray, "bold")
call GuiFor("colnum", "NONE", gray, "bold")
call GuiFor("line", "NONE", gray)
call GuiFor("statuslinenc", "NONE", gray)
call GuiFor("statusline", "NONE", grayHack)

" ~NERDTREE~
call GuiFor("NERDTreeDir", "NONE", white, "bold")
call GuiFor("NERDTreeOpenable", "NONE", blue)
call GuiFor("NERDTreeClosable", "NONE", blue)
call GuiFor("NERDTreeDirSlash", "NONE", blue, "bold")
call GuiFor("NERDTreeCWD", "NONE", amber, "bold")
call GuiFor("NERDTreeUp", "NONE", white, "bold")

" ~BUFFER~
call GuiFor("Normal", "NONE", "#FFFFFF")
call GuiFor("Comment", "NONE", gray, "italic")
call GuiFor("String", "NONE", green, "italic")
call GuiFor("MatchParen", white, black)

" highlight Comment cterm=italic

" ~JAVASCRIPT~
call GuiFor("jsFuncCall", "NONE", blue)
call GuiFor("jsReturn", "NONE", pink, "bold")
call GuiFor("jsGlobalObjects", "NONE", amber, "bold")
call GuiFor("jsFuncName", "NONE", blue)
call GuiFor("jsFunction", "NONE", pink, "bold")
call GuiFor("jsAsyncKeyword", "NONE", amber, "bold")
call GuiFor("jsArrowFunction", "NONE", pink, "bold")
call GuiFor("jsForAwait", "NONE", amber, "bold")
call GuiFor("jsStorageClass", "NONE", red, "bold")
call GuiFor("jsTemplateBraces", "NONE", red, "bold")
call GuiFor("jsNumber", "NONE", amber)
call GuiFor("jsGlobalNodeObjects", "NONE", red)
call GuiFor("jsSpecial", "NONE", blue)

call GuiFor("jsOperator", "NONE", blue, "bold")
call GuiFor("jsOperatorKeyword", "NONE", blue, "bold")
call GuiFor("jsTaggedTemplate", "NONE", blue, "bold")
call GuiFor("jsObjectColon", "NONE", blue, "bold")
call GuiFor("jsDot", "NONE", blue, "bold")
call GuiFor("jsSpreadOperator", "NONE", blue, "bold")
