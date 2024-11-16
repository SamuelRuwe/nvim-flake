{ pkgs }:
with pkgs.vimPlugins; [
  nvim-lspconfig
  telescope-nvim
  telescope-recent-files
  tokyonight-nvim
  ultisnips
]
