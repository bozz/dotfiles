---------------------------------
-- Options
---------------------------------
local set = vim.opt

set.background = "dark"
set.clipboard = "unnamedplus"
set.completeopt = "noinsert,menuone,noselect"
set.cursorline = true
set.expandtab = true
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldmethod = "manual"
set.hidden = true
set.inccommand = "split"
set.mouse = "a"
set.number = true
set.relativenumber = true
set.shiftwidth = 2
set.smarttab = true
set.splitbelow = true
set.splitright = true
set.swapfile = false
set.tabstop = 2
set.termguicolors = true
set.title = true
set.ttimeoutlen = 0
set.updatetime = 250
set.wildmenu = true
set.wrap = false

-- map leaderkey
vim.g.mapleader = ","

-- add automatic syntax detection support for open files
vim.cmd([[
  filetype plugin indent on
  syntax on
]])

---------------------------------
-- Setup Plugins
---------------------------------

require("keymappings")
require("plugins")
