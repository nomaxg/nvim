local function init()
  --local defaults = require("config.defaults").load()
  vim.cmd('source ~/.config/nvim/bindings.vim')
  -- lazy.nvim
  require("config.lazy")
end

init()

