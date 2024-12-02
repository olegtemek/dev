return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")


    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next,     -- move to next result
          },
        },
      },
    })


    vim.keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Telescope: find files in cwd" })
    vim.keymap.set("n", "<leader>fs", "<CMD>Telescope live_grep<CR>", { desc = "Telescope: string in cwd" })
    vim.keymap.set("n", "<leader>fe", "<CMD>Telescope diagnostics<CR>", { desc = "Telescope: show diagnostics" })
  end,
}
