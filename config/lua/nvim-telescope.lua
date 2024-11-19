local opt = { noremap = true }
local telescope = require("telescope")
-- local js = require("sams_plugin")

vim.opt.completeopt = { "menu", "menuone", "noselect" }
telescope.setup({})
vim.api.nvim_set_keymap("n", "<leader><tab>", ":lua require('telescope.builtin').find_files()<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader><leader>", ":lua require('telescope').extensions.recent_files.pick()<CR>", opt)

local M = {
	print = function()
		print("hello world")
	end,
}

print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
print(vim.inspect(vim.api.nvim_list_runtime_paths()))
print(vim.inspect(vim.lsp.get_clients()))
print(vim.env.RUNTIME)

M.print()
return M
