-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.ai_cmp = false

local opt = vim.opt

opt.cmdheight = 0
opt.clipboard = "unnamedplus"
opt.colorcolumn = "100"
opt.cursorlineopt = "number,line"
opt.foldcolumn = "1"
opt.listchars = {
  extends = "›",
  nbsp = "␣",
  precedes = "‹",
  tab = "» ",
  trail = "·",
}
opt.numberwidth = 4
opt.pumblend = 12
opt.scrolloff = 6
opt.sidescrolloff = 12
opt.winborder = "rounded"
opt.shiftwidth = 4  -- Размер отступа
opt.tabstop = 4     -- Размер табуляции
opt.softtabstop = 4 -- Количество пробелов при нажатии Tab
opt.expandtab = true -- Преобразовывать таб в пробелы
