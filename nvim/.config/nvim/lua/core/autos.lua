local cmd = vim.cmd

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
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]]

cmd [[
  augroup remove_whitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
  augroup END
]]

