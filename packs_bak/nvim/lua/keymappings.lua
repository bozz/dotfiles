---------------------------------
-- Custom Keymappings
---------------------------------

-- util function for mapping keybinding (adds noremap to all mappins)
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- convenient esc
map("i", "jj", "<ESC>")

-- map search / to 'ö'
map("n", "ö", "/")

-- clear search highlights
map("n", "<leader><space>", ":nohls<CR>")

-- map capital W to lower case - I ofter accidentally tiggered capital W
-- command! W :w

-- go back to last buffer
map("n", "gb", "<C-^>")

-- easy window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- jump to matching pairs easily, with tab
-- nnoremap <Tab> %
-- vnoremap <Tab> %
map("n", "<Tab>", "%")
map("v", "<Tab>", "%")

-- reselect visual block after indent/outdent
-- vnoremap < <gv
-- vnoremap > >gv
