return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' },
      keys = {
        { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Open file (ignore git)" },
        { "<leader>;", "<cmd>Telescope buffers<cr>", desc = "Bufferlist" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
            -- Git
        { "<leader>gh", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
        { "<leader>gg", "<cmd>Telescope git_status<cr>", desc = "Status" },
        { "<leader>gm", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
      }
}
