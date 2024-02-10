-- MISC smaller plugins
return {
  -- lua functions that many plugins use
  "nvim-lua/plenary.nvim",

  -- tmux & split window navigation
  { "christoomey/vim-tmux-navigator", event = "VeryLazy" },

  -- improve the default vim.ui interface
  { "stevearc/dressing.nvim", event = "VeryLazy" },

  -- replace with register contents using motion (gr + motion)
  --"inkarkat/vim-ReplaceWithRegister",
}
