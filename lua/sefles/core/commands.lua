vim.api.nvim_create_user_command("LspRestartTailwind", function()
  local clients = vim.lsp.get_clients({
    name = "tailwindcss",
    bufnr = vim.api.nvim_get_current_buf()
  })

  for _, client in ipairs(clients) do
    client.stop()
  end

  vim.defer_fn(function()
    vim.cmd("LspStart tailwindcss")
  end, 500)
end, {})
