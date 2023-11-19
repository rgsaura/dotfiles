require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

if vim.fn.filereadable("Session.vim") == 1 and vim.fn.getcwd() == vim.fn.expand('%:p:h') then
  vim.cmd [[ source Session.vim ]]
end

if vim.fn.filereadable("Session.vim") == 0 and vim.fn.getcwd() == vim.fn.expand('%:p:h') then
  vim.cmd [[ autocmd VimLeave * mksession! Session.vim ]]
end
