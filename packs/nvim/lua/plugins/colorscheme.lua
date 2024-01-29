return {
  -- add dracula
  { "dracula/vim", name = "dracula" },

  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
      colorscheme_bg = "dark",
    },
  },
}
