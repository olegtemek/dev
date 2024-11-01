return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      popup_border_style = "rounded",
      enable_git_status = true,
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true
        }
      },
      window = {
        mappings = {
          ["<cr>"] = "open",
          ["<2-LeftMouse>"] = "open",
          ["l"] = "open",
        }
      },
      evet_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            vim.cmd("Neotree close")
          end
        },

      }
    })
    vim.keymap.set("n", "<leader>e", ":Neotree float toggle<CR>", { desc = "NeoTree: Open Explorer float" })
  end

}
