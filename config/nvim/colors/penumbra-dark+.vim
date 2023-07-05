" Name:         Penumbra
" Description:  Template for Penumbra dark colorscheme
" Author:       Michael Bulat
" Maintainer:   Michael Bulat
" License:      MIT
" Last Updated: Tue Sep  6 15:58:52 2022

" Generated by Colortemplate v2.2.0

set background=dark

hi clear
let g:colors_name = 'penumbra'

hi! link Boolean Constant
hi! link Character Constant
hi! link Conditional Statement
hi! link CurSearch IncSearch
hi! link Debug Special
hi! link Define PreProc
hi! link Delimiter Special
hi! link Exception Statement
hi! link Float Constant
hi! link Function Identifier
hi! link Include PreProc
hi! link Keyword Statement
hi! link Label Statement
hi! link Macro PreProc
hi! link Number Constant
hi! link Operator Statement
hi! link PopupSelected PmenuSel
hi! link PreCondit PreProc
hi! link QuickFixLine Search
hi! link Repeat Statement
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link StorageClass Type
hi! link String Constant
hi! link Structure Type
hi! link Tag Special
hi! link Typedef Type
hi! link lCursor Cursor

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#24272b', '#df7f78', '#50b584', '#9ca748', '#61a3e6', '#d080b6', '#00b3c2', '#9e9e9e', '#3e4044', '#ce9042', '#50b584', '#9ca748', '#61a3e6', '#a48fe1', '#00b3c2', '#cecece']
endif
hi Normal guifg=#9e9e9e guibg=#24272b gui=NONE cterm=NONE
hi Terminal guifg=#9e9e9e guibg=#24272b gui=NONE cterm=NONE
hi ColorColumn guifg=fg guibg=#181b1f gui=NONE cterm=NONE
hi Conceal guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Cursor guifg=NONE guibg=#24272b gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#24272b gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#3e4044 gui=NONE cterm=NONE
hi CursorLineNr guifg=NONE guibg=#3e4044 gui=bold cterm=bold
hi DiffAdd guifg=#50b584 guibg=#24272b guisp=#50b584 gui=NONE cterm=NONE
hi DiffChange guifg=#9ca748 guibg=#24272b  guisp=#9ca748 gui=NONE cterm=NONE
hi DiffDelete guifg=#df7f78 guibg=#24272b gui=bold cterm=bold
hi DiffText guifg=#61a3e6 guibg=#24272b guisp=#61a3e6 gui=NONE cterm=NONE
hi Directory guifg=#61a3e6 guibg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ErrorMsg guifg=#df7f78 guibg=#24272b gui=reverse cterm=reverse
hi FoldColumn guifg=#9e9e9e guibg=#24272b gui=NONE cterm=NONE
hi Folded guifg=#9e9e9e guibg=#3e4044 gui=italic cterm=italic
hi IncSearch guifg=#50b584 guibg=#24272b gui=standout cterm=reverse
hi LineNr guifg=#636363 guibg=#24272b gui=NONE cterm=NONE
hi MatchParen guifg=#fff7ed guibg=#24272b gui=NONE cterm=NONE
hi ModeMsg guifg=#61a3e6 guibg=NONE gui=NONE cterm=NONE
hi MoreMsg guifg=#61a3e6 guibg=NONE gui=NONE cterm=NONE
hi NonText guifg=#ce9042 guibg=NONE gui=NONE cterm=NONE
hi Pmenu guifg=#9e9e9e guibg=#24272b gui=NONE cterm=NONE
hi PmenuSbar guifg=#9e9e9e guibg=#24272b gui=NONE cterm=NONE
hi PmenuSel guifg=#9e9e9e guibg=#fff7ed gui=reverse cterm=reverse
hi PmenuThumb guifg=#9e9e9e guibg=#3e4044 gui=NONE cterm=NONE
hi Question guifg=#00b3c2 guibg=NONE gui=NONE cterm=NONE
hi Search guifg=#9ca748 guibg=NONE gui=reverse cterm=reverse
hi SignColumn guifg=#9e9e9e guibg=#24272b gui=NONE cterm=NONE
hi SpecialKey guifg=#50b584 guibg=#3e4044 gui=NONE cterm=NONE
hi SpellBad guifg=#df7f78 guibg=NONE guisp=#df7f78 gui=reverse,undercurl cterm=reverse,underline
hi SpellCap guifg=#a48fe1 guibg=NONE guisp=#ce9042 gui=reverse,undercurl cterm=reverse,underline
hi SpellLocal guifg=#9ca748 guibg=NONE guisp=#9ca748 gui=reverse,undercurl cterm=reverse,underline
hi SpellRare guifg=#00b3c2 guibg=NONE guisp=#00b3c2 gui=reverse,undercurl cterm=reverse,underline
hi StatusLine guifg=#9e9e9e guibg=#24272b gui=reverse cterm=reverse
hi StatusLineNC guifg=#9e9e9e guibg=#fff7ed gui=reverse cterm=reverse
hi TabLine guifg=#9e9e9e guibg=#24272b gui=reverse cterm=reverse
hi TabLineFill guifg=#9e9e9e guibg=#24272b gui=NONE cterm=NONE
hi TabLineSel guifg=#61a3e6 guibg=#24272b gui=reverse cterm=reverse
hi Title guifg=#ce9042 guibg=NONE gui=bold cterm=bold
hi VertSplit guifg=#9e9e9e guibg=#24272b gui=NONE cterm=NONE
hi Visual guifg=#9e9e9e guibg=#24272b gui=reverse cterm=reverse
hi VisualNOS guifg=NONE guibg=#24272b gui=reverse cterm=reverse
hi WarningMsg guifg=#ce9042 guibg=#24272b gui=NONE cterm=NONE
hi WildMenu guifg=#fff7ed guibg=#24272b gui=reverse cterm=reverse
hi Comment guifg=#636363 guibg=NONE gui=italic cterm=italic
hi Constant guifg=#00b3c2 guibg=NONE gui=NONE cterm=NONE
hi Error guifg=#df7f78 guibg=#24272b gui=reverse cterm=reverse
hi Identifier guifg=#61a3e6 guibg=NONE gui=NONE cterm=NONE
hi Ignore guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi PreProc guifg=#df7f78 guibg=NONE gui=NONE cterm=NONE
hi Special guifg=#50b584 guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#9ca748 guibg=NONE gui=NONE cterm=NONE
hi Todo guifg=#d080b6 guibg=NONE gui=bold cterm=bold
hi Type guifg=#ce9042 guibg=NONE gui=NONE cterm=NONE
hi Underlined guifg=#a48fe1 guibg=NONE gui=NONE cterm=NONE
hi CursorIM guifg=#24272b guibg=fg gui=NONE cterm=NONE
hi ToolbarLine guifg=NONE guibg=#24272b gui=NONE cterm=NONE
hi ToolbarButton guifg=#9e9e9e guibg=#24272b gui=bold cterm=bold

hi DiagnosticError guifg=#df7f78
hi DiagnosticWarn  guifg=#ce9042
hi DiagnosticInfo  guifg=#61a3e6
hi DiagnosticHint  guifg=#50b584

" Make rainbow same as VSCode
hi TSRainbowYellow guifg=#F9D749
hi TSRainbowViolet guifg=#CC76D1
hi TSRainbowBlue guifg=#4A9DF8

hi HarpoonInactive guibg=#181b1f guifg=#636363
hi HarpoonActive guibg=NONE guifg=#9e9e9e
hi HarpoonNumberActive guibg=NONE guifg=#fff7ed
hi HarpoonNumberInactive guibg=#181b1f guifg=#636363
hi TabLineFill guibg=#181b1f guifg=NONE

hi def NeogitDiffAddHighlight guibg=#3e4044 guifg=#9ca748
hi def NeogitDiffDeleteHighlight guibg=#3e4044 guifg=#dc322f
hi def NeogitDiffContextHighlight guibg=#3e4044 guifg=#9e9e9e
hi def NeogitHunkHeader guifg=#fff7ed guibg=#3e4044
hi def NeogitHunkHeaderHighlight guifg=#fff7ed guibg=#3e4044

" Background: dark
" Color: sunplus       rgb(255, 253, 251)        231         White
" Color: sun           rgb(255, 247, 237)        255         LightGray
" Color: sunminus      rgb(242, 230, 212)        254
" Color: skyplus       rgb(190, 190, 190)        250
" Color: sky           rgb(143, 143, 143)        246         DarkGray
" Color: skyminus      rgb( 99,  99,  99)        241
" Color: shadeplus     rgb( 62,  64,  68)        238
" Color: shade         rgb( 48,  51,  56)        236         Black
" Color: shademinus    rgb( 36,  39,  43)        235
" Color: red           rgb(202, 115, 108)        167         DarkRed
" Color: orange        rgb(186, 130,  58)        137         Brown
" Color: yellow        rgb(141, 151,  65)        100         DarkYellow
" Color: green         rgb( 71, 164, 119)        72          DarkGreen
" Color: cyan          rgb(  0, 162, 175)        37          DarkCyan
" Color: blue          rgb( 87, 148, 208)        67          DarkBlue
" Color: purple        rgb(148, 129, 204)        104         DarkMagenta
" Color: magenta       rgb(188, 115, 164)        169         LightMagenta
" Color: redplus       rgb(223, 127, 120)        174         Red
" Color: orangeplus    rgb(206, 144,  66)        172         Brown
" Color: yellowplus    rgb(156, 167,  72)        143         LightYellow
" Color: greenplus     rgb( 80, 181, 132)        72          LightGreen
" Color: cyanplus      rgb(  0, 179, 194)        37          LightCyan
" Color: blueplus      rgb( 97, 163, 230)        75          LightBlue
" Color: purpleplus    rgb(164, 143, 225)        140         LightMagenta
" Color: magentaplus   rgb(208, 128, 182)        175         LightMagenta
" Color: redplusplus     rgb(245, 140, 129)        210         Red
" Color: orangeplusplus  rgb(224, 159,  71)        215         Brown
" Color: yellowplusplus  rgb(169, 184,  82)        143         LightYellow
" Color: greenplusplus   rgb( 84, 199, 148)        79          LightGreen
" Color: cyanplusplus    rgb(  0, 196, 215)        80          LightCyan
" Color: blueplusplus    rgb(110, 178, 253)        75          LightBlue
" Color: purpleplusplus  rgb(182, 156, 246)        147         LightMagenta
" Color: magentaplusplus rgb(229, 140, 197)        175         LightMagenta
" Term colors: shade red green yellow blue magenta cyan sky
" Term colors: shadeplus orange greenplus yellowplus
" Term colors: blueplus purple cyanplus skyplus
" vim: et ts=2 sw=2
