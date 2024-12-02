return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("MainKeybindings", {}),

      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { silent = true }
        opts.buffer = ev.buf

        -- set keybinds
        opts.desc = "Lsp: Show LSP references"
        vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Lsp: Go to declaration"
        vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Lsp: Show LSP definitions"
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts) -- show lsp definitions

        opts.desc = "Lsp: Show LSP implementations"
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts) -- show lsp implementations

        opts.desc = "Lsp: Show LSP type definitions"
        vim.keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "Lsp: See available code actions"
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Lsp: Smart rename"
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Lsp: Show documentation for what is under cursor"
        vim.keymap.set("n", "<leader>gh", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Lsp: Restart LSP"
        vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

        opts.desc = "Lsp: Goto next error"
        vim.keymap.set("n", "<leader>ge", function()
          vim.diagnostic.goto_next()
        end, opts)
      end,
    })
  end,
}
