-- telescope default mapping: https://github.com/nvim-telescope/telescope.nvim#default-mappings
return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files Telescope" },
      -- { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "[S]earch [F]iles" },
      -- { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "[S]earch [H]elp" },
      -- { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "[S]earch current [W]ord" },
      -- { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "[S]earch by [G]rep" },
      -- { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "[S]earch [D]iagnostics" },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-s>"] = require("telescope.actions").send_selected_to_qflist,
            ["<M-q>"] = false,
          },
        },
      },
      pickers = {
        find_files = {
          -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          find_command = { "rg", "--files", "--glob", "!**/.git/*", "-L" },
        },
      },
    },
  },
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  {
    "nvim-telescope/telescope-symbols.nvim",
  },

  -- Custom ripgrep configuration:

  -- I want to search in hidden/dot files.
  -- "--hidden"
  --
  -- I don't want to search in the `.git` directory.
  -- "--glob")
  -- "!**/.git/*")
  --
  --  I want to follow symbolic links
  -- "-L"
  --
}
