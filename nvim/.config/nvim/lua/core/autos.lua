local cmd = vim.cmd

-- Auto save on various events
-- Alternatively can use CursorHold & CursorHoldI
--
cmd [[
  augroup auto_save
    autocmd!
    autocmd InsertLeave * call AutoSave()
    autocmd FocusLost * call AutoSave()
    autocmd BufLeave * call AutoSave()
    autocmd BufHidden * call AutoSave()
  augroup END

  function AutoSave()
    if (bufname() != "" && empty(&buftype) && &modified && &readonly == 0)
      silent write
    endif
  endfunction
]]

-- -- Remove color column marker for selected filetypes
cmd [[
    autocmd FileType text,markdown,html,xhtml,xml,yaml,toml,javascript,json setlocal cc=0
]]

-- 2 spaces for selected filetypes
cmd [[
      autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,json setlocal shiftwidth=2 tabstop=2 softtabstop=2
]]

-- Terminal visual tweaks:
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
cmd [[
  augroup empty_terminal
    autocmd!
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave * if &buftype == 'terminal' | stopinsert
  augroup END
]]

cmd [[
  augroup remove_whitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
  augroup END
]]
