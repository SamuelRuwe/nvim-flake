{ pkgs }:
with pkgs; [
  lazygit
  fd
  lua-language-server
  ripgrep
  gcc
  luarocks
  stylua

  # packages with results in /lib/node_modules/.bin must come at the end
  nodePackages.typescript
  nodePackages.typescript-language-server
]
