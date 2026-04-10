vim.api.nvim_create_autocmd(
  "TextYankPost",
  {
    callback = function() vim.highlight.on_yank({ timeout = 200 }) end
  }
)

vim.api.nvim_create_autocmd(
  "LspAttach",
  {
    callback = function(event)
      local opts = { buffer = event.buf }
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "gi", function() vim.lsp.buf.implementations() end, opts)
      vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

      vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	virtual_text = true
      })
    end
  }
)

vim.api.nvim_create_autocmd(
  "QuickFixCmdPost",
  {
    callback = function() vim.cmd([[Trouble qflist open]]) end
  }
)
