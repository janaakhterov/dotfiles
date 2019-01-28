" The darkblue colorscheme

" Vim color file
" Maintainer:	Bohdan Vlasyuk <bohdan@vstu.edu.ua>
" Last Change:	2008 Jul 18

" darkblue -- for those who prefer dark background
" [note: looks bit uglier with come terminal palettes,
" but is fine on default linux console palette.] 
set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "bee"

hi Normal       ctermfg=white ctermbg=black guifg=white guibg=black
hi ErrorMsg	    ctermfg=white ctermbg=red guifg=white guibg=red
hi Visual       ctermfg=white ctermbg=black cterm=reverse guifg=lightblue guibg=fg gui=reverse 
hi VisualNOS    ctermfg=lightblue ctermbg=fg cterm=reverse guifg=lightblue guibg=fg gui=reverse 
hi Todo	        ctermfg=red	ctermbg=darkblue guifg=red guibg=darkblue
hi Search       ctermfg=white ctermbg=darkblue guifg=white guibg=darkblue
hi IncSearch    ctermfg=darkblue ctermbg=gray guifg=darkblue guibg=gray

hi SpecialKey   ctermfg=darkcyan guifg=darkcyan
hi Directory    ctermfg=cyan guifg=cyan
hi Title        ctermfg=magenta cterm=bold guifg=magenta gui=bold
hi WarningMsg   ctermfg=red guifg=red
hi WildMenu	    ctermfg=yellow ctermbg=black cterm=none term=none guifg=yellow guibg=black gui=none
hi ModeMsg      ctermfg=lightblue guifg=lightblue
hi MoreMsg      ctermfg=darkgreen	ctermfg=darkgreen guifg=darkgreen guifg=darkgreen
hi Question     ctermfg=green cterm=none guifg=green gui=none
hi NonText      ctermfg=darkblue guifg=darkblue

hi StatusLine   ctermfg=blue ctermbg=gray term=none cterm=none guifg=blue guibg=gray gui=none
hi StatusLineNC	ctermfg=black ctermbg=gray term=none cterm=none guifg=black guibg=gray gui=none
hi VertSplit    ctermfg=black ctermbg=gray term=none cterm=none guifg=black guibg=gray gui=none

hi Folded       ctermfg=darkgrey ctermbg=black cterm=bold term=bold guifg=darkgrey guibg=black gui=bold
hi FoldColumn   ctermfg=darkgrey ctermbg=black cterm=bold term=bold guifg=darkgrey guibg=black gui=bold
hi LineNr       ctermfg=green cterm=none guifg=green gui=none

hi DiffAdd      ctermbg=darkblue term=none cterm=none guibg=darkblue gui=none
hi DiffChange   ctermbg=magenta cterm=none guibg=magenta gui=none
hi DiffDelete   ctermfg=blue ctermbg=cyan guifg=blue guibg=cyan
hi DiffText	    cterm=bold ctermbg=red gui=bold guibg=red

hi Cursor       ctermfg=black ctermbg=white guifg=black guibg=white
hi lCursor      ctermfg=black ctermbg=white guifg=black guibg=white


hi Comment      ctermfg=darkred guifg=darkred
hi Constant	    ctermfg=magenta cterm=none guifg=magenta gui=none
hi Special	    ctermfg=brown cterm=none guifg=brown gui=none
hi Identifier	ctermfg=cyan cterm=none guifg=cyan gui=none
hi Statement	ctermfg=yellow cterm=none guifg=yellow gui=none
hi PreProc      ctermfg=magenta cterm=none guifg=magenta gui=none
hi type         ctermfg=green cterm=none guifg=green gui=none
hi Underlined   cterm=underline term=underline gui=underline
hi Ignore       ctermfg=bg guifg=bg
hi MatchParen   ctermfg=white ctermbg=black cterm=bold


" End of the darkblue colorscheme copy

" My colors
hi Normal       ctermbg=black guibg=black

" hi ColorColumn  ctermbg=233 guibg=233
hi CursorLine   term=none cterm=none cterm=none ctermbg=236 gui=none gui=none guibg=#333333

" Status Line
hi StatusLine   term=bold cterm=bold ctermfg=16 ctermbg=yellow gui=bold guifg=black guibg=yellow
hi StatusLineNC term=bold cterm=bold ctermfg=16 ctermbg=100 gui=bold guifg=black guibg=#999900
hi VertSplit    term=bold cterm=bold ctermfg=yellow ctermbg=yellow gui=bold guifg=yellow guibg=yellow

" Autocomplete menu colors
hi Pmenu        ctermfg=white ctermbg=black guifg=white guibg=black
hi PmenuSel     ctermfg=black ctermbg=white guifg=black guibg=white

" Term window color
hi StatusLineTerm   term=bold cterm=bold ctermbg=yellow ctermfg=16 gui=bold guifg=black guibg=yellow
hi StatusLineTermNC term=bold cterm=bold ctermbg=100 ctermfg=16 gui=bold guifg=black guibg=#999900

hi TabLine      term=none cterm=none ctermbg=100 ctermfg=black gui=none guibg=#999900 guifg=black
hi TabLineFill  term=none cterm=none ctermbg=100 gui=none guibg=#999900
hi TabLineSel   term=none cterm=none ctermbg=yellow ctermfg=black gui=none guibg=yellow guifg=black

hi Todo ctermbg=black guibg=black

hi Search term=bold cterm=bold ctermbg=white ctermfg=black gui=bold guibg=white guifg=black
hi IncSearch term=bold cterm=bold ctermbg=white ctermfg=black gui=bold guibg=white guifg=black

autocmd! BufEnter * syn match Braces '[{}()\[\]:;,!]'
hi Braces ctermfg=red
