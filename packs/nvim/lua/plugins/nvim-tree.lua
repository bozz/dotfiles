return {
  -- add nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    opts = {
      git = {
        enable = true,
      },

      actions = {
        open_file = {
          quit_on_open = true,
        },
      },

      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },
}
