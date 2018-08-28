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

hi Normal       ctermfg=gray ctermbg=black
hi ErrorMsg	    ctermfg=white ctermbg=lightblue
hi Visual       ctermfg=lightblue ctermbg=fg cterm=reverse
hi VisualNOS    ctermfg=lightblue ctermbg=fg cterm=reverse
hi Todo	        ctermfg=red	ctermbg=darkblue
hi Search       ctermfg=white ctermbg=darkblue
hi IncSearch    ctermfg=darkblue ctermbg=gray

hi SpecialKey   ctermfg=darkcyan
hi Directory    ctermfg=cyan
hi Title        ctermfg=magenta cterm=bold
hi WarningMsg   ctermfg=red
hi WildMenu	    ctermfg=yellow ctermbg=black cterm=none term=none
hi ModeMsg      ctermfg=lightblue
hi MoreMsg      ctermfg=darkgreen	ctermfg=darkgreen
hi Question     ctermfg=green cterm=none
hi NonText      ctermfg=darkblue

hi StatusLine   ctermfg=blue ctermbg=gray term=none cterm=none
hi StatusLineNC	ctermfg=black ctermbg=gray term=none cterm=none
hi VertSplit    ctermfg=black ctermbg=gray term=none cterm=none

hi Folded       ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi FoldColumn   ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi LineNr       ctermfg=green cterm=none

hi DiffAdd      ctermbg=darkblue term=none cterm=none
hi DiffChange   ctermbg=magenta cterm=none
hi DiffDelete   ctermfg=blue ctermbg=cyan
hi DiffText	    cterm=bold ctermbg=red

hi Cursor       ctermfg=black ctermbg=yellow
hi lCursor      ctermfg=black ctermbg=white


hi Comment      ctermfg=darkred
hi Constant	    ctermfg=magenta cterm=none
hi Special	    ctermfg=brown cterm=none
hi Identifier	ctermfg=cyan cterm=none
hi Statement	ctermfg=yellow cterm=none
hi PreProc      ctermfg=magenta cterm=none
hi type         ctermfg=green cterm=none
hi Underlined   cterm=underline term=underline
hi Ignore       ctermfg=bg


" End of the darkblue colorscheme copy

" My colors
hi Normal       ctermbg=16

" hi ColorColumn  ctermbg=233
hi CursorLine   term=none cterm=none cterm=none ctermbg=236

" Status Line
hi StatusLine   term=bold cterm=bold ctermfg=16 ctermbg=yellow
hi StatusLineNC term=bold cterm=bold ctermfg=16 ctermbg=100
hi VertSplit    term=bold cterm=bold ctermfg=yellow ctermbg=yellow

" Autocomplete menu colors
hi Pmenu        ctermfg=white ctermbg=16
hi PmenuSel     ctermfg=16 ctermbg=white

" Term window color
hi StatusLineTerm   term=bold cterm=bold ctermfg=16 ctermbg=yellow
hi StatusLineTermNC term=bold cterm=bold ctermfg=16 ctermbg=100

hi TabLine      term=none cterm=none ctermbg=100 ctermfg=16
hi TabLineFill  term=none cterm=none ctermbg=100
hi TabLineSel   term=none cterm=none ctermbg=yellow ctermfg=16

hi Todo ctermbg=16

hi Search term=bold cterm=bold ctermbg=15 ctermfg=16
hi IncSearch term=bold cterm=bold ctermbg=15 ctermfg=16
