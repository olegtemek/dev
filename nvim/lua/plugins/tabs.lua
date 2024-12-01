return {
  "akinsho/bufferline.nvim",
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup({})

    vim.keymap.set("n", "<leader><TAB>", "<CMD>BufferLineCycleNext<CR>", { desc = "BufferLine: Switch tab" })
    vim.keymap.set("n", "<leader>w", "<CMD>:bd<CR>")
  end
}
