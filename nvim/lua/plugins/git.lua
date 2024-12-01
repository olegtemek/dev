return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end
          map('n', '<leader>bt', gitsigns.toggle_current_line_blame, { desc = "Git: toggle current line blame" })
          map('n', '<leader>br', gitsigns.reset_hunk, { desc = "Git: reset hunk" })
          map('n', '<leader>bp', gitsigns.preview_hunk, { desc = "Git: preview hunk" })
        end
      })
    end
  }
}
