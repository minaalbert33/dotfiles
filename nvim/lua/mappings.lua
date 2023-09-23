local map = vim.keymap.set

-- general mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "jk", "<ESC>")

-- nvimtree
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
--map("n", "<C-h>", "<cmd> NvimTreeFocus <CR>")
-- map("n",    )

-- telescope
map("n", "<leader>ff", "<cmd> Telescope find_files <CR>")
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>")

-- To Move through windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
-- bufferline, cycle buffers
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")
    
vim.api.nvim_set_keymap('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>', { noremap = true, silent = true })

-- comment.nvim
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end)

map("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
