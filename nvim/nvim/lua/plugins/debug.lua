return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      -- Configure your debug adapters here
      -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
    end,
  },
  {
    "miroshQa/debugmaster.nvim",
    lazy = false,
    enabled = false,
    config = function()
      local dm = require("debugmaster")
      -- make sure you don't have any other keymaps that starts with "<leader>d" to avoid delay
      dm.plugins.cursor_hl.enabled = false
      dm.plugins.ui_auto_toggle.enabled = false
      vim.api.nvim_set_hl(0, "dCursor", { bg = "#FF2C2C" })
      vim.keymap.set({ "n", "v" }, "<leader>z", dm.mode.toggle, { nowait = true, desc = "Debug Mode" })
      vim.keymap.set("t", "<A-/>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
    end,
  },
}
