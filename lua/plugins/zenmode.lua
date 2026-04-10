return {
  "folke/zen-mode.nvim",
  enabled = false,
  config = function()
    require("zen-mode").setup({
      window = {
	number = true,
	relativenumber = true
      }
    })

    vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>")
  end
}
