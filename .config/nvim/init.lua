require "options"
require "mappings"
require "commands"

-- bootstrap plugins & lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim" -- path where its going to be installed

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require "plugins"

require("onedark").load()
local terminal = require("nvterm.terminal")

function toggle_terminal(layout)
    terminal.toggle(layout)
end

-- Function to run current CPP file in a horizontal terminal
function run_cpp_file()
    local current_file = vim.fn.expand("%:p")  -- Get the full path of the current file
    local command = string.format("clear; g++ %s -o a.out && ./a.out; rm a.out", current_file)
    terminal.send(command, "horizontal")
end

-- Map F6 to run_cpp_file function
vim.api.nvim_set_keymap('n', '<F6>', ':lua run_cpp_file()<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<leader>h', ':lua toggle_terminal("horizontal")<CR>', { noremap = true, silent = true })
-- vim.cmd("colorscheme habamax")
