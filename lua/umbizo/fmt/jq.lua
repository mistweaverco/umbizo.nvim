local M = {}

M.supported_filetypes = { "json" }

M.format = function()
  local filetype = vim.bo.filetype
  if filetype ~= "json" then
    return
  end
  local cmd = "%!jq ."
  vim.cmd(cmd)
end

return M
