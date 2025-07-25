return {
  -- This overrides LazyVim’s default LSP setup
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        lua_ls = {}, -- Lua support
        tsserver = {}, -- JS/TS
        rust_analyzer = {}, -- Rust
      },
    },
  },
}
