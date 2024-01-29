-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- jump to matching pairs easily, with tab
-- nnoremap <Tab> %
-- vnoremap <Tab> %
-- map("n", "<Tab>", "%")
-- map("v", "<Tab>", "%")

vim.keymap.set("n", ";", ":", { desc = "enter command mode", nowait = true })
vim.keymap.set("n", "ö", "/", { desc = "local search", nowait = true })
vim.keymap.set("n", "<leader><space>", ":nohls<CR>", { desc = "clear search highlights", nowait = true })
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { nowait = true })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { nowait = true })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { nowait = true })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { nowait = true })
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "toggle nvim tree", nowait = true })
vim.keymap.set("n", "gb", "<C-^>", { desc = "go to previous buffer", nowait = true })
vim.keymap.set("n", "<Tab>", "%", { desc = "jump to matching pair", nowait = true })
vim.keymap.set("n", "ä", "gcc", { desc = "toggle line comment" })

vim.keymap.set("i", "jj", "<ESC>", { desc = "exit insert mode", nowait = true })
vim.keymap.set(
  "i",
  "<C-ö>",
  'copilot#Accept("<Tab>")',
  { desc = "accept copilot completion", silent = true, expr = true, replace_keycodes = false }
)
vim.keymap.set("i", "<C-+>", "<Plug>(copilot-next)", { desc = "copilot next suggestion" })
vim.keymap.set("i", "<C-ü>", "<Plug>(copilot-previous)", { desc = "copilot previous suggestion" })

vim.keymap.set("v", "<Tab>", "%", { desc = "jump to matching pair", nowait = true })
vim.keymap.set("v", "ä", "gc", { desc = "toggle comment" })
