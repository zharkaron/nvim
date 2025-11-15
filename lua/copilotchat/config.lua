-- lua/copilotchat/config.lua
require("CopilotChat").setup({
  window = { width = 40 },
  Mappings = {
    close = {"<Esc>", "q"},
    submit_prompt = {"<C-CR>", "<CR>"},
    clear_prompt = {"<C-u>"},
  },
  auto_prompt = { enable = true },
})
