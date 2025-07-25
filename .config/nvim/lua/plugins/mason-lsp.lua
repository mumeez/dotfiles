return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "pyright",
      "tsserver",
      "lua_ls",
      "rust_analyzer",
    },
    automatic_installation = true,
  },
}
