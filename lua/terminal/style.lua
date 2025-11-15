-- Apply your style preferences for terminal buffers
vim.cmd([[
  augroup TerminalStyle
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd TermOpen * setlocal signcolumn=no
    autocmd TermOpen * startinsert
  augroup END
]])

