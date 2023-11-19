if vim.fn.filereadable("Session.vim") == 1 and vim.fn.getcwd() == vim.fn.expand('%:p:h') then
  vim.cmd [[ source Session.vim ]]
end

if vim.fn.filereadable("Session.vim") == 1 then
  vim.cmd [[ autocmd VimLeave * mksession! Session.vim ]]
end





