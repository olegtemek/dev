return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
      vim.keymap.set("n", "<leader>w", ':w!<CR><cmd>BufferClose<CR>', { desc = "Barbar: Close tab" })
      vim.keymap.set("n", "<leader><TAB>", "<cmd>BufferNext<CR>", { desc = "Barbar: Switch tab" })
    end,
    opts = {},
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  }
}
