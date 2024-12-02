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
  end,
}
