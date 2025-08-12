return {
  "williamboman/mason.nvim",
  priority = 1000, -- ensure Mason loads before dependent plugins
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = {  -- LSPs
            "ts_ls",
            "html",
            "cssls",
            "lua_ls",
            "pyright",
            "clangd",
            "rust_analyzer",
            "robotframework_ls",
            "bashls",
            "marksman",
            "yamlls",
          },
          automatic_installation = true,
          -- automatic_setup = false, -- optional: disable auto-setup if using setup_handlers
        })
      end,
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      config = function()
        require("mason-tool-installer").setup({
          ensure_installed = {  -- Formatters
            "prettier",
            "stylua",
            "ruff",
            "shellharden",
          },
        })
      end,
    },
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
  end,
}

