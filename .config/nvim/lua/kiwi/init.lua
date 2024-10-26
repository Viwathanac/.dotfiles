-- <<Remapping Keybinds automatically>>
require("kiwi.remap")

-- <<Showing Relative Line Number for Every Nvim Start>>
vim.cmd("set nu rnu")
vim.cmd("set cursorline")

-- <<Stop Highlighting After ENTER/RETURN>> 
vim.cmd("nnoremap <CR> :noh<CR><CR>")

-- <<Centers Cursor>>
vim.cmd("nnoremap <C-d> <C-d>zz")
vim.cmd("nnoremap <C-u> <C-u>zz")
vim.cmd("nnoremap n nzzzv")
vim.cmd("nnoremap N Nzzzv")

