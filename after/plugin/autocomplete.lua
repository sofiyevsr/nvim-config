-- Set up nvim-cmp.
local cmp = require 'cmp'
local luasnip = require('luasnip')

-- Fix for duplication of snippet when switching from instert to normal
local unlinkgrp = vim.api.nvim_create_augroup(
  'UnlinkSnippetOnModeChange',
  { clear = true }
)

vim.api.nvim_create_autocmd('ModeChanged', {
  group = unlinkgrp,
  pattern = { 's:n', 'i:*' },
  desc = 'Forget the current snippet when leaving the insert mode',
  callback = function(evt)
    if
        luasnip.session
        and luasnip.session.current_nodes[evt.buf]
        and not luasnip.session.jump_active
    then
      luasnip.unlink_current()
    end
  end,
})
-- END of fix

-- required for vim-snippets
luasnip.filetype_extend("dart", { "flutter" })
-- loader for vim-snippets
require("luasnip.loaders.from_snipmate").lazy_load()

-- loader for vscode snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.scroll_docs( -4),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete({}),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  })
})
