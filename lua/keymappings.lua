local u = require("modules.utils")

-- Open terminal
vim.api.nvim_create_user_command('T', 'split | res 5 | terminal <args>', { nargs = "*" })

-- Tabbar mappings
-- Move to previous/next
u.nnoremap('<A-,>', '<Cmd>BufferPrevious<CR>')
u.nnoremap('<A-.>', '<Cmd>BufferNext<CR>')
-- Re-order to previous/next
u.nnoremap('<A-<>', '<Cmd>BufferMovePrevious<CR>')
u.nnoremap('<A->>', '<Cmd>BufferMoveNext<CR>')
-- Pin/unpin buffer
u.nnoremap('<A-p>', '<Cmd>BufferPin<CR>')
-- Close buffer
u.nnoremap('<A-c>', '<Cmd>BufferClose<CR>')
u.nnoremap('<A-a>', '<Cmd>BufferCloseAllButCurrent<CR>')
-- Magic buffer-picking mode
u.nnoremap('<A-s>', '<Cmd>BufferPick<CR>')
-- END Tabbar mappings

-- Tree
u.nnoremap('<C-b>', '<Cmd>NvimTreeToggle<CR>')
-- Focus current file in nvim tree
u.nnoremap('<leader>f', '<Cmd>NvimTreeFindFile<CR>')
u.nnoremap('<leader>F', '<Cmd>NvimTreeFindFile!<CR>')

-- Insert line without insert mode
u.nnoremap('<leader>O', 'O<ESC>j')
u.nnoremap('<leader>o', 'O<ESC>k')
-- Mappings
-- Exit in terminal mode
u.tnoremap('<C-d>', '<C-\\><C-n>')
-- Search word under cursor
u.nnoremap('<C-d>', '*N')
u.nnoremap('<C-s>', ':%s/')
-- Move current line down in all modes
u.nnoremap('<A-j>', '<Cmd>m .+1<CR>==')
u.nnoremap('<A-k>', '<Cmd>m .-2<CR>==')
u.inoremap('<A-j>', '<Esc>:m .+1<CR>==gi')
u.inoremap('<A-k>', '<Esc>:m .-2<CR>==gi')
-- Window mappings
u.nnoremap('<C-h>', '<Cmd>wincmd h<CR>')
u.nnoremap('<C-j>', '<Cmd>wincmd j<CR>')
u.nnoremap('<C-k>', '<Cmd>wincmd k<CR>')
u.nnoremap('<C-l>', '<Cmd>wincmd l<CR>')
u.nnoremap('<leader>+', '<Cmd>vertical resize +5<CR>')
u.nnoremap('<leader>-', '<Cmd>vertical resize -5<CR>')
u.nnoremap('<C-p>', '<Cmd>resize 100<CR>')
u.vnoremap('<C-d>', '"hy:%s/<C-r>h//gc<left><left><left>')
-- Git mappings
u.nnoremap('gdh', '<Cmd>diffget //2<CR>')
u.nnoremap('gdl', '<Cmd>diffget //3<CR>')
-- search for selected text
u.vnoremap('//', 'y/\\V<C-R>=escape(@",\'/\\\')<CR><CR>N')

-- lsp
u.nnoremap("<leader>ca", "<cmd>Lspsaga code_action<CR>")
u.nnoremap("<C-t>", "<cmd>PrettierAsync<CR>")

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
u.nkeymap("zR", require('ufo').openAllFolds)
u.nkeymap("zM", require('ufo').closeAllFolds)

-- COMPILE and RUN C++
-- without stdin
u.map('<F8>', ':!g++ --std=c++20 %; ./a.out; rm a.out; <CR>')
-- with stdin
u.map('<F9>', ':T g++ --std=c++20 %; time ./a.out; rm a.out; <CR>')
