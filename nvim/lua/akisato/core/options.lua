vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.guicursor = ""

-- tabs & indentation
opt.tabstop = 2 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 4 spaces for indent width
opt.softtabstop = 2 -- 4 spaces for tab when editing
opt.expandtab = true -- expand tab to spaces
opt.smarttab = true -- insert spaces when pressing tab at the beginning of a line
opt.smartindent = true -- smart indenting when starting a new line
opt.wrap = false
-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
-- turn off backup
opt.backup = false

-- search settings
opt.hlsearch = true -- highlight search results
opt.incsearch = true -- show search results as you type

opt.scrolloff = 8 -- keep 8 lines above/below the cursor when scrolling
opt.sidescrolloff = 8 -- keep 8 columns to the left/right of the cursor when scrolling
opt.signcolumn = "yes" -- always show sign column
opt.isfname:append("@-@") -- allow @-@ in file names
opt.iskeyword:append("-") -- treat dash-separated words as a single word

opt.updatecount = 50 -- update the file every changes
