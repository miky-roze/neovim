return {
  'nvim-telescope/telescope.nvim',
  enabled = false,
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- optional but recommended
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local ts = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', ts.find_files)
    vim.keymap.set('n', '<leader>fg', ts.git_files)
    vim.keymap.set('n', '<leader>fw', ts.live_grep)
    vim.keymap.set('n', '<leader>fs', ts.grep_string)
    vim.keymap.set('n', '<leader>fo', ts.oldfiles)
    vim.keymap.set('n', '<leader>fs', ts.search_history)
    vim.keymap.set('n', '<leader>fh', ts.help_tags)
    vim.keymap.set('n', '<leader>fn', function() ts.find_files({ cwd = vim.fn.stdpath("config") }) end)

    local actions = require("telescope.actions")
    vim.keymap.set('n', '<leader>qf',
      function()
	local bufnr = vim.api.nvim_get_current_buf()
	actions.smart_send_to_qflist(bufnr)
      end
    )
  end
}
