{ pkgs }:
with pkgs.vimPlugins; [
  nvim-lspconfig
  telescope-nvim
  telescope-recent-files
  tokyonight-nvim
  nvim-cmp
  luasnip
  cmp-path
  cmp_luasnip
  cmp-buffer
  cmp_luasnip
  cmp-nvim-lsp
  ultisnips
  nvim-treesitter
  which-key-nvim
  lazydev-nvim
]
