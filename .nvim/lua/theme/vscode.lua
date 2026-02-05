local M = {}

-- 主要的 UI 配色 (這些是 VS Code 深色主題的配色)
M.override = {
    Normal = { bg = "#1E1E1E", fg = "#D4D4D4" }, -- 主要背景 & 文字顏色
    CursorLine = { bg = "#252526" }, -- 游標所在行
    Visual = { bg = "#264F78" }, -- 選取文字顏色
    StatusLine = { bg = "#007ACC", fg = "#FFFFFF" }, -- 狀態列
    Comment = { fg = "#6A9955", italic = true }, -- 註解
    Function = { fg = "#DCDCAA" }, -- 函數顏色
    String = { fg = "#CE9178" }, -- 字串
    Keyword = { fg = "#569CD6" }, -- 關鍵字
    Type = { fg = "#4EC9B0" }, -- 類型 (e.g., int, string)
    Constant = { fg = "#D16969" }, -- 常數
    Error = { fg = "#F44747", bold = true }, -- 錯誤訊息
}



return M

