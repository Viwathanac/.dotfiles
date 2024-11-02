vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<CR>", ":noh<CR><CR>", {})

vim.keymap.set("n", "Q", "<Nop>", { desc = "Remove annoying exmode" })
vim.keymap.set("n", "q:", "<Nop>", { desc = "Remove annoying exmode" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", "!", "!<c-g>u")
vim.keymap.set("i", "?", "?<c-g>u")

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { silent = true })

vim.keymap.set("v", "<", "<gv", { desc = "Dedent current selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent current selection" })

