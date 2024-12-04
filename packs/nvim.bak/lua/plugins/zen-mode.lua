return {
  {
    -- see: https://github.com/folke/zen-mode.nvim
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        options = {
          relativenumber = false,
        },
      },
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = true, font = "+2" },
      },
      -- callback where you can add custom code when the Zen window opens
      on_open = function(win)
        vim.cmd("Pencil")
      end,
      -- callback where you can add custom code when the Zen window closes
      on_close = function()
        vim.cmd("PencilToggle")
      end,
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
}
