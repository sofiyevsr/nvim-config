require("neodev").setup(
  { library = { plugins = { "nvim-dap-ui" }, types = true } }
)
require("mason").setup()
require("mason-lspconfig").setup()

local function on_attach(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  local set = vim.keymap.set
  set("n", "<C-p>", function() vim.lsp.buf.format() end, opts)
  set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  set("n", "<leader>k", function() vim.lsp.buf.hover() end, opts)
  set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
  set("n", "<leader>q", function() vim.diagnostic.setloclist() end, opts)
  set("n", "]g", function() vim.diagnostic.goto_next() end, opts)
  set("n", "[g", function() vim.diagnostic.goto_prev({}) end, opts)
  set("n", "<leader>rr", function() vim.lsp.buf.references({}) end, opts)
  set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
end

local configs = require "lspconfig"
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Server setups
configs.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
configs.biome.setup { on_attach = on_attach, capabilities = capabilities }
configs.bashls.setup { on_attach = on_attach, capabilities = capabilities }
configs.cssls.setup { on_attach = on_attach, capabilities = capabilities }
configs.astro.setup { on_attach = on_attach, capabilities = capabilities }
configs.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = require('lspconfig.util').root_pattern('.git')
}
configs.dartls.setup { on_attach = on_attach, capabilities = capabilities }
configs.gopls.setup { on_attach = on_attach, capabilities = capabilities }
configs.prismals.setup { on_attach = on_attach, capabilities = capabilities }
configs.clangd.setup { on_attach = on_attach, capabilities = capabilities }
configs.svelte.setup { on_attach = on_attach, capabilities = capabilities }
configs.terraformls.setup { on_attach = on_attach, capabilities = capabilities }
-- configs.tailwindcss.setup { on_attach = on_attach, capabilities = capabilities }
