require 'nvim-treesitter.configs'.setup {
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    disable = function(_, bufnr)
      local buf_name = vim.api.nvim_buf_get_name(bufnr)
      local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
      return file_size > 256 * 1024
    end,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require('ufo').setup({
  provider_selector = function()
    return { 'treesitter', 'indent' }
  end
})
