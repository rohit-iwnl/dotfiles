-- Run current C++ file in terminal split
local function RunCpp()
  local file = vim.api.nvim_buf_get_name(0)
  if file:sub(-4) ~= ".cpp" then
    print("Not a C++ file!")
    return
  end

  local output = file:sub(1, -5) -- remove .cpp extension
  local cmd =
    string.format("g++-15 -std=c++17 -O2 -Wall -Wextra -Wshadow -Wconversion -o %s %s && ./%s", output, file, output)

  -- open a terminal split and run command
  vim.cmd("botright split | terminal")
  local term_job_id = vim.b.terminal_job_id
  if term_job_id then
    vim.fn.chansend(term_job_id, cmd .. "\n")
  else
    vim.cmd(cmd)
  end
end

-- keymap (set after function is defined)
vim.keymap.set("n", "<leader>m", RunCpp, { noremap = true, silent = true, desc = "Run current C++ file" })
