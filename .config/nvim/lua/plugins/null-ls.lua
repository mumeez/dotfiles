-- File: ~/.config/nvim/lua/plugins/null-ls.lua

return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "williamboman/mason.nvim" },
  opts = function()
    local null_ls = require("null-ls")

    return {
      sources = {
        -- FORMATTERS
        null_ls.builtins.formatting.prettier.with({
          extra_filetypes = { "svelte", "astro" },
        }),
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.stylua,

        -- LINTERS
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.diagnostics.eslint_d,
      },
    }
  end,
}
