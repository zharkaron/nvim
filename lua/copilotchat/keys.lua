-- lua/copilotchat/keys.lua

vim.keymap.set("n", "<leader>c", ":CopilotChat<CR>", { desc = "Open Copilot Chat" })
vim.keymap.set("n", "<leader>cf", ":CopilotChatFix #buffer<CR>", { desc = "Fix code with Copilot Chat" })
vim.keymap.set("n", "<leader>ce", ":CopilotChatExplain #buffer<CR>", { desc = "Explain code with Copilot Chat" })
vim.keymap.set("n", "<leader>cr", ":CopilotChatReview #buffer<CR>", { desc = "Review code with Copilot Chat" })
vim.keymap.set("n", "<leader>ca", function()
  local lines = {}
  for _, b in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(b) and vim.api.nvim_buf_get_option(b, "buflisted") then
      local fname = vim.api.nvim_buf_get_name(b)
      if fname ~= "" then
        table.insert(lines, "#file:`" .. fname .. "`")
      end
    end
  end
  if #lines > 0 then
    vim.api.nvim_buf_set_lines(0, vim.fn.line('.') - 1, vim.fn.line('.') - 1, false, lines)
    vim.notify("Inserted #file context commands into current buffer.", vim.log.levels.INFO)
  else
    vim.notify("No open files to insert.", vim.log.levels.WARN)
  end
end, { desc = "Insert #file context commands for all open files at cursor" })
