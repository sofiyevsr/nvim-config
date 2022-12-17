local Utils = {}

local function getMapper(mode, noremap)
  local options = { noremap = noremap, silent = true }
  return function(lhs, rhs, opts)
    if opts then
      options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end

local function getKeymapper(mode)
  return function(key, fn)
    vim.keymap.set(mode, key, fn)
  end
end

Utils.map = getMapper("", false)
Utils.nmap = getMapper("n", false)
Utils.nnoremap = getMapper("n", true)
Utils.inoremap = getMapper("i", true)
Utils.tnoremap = getMapper("t", true)
Utils.vnoremap = getMapper("v", true)
Utils.nkeymap = getKeymapper("n")

return Utils
