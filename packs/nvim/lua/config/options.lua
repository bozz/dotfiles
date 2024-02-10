-- set leader key to comma
vim.g.mapleader = ","

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local set = vim.opt

-- line numbers
set.relativenumber = false
set.number = true

-- cursor line
set.cursorline = true -- highlight current line

-- conceallevel for markdown
set.conceallevel = 2

-- tabs & indentation
set.tabstop = 2 -- 2 spaces for tabs (prettier default)
set.shiftwidth = 2 -- 2 spaces for indent width
set.expandtab = true -- expand tab to spaces
set.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
set.wrap = false

-- search settings
set.ignorecase = true -- ignore case when searching
set.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
set.hlsearch = true -- highlight search

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
set.termguicolors = true
set.background = "dark" -- colorschemes that can be light or dark will be made dark
set.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
set.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- turn off swapfile
set.swapfile = false

set.spell = false

-- middle-click paste with
set.mouse = "nv"

-- yank to system clipboard
set.clipboard = "unnamedplus"
