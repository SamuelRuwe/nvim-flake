# vim: ft=lua
{ pkgs }:
''
local nvim_lsp = require("lspconfig")
nvim_lsp.ts_ls.setup({
  init_options = {
    ts_ls = {
      path = "${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib",
    },
  },
  
})
''
