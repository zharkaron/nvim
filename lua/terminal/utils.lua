local M = {}

function M.run_command(cmd, dir)
  require("toggleterm").exec(cmd, 1, dir or vim.fn.getcwd())
end

return M
