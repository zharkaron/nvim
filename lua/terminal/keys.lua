local api = require("nvim-tree.api")
local Terminal = require("toggleterm.terminal").Terminal
local fn = vim.fn
local notify = vim.notify

local function open_floating_terminal_in_dir(path)
  local term = Terminal:new({
    dir = path,
    direction = "float",
    close_on_exit = false,
    hidden = true,
  })
  term:toggle()
end

local function run_command_in_terminal(cmd, path)
  -- create a terminal that runs cmd in dir=path
  local term = Terminal:new({
    cmd = cmd,
    dir = path,
    direction = "float",
    close_on_exit = false,
    hidden = true,
  })
  term:toggle()
end

local function get_node_or_buffer_file()
  -- Try tree node under cursor first
  local ok, node = pcall(api.tree.get_node_under_cursor)
  if ok and node and node.absolute_path and node.type == "file" then
    return node.absolute_path
  end
  -- Fallback: current buffer file
  local buffile = fn.expand("%:p")
  if buffile ~= "" and fn.filereadable(buffile) == 1 then
    return buffile
  end
  return nil
end

-- Open terminal in hovered directory or file (or cwd)
vim.keymap.set("n", "<leader>tt", function()
  local ok, node = pcall(api.tree.get_node_under_cursor)
  local path
  if ok and node then
    if node.type == "file" then
      path = fn.fnamemodify(node.absolute_path, ":h")
    elseif node.type == "directory" then
      path = node.absolute_path
    end
  end
  if not path or path == "" then
    path = fn.getcwd()
  end
  open_floating_terminal_in_dir(path)
end, { desc = "Open terminal in node directory (or cwd)" })

-- Run hovered file (fallback to current buffer) in terminal
vim.keymap.set("n", "<leader>tr", function()
  local file = get_node_or_buffer_file()
  if not file then
    notify("No file selected or open to run.", vim.log.levels.WARN)
    return
  end

  local ext = fn.fnamemodify(file, ":e")
  local shfile = fn.shellescape(file)
  local cmd

  if ext == "py" then
    -- -u for unbuffered output
    cmd = "python3 -u " .. shfile
  elseif ext == "sh" or ext == "bash" then
    cmd = "bash " .. shfile
  elseif ext == "lua" then
    cmd = "lua " .. shfile
  elseif ext == "js" or ext == "mjs" then
    cmd = "node " .. shfile
  else
    notify("No run command configured for *." .. ext .. " files.", vim.log.levels.WARN)
    return
  end

  run_command_in_terminal(cmd, fn.fnamemodify(file, ":h"))
end, { desc = "Run hovered/open file in floating terminal" })

-- Open terminal in current buffer’s directory
vim.keymap.set("n", "<leader>tb", function()
  local file = fn.expand("%:p")
  if file == "" then
    notify("No file open", vim.log.levels.WARN)
    return
  end
  local dir = fn.fnamemodify(file, ":h")
  open_floating_terminal_in_dir(dir)
end, { desc = "Open terminal in buffer directory" })
