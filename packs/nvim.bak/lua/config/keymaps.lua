local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jj to exit insert mode
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

keymap.set("n", "ö", "/", { desc = "Local search", nowait = true })

keymap.set("n", "ä", "gcc", { desc = "Toggle line comment" })

-- clear search highlights
keymap.set("n", "<leader><space>", ":nohls<CR>", { desc = "Clear search highlights", nowait = true })

-- toggle quick-buffer-jump
keymap.set("n", "<leader>b", ":QuickBufferJump<CR>", { desc = "Toggle QuickBufferJump", nowait = true })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- keymap.set("n", "<C-h>", "<C-w>h", { nowait = true })
-- keymap.set("n", "<C-j>", "<C-w>j", { nowait = true })
-- keymap.set("n", "<C-k>", "<C-w>k", { nowait = true })
-- keymap.set("n", "<C-l>", "<C-w>l", { nowait = true })

--keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
--keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
--keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
--keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
--keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
