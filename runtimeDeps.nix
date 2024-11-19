{ pkgs }:
with pkgs; [
  lazygit
  fd
  lua-language-server
  ripgrep
  gcc
  luarocks
  stylua
  vimPlugins.telescope-nvim

  vimPlugins.nvim-lspconfig
  vimPlugins.telescope-nvim
  vimPlugins.telescope-recent-files
  vimPlugins.tokyonight-nvim
  vimPlugins.nvim-cmp
  vimPlugins.luasnip
  vimPlugins.cmp-path
  vimPlugins.cmp_luasnip
  vimPlugins.cmp-buffer
  vimPlugins.cmp_luasnip
  vimPlugins.cmp-nvim-lsp
  vimPlugins.ultisnips

  # packages with results in /lib/node_modules/.bin must come at the end
  nodePackages.typescript
  nodePackages.typescript-language-server
]
