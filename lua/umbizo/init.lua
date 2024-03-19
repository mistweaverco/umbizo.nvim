local M = {}

local supported_filetypes = {}

local get_this_file_path = function()
  local str = debug.getinfo(1, "S").source:sub(2)
  local path = str:match("(.*/)")
  return path
end

local get_all_fmt_filenames = function()
  local root_path = get_this_file_path()
  local fmt_path = root_path .. "fmt"
  local files = vim.fn.globpath(fmt_path, "*.lua", false, true)
  return files
end

M.setup = function()
  local files = get_all_fmt_filenames()
  for _, file in ipairs(files) do
    local formatter_name = vim.fn.fnamemodify(file, ":t:r")
    local fmt = require("umbizo.fmt." .. formatter_name)
    local filetypes = fmt.supported_filetypes
    for _, filetype in ipairs(filetypes) do
      supported_filetypes[filetype] = supported_filetypes[filetype] or {}
      table.insert(supported_filetypes[filetype], formatter_name)
    end
  end
end

M.format = function()
  local filetype = vim.bo.filetype
  local sft = supported_filetypes[filetype]
  if not sft then
    print("No formatter found for " .. filetype)
    return
  end
  if #sft > 1 then
    vim.print(sft)
    vim.ui.select(sft, {
        prompt = 'Select a formatter:',
    }, function(_, idx)
        require("umbizo.fmt." .. sft[idx]).format()
    end)
  else
    require("umbizo.fmt." .. sft[1]).format()
  end
end

return M
