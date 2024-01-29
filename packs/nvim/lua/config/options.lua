-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local set = vim.opt

set.swapfile = false
set.wrap = false

-- disable netrw (for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = {
  ["*"] = false,
  ["javascript"] = true,
  ["typescript"] = true,
  ["lua"] = false,
  -- ["rust"] = true,
  -- ["c"] = true,
  -- ["c#"] = true,
  -- ["c++"] = true,
  -- ["go"] = true,
  -- ["python"] = true,
}

vim.g.mapleader = ","

-- vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
--   callback = function()
--     vim.t.bufs = vim.tbl_filter(function(bufnr)
--       return vim.api.nvim_buf_get_option(bufnr, "modified")
--     end, vim.t.bufs)
--   end,
-- })
