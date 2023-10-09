-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.keymap.set({ "n", "v" }, "<S-Tab>", "<cmd>tabnext<cr>", { silent = true })
vim.keymap.set({ "n", "v" }, "<C-Tab>", "<cmd>tabprev<cr>", { silent = true })
vim.cmd('imap <silent><script><expr> <C-l> copilot#Accept("")')
vim.cmd('imap <silent><script><expr> <C-j> copilot#Reject("")') -- accept dışındakiler çalışmıyor
vim.cmd('imap <silent><script><expr> <C-k> copilot#Cancel("")')
vim.cmd('imap <silent><script><expr> <F12> copilot#Next("")')
vim.cmd('imap <silent><script><expr> <F11> copilot#Previous("")')
