local lsp_zero = require('lsp-zero')
local lua_opts = lsp_zero.nvim_lua_ls()

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- Нормальный вывод ошибок
vim.diagnostic.config({
	virtual_text = true,
	severoty_sort = true,
	float = {
		style  = 'minimal',
		border = 'rounded',
		source = 'always',
		header = '',
		prefix = '',
	},
})

-- here you can setup the language servers
--
require 'lspconfig'.clangd.setup {}
require 'lspconfig'.gopls.setup {}
require 'lspconfig'.lua_ls.setup {}
require 'lspconfig'.nushell.setup {}
require 'lspconfig'.nixd.setup {}
require 'lspconfig'.lua_ls.setup(lua_opts)
require 'lspconfig'.pylsp.setup {}
require 'lspconfig'.rust_analyzer.setup {}
