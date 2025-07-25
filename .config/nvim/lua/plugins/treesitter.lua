return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua", "python", "javascript", "html", "css", "bash", "markdown", "json"
    },
    highlight = {
      enable = true,
    },
    auto_install = true,
  },
}
