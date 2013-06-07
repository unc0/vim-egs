" Vim syntax file
" Language:		egs
" Maintainer:		"UnCO" Lin <undercooled aT lavabit com>
" Mostly stolen from egs.vim

if !exists("g:egs_default_subtype")
  let g:egs_default_subtype = "html"
endif

if !exists("b:egs_subtype")
  let s:lines = getline(1)."\n".getline(2)."\n".getline(3)."\n".getline(4)."\n".getline(5)."\n".getline("$")
  let b:egs_subtype = matchstr(s:lines,'egs_subtype=\zs\w\+')
  if b:egs_subtype == ''
    let b:egs_subtype = matchstr(substitute(expand("%:t"),'\c\%(\.egs\)\+$','',''),'\.\zs\w\+$')
    echom b:egs_subtype
  endif
  if b:egs_subtype == 'md' || b:egs_subtype == 'mkd' || b:egs_subtype == 'markdown'
    let b:egs_subtype = 'markdown'
  elseif b:egs_subtype == 'xml'
    let b:egs_subtype = 'xml'
  elseif b:egs_subtype == 'yml'
    let b:egs_subtype = 'yaml'
  elseif b:egs_subtype == 'js'
    let b:egs_subtype = 'javascript'
  elseif b:egs_subtype == 'json'
    let b:egs_subtype = 'json'
  elseif b:egs_subtype == 'txt'
    " Conventional; not a real file type
    let b:egs_subtype = 'text'
  elseif b:egs_subtype == ''
    if exists('b:current_syntax') && b:current_syntax != ''
      let b:egs_subtype = b:current_syntax
    else
      let b:egs_subtype = g:egs_default_subtype
    endif
  endif
  echom b:egs_subtype
endif

if exists("b:egs_subtype") && b:egs_subtype != '' && b:egs_subtype != 'egs'
  exec "runtime! syntax/".b:egs_subtype.".vim"
  syn include @gorillaTop syntax/gorilla.vim
endif

syn cluster egsRegions contains=egsBlock,egsExpression,egsComment,egsLiterals

syn region egsBlock      matchgroup=egsDelimiter start=/<%/      end=/%>/   contains=@gorillaTop containedin=ALLBUT,@egsRegions keepend
syn region egsExpression matchgroup=egsDelimiter start=/<%=/     end=/%>/   contains=@gorillaTop containedin=ALLBUT,@egsRegions keepend
syn region egsComment    matchgroup=egsComment   start=/<%--/    end=/--%>/ contains=@gorillaTodo,@Spell containedin=ALLBUT,@egsRegions keepend
syn region egsLiterals    matchgroup=egsLiteral   start=/<%@/     end=/@%>/  contains=@Spell containedin=ALLBUT,@egsRegions keepend

" egs features not in gorillascript proper
syn keyword egsEnd end containedin=egsBlock
syn keyword egsKeyword block containedin=egsBlock

" Define the default highlighting.

hi def link egsDelimiter    Delimiter
hi def link egsComment      Comment
hi def link egsLiteral      SpecialChar
hi def link egsLiterals     String
hi def link egsEnd          gorillaConditional
hi def link egsKeyword      gorillaKeyword

let b:current_syntax = 'egs'

" vim: sw=2 sts=2 ts=8:
