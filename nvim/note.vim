" ===================================================================
" ----[ .note vim config ]-------------------------------------------
" ===================================================================

" .config/nvim/after/syntax

" ----[ colour palette ]---------------------------------------------

let yeppurple   = '#5f4185'
let yepblue     = '#3d5c94'
let yepowhite   = '#dee2e8'
let yepred      = '#ff1457'
let yepdred     = '#1c0009'
let yepgreen    = '#54c59f'
let yeporange   = '#8f552f'

" ----[ comments ]---------------------------------------------------

syntax match NoteComment  "^#\+.*"      contains=@NoSpell
highlight def link NoteComment Comment

" ----[ tagged line ]------------------------------------------------

syntax match NoteTag      "^\s*\~\+.*"
highlight def link NoteTag Identifier

" ----[ todo ]-------------------------------------------------------

syntax match NoteTodo    "\v<(TODO|FIXME|NOTE):"
highlight def link NoteTodo Todo

" ----[ [-] task ]---------------------------------------------------

syntax match NoteTask     "^\s*\[-\].*$" contains=NoteTask,@NoSpell
execute 'highlight default NoteTask guifg=' . yepowhite . ' ctermfg=7'

" ----[ [+] task ]---------------------------------------------------

syntax match NoteTaskActive     "^\s*\[+\].*$" contains=NoteTaskNo,@NoSpell
execute 'highlight default NoteTaskActive guifg=' . yepyellow . ' ctermfg=7'

" ----[ [x] task ]---------------------------------------------------

syntax match NoteTaskNo     "^\s*\[x\].*$" contains=NoteTaskNo,@NoSpell
execute 'highlight default NoteTaskNo guifg=' . yepred . ' ctermfg=7'

" ----[ [✓] task - glyph from [y] ]----------------------------------

setlocal winhighlight+=Conceal:NoteTaskY
syntax match NoteTaskYes /\[\zsy\ze\]/ contained containedin=NoteLineYes conceal cchar=✓
syntax match NoteLineYes /^\s*\%(-\s\)\?\[y\].*$/ contains=NoteTaskYes,@NoSpell
execute 'highlight default NoteLineYes guifg=' . yepgreen . ' ctermfg=7'
execute 'highlight default NoteTaskY   guifg=' . yepgreen . ' ctermfg=7'

" ----[ [?] task ]---------------------------------------------------

syntax match NoteTaskMaybe     "^\s*\[?\].*$" contains=NoteTaskMaybe,@NoSpell
execute 'highlight default NoteTaskMaybe guifg=' . yeporange . ' ctermfg=7'

" ===================================================================
" ----[ end ]--------------------------------------------------------
" ===================================================================
