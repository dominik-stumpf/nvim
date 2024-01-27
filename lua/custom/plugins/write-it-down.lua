return {
  "neovim/nvim-lspconfig",
  config = function()
    local write_delay_ms = 40
    vim.api.nvim_create_user_command("WriteItDown", function()
      print "yes sir."

      local current_bufnr = vim.fn.bufnr "%"
      local buffer_content = vim.fn.getbufline(current_bufnr, 1, "$")

      for lineIndex in ipairs(buffer_content) do
        vim.fn.setbufline(current_bufnr, lineIndex, "")
      end

      local iteration_count = 0
      for line_index, line in ipairs(buffer_content) do
        local line_progress = ""
        for char_index = 1, #line do
          local char = line:sub(char_index, char_index)

          vim.fn.timer_start(iteration_count * write_delay_ms, function()
            line_progress = line_progress .. char
            print("current line: " .. line_progress)
            vim.fn.setbufline(current_bufnr, line_index, line_progress)
          end)

          iteration_count = iteration_count + 1
        end
      end
    end, {})
  end,
}
