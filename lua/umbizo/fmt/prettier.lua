local M = {}

M.supported_filetypes = {
  "yaml",
  "yml",
  "html",
  "css",
  "scss",
  "less",
  "javascript",
  "javascriptreact",
}

M.format = function()
  local cmd = string.format("prettier --write %s", vim.fn.expand("%:p"))
  vim.fn.system(cmd)
  vim.cmd("edit")
end

return M
