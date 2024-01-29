-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local set = vim.opt

set.swapfile = false
set.wrap = false

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
