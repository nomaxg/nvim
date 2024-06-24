return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' },
  keys = {
    { "<C-p>",      "<cmd>Telescope find_files<cr>",   desc = "Open file (ignore git)" },
    { "<leader>;",  "<cmd>Telescope buffers<cr>",      desc = "Bufferlist" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",    desc = "Live grep" },
    { "<leader>fc", "<cmd>Telescope grep_string<cr>",  desc = "Live grep under cursor" },
    -- Git
    { "<leader>gh", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
    { "<leader>gg", "<cmd>Telescope git_status<cr>",   desc = "Status" },
    { "<leader>gm", "<cmd>Telescope git_commits<cr>",  desc = "Commits" },
  },
  config = function(opts)
    local telescope = require("telescope")
    telescope.load_extension("projects")
    -- telescope.load_extension("live_grep_args")
  end
}
