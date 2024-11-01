return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "stevearc/conform.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")


    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      registries = {
        "github:mason-org/mason-registry"
      }
    })

    mason_lspconfig.setup({})


    mason_tool_installer.setup({
      ensure_installed = {
        "gopls",
        "gofumpt",
        "delve",
        "lua-language-server",
        "stylua",
      }
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
      end,
    })
  end,
}
