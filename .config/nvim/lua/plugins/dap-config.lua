return {
  -- Core DAP plugin
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- Python adapter config (requires debugpy)
      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}", -- Run current file
          pythonPath = function()
            return "python"
          end,
        },
      }

      -- Keymaps for debugging
      vim.keymap.set("n", "<F5>", function()
        dap.continue()
      end, { desc = "DAP: Start/Continue" })
      vim.keymap.set("n", "<F10>", function()
        dap.step_over()
      end, { desc = "DAP: Step Over" })
      vim.keymap.set("n", "<F11>", function()
        dap.step_into()
      end, { desc = "DAP: Step Into" })
      vim.keymap.set("n", "<F12>", function()
        dap.step_out()
      end, { desc = "DAP: Step Out" })
      vim.keymap.set("n", "<Leader>b", function()
        dap.toggle_breakpoint()
      end, { desc = "DAP: Toggle Breakpoint" })
    end,
  },

  -- UI for DAP
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()

      -- Auto open/close UI on session start/end
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- Optional: auto-install debuggers
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "debugpy", "codelldb" }, -- Add more as needed
        automatic_installation = true,
      })
    end,
  },
}
