---@type MappingsTable
local M = {}

-- jump to matching pairs easily, with tab
-- nnoremap <Tab> %
-- vnoremap <Tab> %
-- map("n", "<Tab>", "%")
-- map("v", "<Tab>", "%")
M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["ö"] = { "/", "search", opts = { nowait = true } },
    ["<leader><space>"] = { ":nohls<CR>", "clear search highlights", opts = { nowait = true } },
    ["<C-h>"] = { "<C-w>h", "window nav", opts = { nowait = true } },
    ["<C-j>"] = { "<C-w>j", "window nav", opts = { nowait = true } },
    ["<C-k>"] = { "<C-w>k", "window nav", opts = { nowait = true } },
    ["<C-l>"] = { "<C-w>l", "window nav", opts = { nowait = true } },
    ["<leader>n"] = { ":NvimTreeToggle<CR>", "toggle nvim tree", opts = { nowait = true } },

    ["gb"] = { "<C-^>", "go to previous buffer", opts = { nowait = true } },

    ["<Tab>"] = { "%", "jump to matching pair", opts = { nowait = true } },

    ["ä"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },
  i = {
    ["jj"] = { "<ESC>", "exit insert mode", opts = { nowait = true } },
    ["<C-ö>"] = {
      'copilot#Accept("<CR>")',
      "accept copilot completion",
      opts = { silent = true, expr = true, replace_keycodes = false },
    },
    ["<C-+>"] = {
      "<Plug>(copilot-next)",
      "copilot next suggestion",
    },
    ["<C-ü>"] = {
      "<Plug>(copilot-previous)",
      "copilot prvious suggestion",
    },
  },
  v = {
    ["<Tab>"] = { "%", "jump to matching pair", opts = { nowait = true } },
    ["ä"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

-- more keybinds!

return M
