-- send stuff to terminal
local send_to_termina = function(content)
  local f = assert(io.open("/tmp/nvim_terminal_job_id", "rb"))
  local job_id = tonumber(f:read("*all"))
  f:close()
  if (job_id) then
    vim.api.nvim_chan_send(job_id, content)
    vim.api.nvim_chan_send(job_id, "\r")
  end
end

local open_terminal = function()
  vim.cmd.vsplit()
  vim.cmd.terminal()
  vim.cmd [[redir! > /tmp/nvim_terminal_job_id | echo b:terminal_job_id | redir END]]
  vim.cmd [[wincmd h]]
end

-- eval init terminal
vim.keymap.set('n', '<localleader>et', function()
  open_terminal()
end, {})

-- eval word
vim.keymap.set('n', '<localleader>ew', function()
  send_to_termina(vim.fn.expand("<cWORD>"))
end, {})

-- eval line
vim.keymap.set('n', '<localleader>ee', function()
  local line = vim.api.nvim_buf_get_lines(vim.api.nvim_get_current_buf(), vim.fn.line(".") - 1, vim.fn.line("."),
    false)
  print(vim.inspect(line))
  send_to_termina(line[1])
end, {})

-- eval buf
vim.keymap.set('n', '<localleader>eb', function()
  local lines = vim.api.nvim_buf_get_lines(vim.api.nvim_get_current_buf(), 0, -1, false)
  print(vim.inspect(lines))
  for _, line in pairs(lines) do
    send_to_termina(line)
  end
end, {})
