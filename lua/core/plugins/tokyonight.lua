return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    -- Configuration for tokyonight
    require("tokyonight").setup({
      style = "night",        -- Options: "storm", "moon", "night", "day"
      transparent = false,    -- Disable/enable background transparency
      terminal_colors = true, -- Apply colors to Neovim's terminal
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        functions = {},
        variables = {},
        sidebars = "dark",         -- Darker sidebars like qf and help
      },
      sidebars = { "qf", "help" }, -- Specific sidebar windows
      on_colors = function(colors)
        -- Customize colors if needed
      end,
      on_highlights = function(hl, c)
        -- Customize highlights if needed
      end,
    })

    -- Apply the colorscheme
    vim.cmd([[colorscheme tokyonight]])
  end
}
