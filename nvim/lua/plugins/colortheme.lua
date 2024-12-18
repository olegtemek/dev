return {
  "zaldih/themery.nvim",
  dependencies = {
    "gantoreno/nvim-gabriel",
    "catppuccin/nvim",
    "EdenEast/nightfox.nvim",
    "ramojus/mellifluous.nvim",
    "aktersnurra/no-clown-fiesta.nvim",
    "nyoom-engineering/oxocarbon.nvim",
    "nyngwang/nvimgelion",
    "scottmckendry/cyberdream.nvim",
    "AlexvZyl/nordic.nvim"
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
        "gabriel",
        "nightfox",
        "dayfox",
        "dawnfox",
        "duskfox",
        "nordfox",
        "terafox",
        "carbonfox",
        "mellifluous",
        "no-clown-fiesta",
        "oxocarbon",
        "nvimgelion",
        "cyberdream",
        "nordic"
      }
    })

    local opts = { silent = true }
    opts.desc = "Themery change theme"
    vim.keymap.set('n', "<leader>ct", "<CMD>Themery<CR>", opts)
  end
}

