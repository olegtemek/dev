return {
  "zaldih/themery.nvim",
  dependencies = {
    "gantoreno/nvim-gabriel",
    "catppuccin/nvim"
  },
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        "catppuccin-frappe",
        "catppuccin-latte",
        "catppuccin-frappe",
        "catppuccin-macchiato",
        "catppuccin-mocha",
        "gabriel"
      }
    })

    local opts = { silent = true }
    opts.desc = "Themery change theme"
    vim.keymap.set('n', "<leader>ct", "<CMD>Themery<CR>", opts)
  end
}
