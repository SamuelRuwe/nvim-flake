# vim: ft=lua
{ pkgs }:
''
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local capabilities = require("cmp_nvim_lsp").default_capabilities()

cmp.setup({
  snippet = {
    expand = function(args)
			require("luasnip").lsp_expand(args.body)
    end,
  },
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
	}, {
		{ name = "buffer", keyword_length = 5, max_item_count = 2, },
	}),
  experimental = {
    ghost_text = true,
  },
})

local lspconfig = require("lspconfig")
lspconfig.ts_ls.setup({
  capabilities = capabilities,
  init_options = {
    ts_ls = {
      path = "${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib",
    },
  },
})

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.RUNTIME,
          vim.fn.expand'~/workspace/nvimPlugins/telescope.nvim/lua'
        },
      }
    })
  end,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = {
        globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
      },
    },
  }
}
''
