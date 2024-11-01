local keymap = vim.keymap -- for conciseness
local opts = { silent = true }


opts.desc = "General: Go back"
keymap.set("n", "<leader>gb", "<cmd>pop<CR>", opts)

opts.desc = "General: Save file"
keymap.set("n", "<leader>s", "<cmd>w<CR><cmd>w<CR>", opts)

opts.desc = "General: Quit file"
keymap.set("n", "<leader>q", "<cmd>q<CR>", opts)

opts.desc = "General: Insert mode"
keymap.set("i", "jj", "<ESC>", opts)

opts.desc = "General: Add tab in line"
keymap.set("n", "<Tab>", ">>", opts)

opts.desc = "General: Remove tab in line"
keymap.set("n", "<S-Tab>", "<<", opts)

opts.desc = "General: Add tab in line"
keymap.set("v", "<Tab>", ">gv", opts)

opts.desc = "General: Remove tab in line"
keymap.set("v", "<S-Tab>", "<gv", opts)
