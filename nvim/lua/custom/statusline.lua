local M = require("nvchad.ui.statusline.default") -- 載入 nvchad 的預設 statusline

-- 修改 filename 顯示方式
M.filename = function()
  local fname = vim.fn.expand("%:t") -- 取得 buffer 名稱
  fname = fname:gsub("_%d+$", "")    -- 去除 "_1", "_2" 這類數字
  return " " .. (fname ~= "" and fname or "[No Name]") .. " "
end

return M

