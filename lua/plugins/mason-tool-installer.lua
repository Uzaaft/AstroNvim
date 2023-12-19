return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean" },
    dependencies = { "williamboman/mason.nvim" },
    init = function()
      require("astrocore").on_load("mason.nvim", function() require "mason-tool-installer" end)
    end,
    opts = {
      ensure_installed = {
        -- Language Servers
        "ansiblels",
        "clangd",
        "cssls",
        "gopls",
        "hls",
        "html",
        "intelephense",
        "marksman",
        "neocmake",
        "jsonls",
        "julials",
        "lua_ls",
        { "pylance", version = "2023.12.100" }, -- last known working version
        "ruff_lsp",
        "taplo",
        "texlab",
        "vtsls",
        "yamlls",

        -- Linters
        "ansible-lint",
        "shellcheck",

        -- Formatters
        "ruff",
        "prettierd",
        "shfmt",
        "stylua",

        -- Debuggers
        "bash-debug-adapter",
        "cpptools",
        "debugpy",
        "delve",
        "haskell-debug-adapter",
        "js-debug-adapter",
        "php-debug-adapter",
      },
    },
    config = function(_, opts)
      local mason_tool_installer = require "mason-tool-installer"
      mason_tool_installer.setup(opts)
      mason_tool_installer.run_on_start()
    end,
  },
  { "jay-babu/mason-nvim-dap.nvim", optional = true, init = false },
  { "williamboman/mason-lspconfig.nvim", optional = true, init = false },
  { "jay-babu/mason-null-ls.nvim", optional = true, init = false },
}
