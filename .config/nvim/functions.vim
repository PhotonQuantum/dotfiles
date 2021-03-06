let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

function SemshiHl()
    hi semshiGlobal      ctermfg=125
    hi semshiLocal  ctermfg=135
    hi semshiImported   ctermfg=135
    hi semshiSelected   ctermbg=89
endfunction
