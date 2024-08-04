local lsp_zero = require('lsp-zero')
local lua_opts = lsp_zero.nvim_lua_ls()

local lsp_format_on_save = function(bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = augroup,
    buffer = bubfnr,
    callback = function()
      vim.lsp.buf.format()
    end,
  })
end

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  lsp_zero.default_keymaps({ buffer = bufnr })
  lsp_format_on_save(bufnr)
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
require 'lspconfig'.lua_ls.setup(lua_opts)
require 'lspconfig'.pylsp.setup {}
require 'lspconfig'.rust_analyzer.setup {}
require 'lspconfig'.jsonnet_ls.setup {}

require 'lspconfig'.nixd.setup {}
-- --- @type { name: string, system: string, flakePath: string }
-- local sysinfo = require("sysinfo")
-- local flake_expr = "(builtins.getFlake \"" .. sysinfo.flakePath .. "\")"
--
-- require 'lspconfig'.nixd.setup {
--   capabilities = capabilities,
--   settings = {
--     nixd = {
--       nixpkgs = {
--         expr = "import" .. flake_expr .. "inputs.nixpkgs {}"
--       },
--       options = {
--         nixos = {
--           expr = flake_expr .. ".nixosConfigurations." .. sysinfo.name .. ".options"
--         },
--         home_manager = {
--           expr = flake_expr .. ".nixosConfigurations" .. sysinfo.name .. ".options.home-manager.users.value.sny"
--         },
--       },
--     }
--   }
-- }
