require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Open terminal
vim.api.nvim_create_user_command("T", "split | res 5 | terminal <args>", { nargs = "*" })

-- Tabbar mappings
-- Move to previous/next
map("n", "<A-.>", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })

map("n", "<A-,>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })

map("n", "<A-c>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer Close" })

map("n", "<A-a>", function()
  require("nvchad.tabufline").closeOtherBufs()
end, { desc = "Other Buffers Close" })
-- END Tabbar mappings

-- Tree
map("n", "<C-b>", "<cmd>NvimTreeToggle<CR>")
-- Focus current file in nvim tree
map("n", "<leader>f", "<cmd>NvimTreeFindFile<CR>")
map("n", "<leader>F", "<cmd>NvimTreeFindFile!<CR>")

-- Insert line without insert mode
map("n", "<leader>O", "O<ESC>j", { desc = "Insert line up" })
map("n", "<leader>o", "O<ESC>k", { desc = "Insert line down" })
-- Mappings
-- Exit in terminal mode
map("t", "<C-d>", "<C-\\><C-n>")
-- Search word under cursor
map("n", "<C-d>", "*N")
-- Move current line down in all modes
map("n", "<A-j>", "<cmd>m .+1<CR>==")
map("n", "<A-k>", "<cmd>m .-2<CR>==")
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("n", "<leader>+", "<cmd>vertical resize +5<CR>")
map("n", "<leader>-", "<cmd>vertical resize -5<CR>")
map("n", "<C-p>", "<cmd>resize 100<CR>")
map("v", "<C-d>", '"hy:%s/<C-r>h//gc<left><left><left>')
-- Git mappings
map("n", "gdh", "<cmd>diffget //2<CR>")
map("n", "gdl", "<cmd>diffget //3<CR>")
-- search for selected text
map("v", "//", 'y/\\V<C-R>=escape(@",\"/\\\")<CR><CR>N')

-- COMPILE and RUN C++
-- without stdin
map("n", "<F8>", ":!g++ --std=c++20 %; ./a.out; rm a.out; <CR>")
-- with stdin
map("n", "<F9>", ":T g++ --std=c++20 %; time ./a.out; rm a.out; <CR>")
