require 'barbar'.setup {
  icons = {
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = { enabled = true },
      [vim.diagnostic.severity.WARN] = { enabled = false },
      [vim.diagnostic.severity.INFO] = { enabled = false },
      [vim.diagnostic.severity.HINT] = { enabled = true },
    },
    gitsigns = {
      added = { enabled = true, icon = '+' },
      changed = { enabled = true, icon = '~' },
      deleted = { enabled = true, icon = '-' },
    },
    filetype = {
      enabled = true,
    },
    inactive = { button = '×' },
  },
}
