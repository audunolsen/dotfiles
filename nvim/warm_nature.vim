" DOTFILES SYMLINK [ .vim/colors/ ]

" Clear all predefined colors
highlight clear
if exists("syntax_on")
  syntax reset
endif

" Function for setting fg, bg and optional gui values ——————————————————————————

" Example call: GuiFor("Normal", "#000000", "#afafaf")
function! g:Style(group, ...)
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

let g:green  = "#B7E847"
let g:amber  = "#FFC245"
let g:red    = "#FA6E6A"
let g:blue   = "#96C9FF"
let g:pink   = "#FF66AA"
let g:purple = "#A06DF5"
let g:gray   = "#939DB5"
let g:white  = "#FFFFFF"
let g:black  = "#000000"

let grayHack = "#929bb5"

" Misc/universal gui elements ——————————————————————————————————————————————————

" ~CURSORLINE~
" call GuiFor("CursorLine", "NONE", red, "bold") FIX: APPLY TO GOYO ONLY
call Style("CursorLine", white, black, "bold")

" ~LINELENGTH~
call Style("OverLength", "NONE", red, "underline")
match OverLength /\%>80v.\+/

" ~GUTTER~
call Style("LineNr", "NONE", gray)
call Style("CursorLineNr", "NONE", white, "bold")

" ~VSPLITS~
hi VertSplit cterm=NONE gui=NONE
hi StatusLine cterm=NONE gui=NONE
hi StatusLineNC cterm=NONE gui=NONE
call Style("VertSplit", "NONE", gray)

" ~S-LINE~
call Style("leftPad", "NONE", gray)
call Style("pwd", "NONE", white, "bold")
call Style("file", "NONE", amber, "bold")
call Style("saveState", "NONE", blue)
call Style("separator", "NONE", gray)
call Style("linenum", "NONE", gray, "bold")
call Style("colnum", "NONE", gray, "bold")
call Style("line", "NONE", gray)
call Style("statuslinenc", "NONE", gray)
call Style("statusline", "NONE", grayHack)

" ~NERDTREE~
call Style("NERDTreeDir", "NONE", white, "bold")
call Style("NERDTreeOpenable", "NONE", blue)
call Style("NERDTreeClosable", "NONE", blue)
call Style("NERDTreeDirSlash", "NONE", blue, "bold")
call Style("NERDTreeCWD", "NONE", amber, "bold")
call Style("NERDTreeUp", "NONE", white, "bold")

" ~BUFFER~
" call Style("String", "NONE", green, "italic")
call Style("MatchParen", black, white, "bold")


" ~THE MOST GENEREIC SYNTAX GROUPS~ ············································

call Style("Comment", "NONE", gray, "italic")
call Style("Normal", "NONE", white)
call Style("String", "NONE", green)
call Style("Boolean", "NONE", purple, "italic")
call Style("Constant", "NONE", amber)
call Style("Character", "NONE", green)
call Style("Number", "NONE", pink, "bold")
call Style("Statement", "NONE", red, "bold")
call Style("Identifier", "NONE", blue, "NONE")
call Style("Special", "NONE", blue, "NONE")

call Style("Float", "NONE", pink, "bold")

call Style("Define", "NONE", amber)
call Style("Include", "NONE", pink, "italic")
call Style("Macro", "NONE", amber)
call Style("PreCondit", "NONE", amber)

call Style("Conditional", "NONE", red, "bold")
call Style("Exception", "NONE", amber)
call Style("HelpCommand", "NONE", amber)
call Style("HelpExample", "NONE", amber)
call Style("Keyword", "NONE", amber, "bold")
call Style("Label", "NONE", amber, "italic")
call Style("Operator", "NONE", blue, "bold")
call Style("Repeat", "NONE", red, "bold")

call Style("StorageClass", "NONE", red, "bold")
call Style("Structure", "NONE", amber, "italic")
call Style("Typedef", "NONE", amber)
call Style("Type", "NONE", purple, "italic")
call Style("PreProc", "NONE", red, "none")

call Style("Debug", "NONE", amber)
call Style("Delimiter", "NONE", white, "bold")
call Style("SpecialChar", "NONE", blue)
call Style("SpecialComment", "NONE", amber)
call Style("Tag", "NONE", amber)



" ~HTML~ ·······································································

" call Style("htmlH", "NONE", "amber", "none")
" call Style("markdownH2", "NONE", "amber", "none")

" ~JAVASCRIPT~ ·································································
" call Style("jsFuncCall", "NONE", blue)
" call Style("jsReturn", "NONE", pink, "bold")
" call Style("jsGlobalObjects", "NONE", amber, "bold")
" call Style("jsFuncName", "NONE", blue)
" call Style("jsFunction", "NONE", pink, "bold")
" call Style("jsAsyncKeyword", "NONE", amber, "bold")
" call Style("jsArrowFunction", "NONE", pink, "bold")
" call Style("jsForAwait", "NONE", amber, "bold")
" call Style("jsStorageClass", "NONE", red, "bold")
" call Style("jsTemplateBraces", "NONE", red, "bold")
" call Style("jsNumber", "NONE", amber)
" call Style("jsGlobalNodeObjects", "NONE", red)
" call Style("jsSpecial", "NONE", blue)
" 
" call Style("jsOperator", "NONE", blue, "bold")
" call Style("jsOperatorKeyword", "NONE", blue, "bold")
" call Style("jsTaggedTemplate", "NONE", blue, "bold")
" call Style("jsObjectColon", "NONE", blue, "bold")
" call Style("jsDot", "NONE", blue, "bold")
" call Style("jsSpreadOperator", "NONE", blue, "bold")
