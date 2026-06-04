-- =========================

-- KIBOT VS CODE LIKE SHORTCUTS

-- LazyVim / Neovim

-- =========================

local map = vim.keymap.set

local unpack = table.unpack or unpack

local function esc()
  return vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
end

local function feed(keys, mode)
  local termcodes = vim.api.nvim_replace_termcodes(keys, true, false, true)

  vim.api.nvim_feedkeys(termcodes, mode or "n", false)
end

local function safe_cmd(cmd)
  return function()
    pcall(vim.cmd, cmd)
  end
end

local function picker_files()
  if _G.Snacks and Snacks.picker then
    Snacks.picker.files()
  else
    pcall(vim.cmd, "Telescope find_files")
  end
end

local function picker_grep()
  if _G.Snacks and Snacks.picker then
    Snacks.picker.grep()
  else
    pcall(vim.cmd, "Telescope live_grep")
  end
end

local function picker_buffers()
  if _G.Snacks and Snacks.picker then
    Snacks.picker.buffers()
  else
    pcall(vim.cmd, "Telescope buffers")
  end
end

local function picker_commands()
  if _G.Snacks and Snacks.picker then
    Snacks.picker.commands()
  else
    pcall(vim.cmd, "Telescope commands")
  end
end

local function picker_keymaps()
  if _G.Snacks and Snacks.picker then
    Snacks.picker.keymaps()
  else
    pcall(vim.cmd, "Telescope keymaps")
  end
end

local function picker_symbols()
  if _G.Snacks and Snacks.picker then
    Snacks.picker.lsp_symbols()
  else
    pcall(vim.cmd, "Telescope lsp_document_symbols")
  end
end

local function diagnostic_list()
  vim.diagnostic.setloclist()

  pcall(vim.cmd, "lopen")
end

local function toggle_explorer()
  if _G.Snacks and Snacks.explorer then
    Snacks.explorer()
  else
    pcall(vim.cmd, "Neotree toggle")
  end
end

local function format_file()
  if vim.lsp.buf.format then
    vim.lsp.buf.format({ async = true })
  else
    pcall(vim.cmd, "normal! gg=G")
  end
end

-- =========================

-- GENERAL

-- =========================

-- Ctrl + Shift + P / F1 = Command Palette

map({ "n", "i", "x" }, "<C-S-p>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  picker_commands()
end, { desc = "Command Palette" })

map({ "n", "i", "x" }, "<F1>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  picker_commands()
end, { desc = "Command Palette" })

-- Ctrl + P = Quick Open / Go to File

map({ "n", "i", "x" }, "<C-p>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  picker_files()
end, { desc = "Quick Open" })

-- Ctrl + , = User Settings / Config

map({ "n", "i", "x" }, "<C-,>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  vim.cmd("edit ~/.config/nvim")
end, { desc = "Open Neovim Config" })

-- Ctrl + K Ctrl + S = Keyboard Shortcuts

map({ "n", "i", "x" }, "<C-k><C-s>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  picker_keymaps()
end, { desc = "Keyboard Shortcuts" })

-- =========================

-- BASIC EDITING

-- =========================

-- Ctrl + S = Save

map({ "n", "i", "x" }, "<C-s>", function()
  vim.cmd("write")
end, { desc = "Save file" })

-- Ctrl + A = Select All

map("n", "<C-a>", "ggVG", { desc = "Select all" })

map("i", "<C-a>", "<Esc>ggVG", { desc = "Select all" })

map("x", "<C-a>", "<Esc>ggVG", { desc = "Select all" })

-- Ctrl + C = Copy line / selection

map("n", "<C-c>", '"+yy', { desc = "Copy line" })

map("i", "<C-c>", '<Esc>"+yyi', { desc = "Copy line" })

map("x", "<C-c>", '"+y', { desc = "Copy selection" })

-- Ctrl + X = Cut line / selection

map("n", "<C-x>", '"+dd', { desc = "Cut line" })

map("i", "<C-x>", '<Esc>"+ddi', { desc = "Cut line" })

map("x", "<C-x>", '"+d', { desc = "Cut selection" })

-- Ctrl + V = Paste

map("n", "<C-v>", '"+p', { desc = "Paste" })

map("i", "<C-v>", "<C-r>+", { desc = "Paste" })

map("x", "<C-v>", '"+p', { desc = "Paste replace selection" })

-- Ctrl + Z = Undo

map("n", "<C-z>", "u", { desc = "Undo" })

map("i", "<C-z>", "<C-o>u", { desc = "Undo" })

map("x", "<C-z>", "<Esc>u", { desc = "Undo" })

-- Ctrl + Y / Ctrl + Shift + Z = Redo

map("n", "<C-y>", "<C-r>", { desc = "Redo" })

map("i", "<C-y>", "<C-o><C-r>", { desc = "Redo" })

map("x", "<C-y>", "<Esc><C-r>", { desc = "Redo" })

map("n", "<C-S-z>", "<C-r>", { desc = "Redo" })

map("i", "<C-S-z>", "<C-o><C-r>", { desc = "Redo" })

map("x", "<C-S-z>", "<Esc><C-r>", { desc = "Redo" })

-- Ctrl + Shift + K = Delete Line

map("n", "<C-S-k>", "dd", { desc = "Delete line" })

map("i", "<C-S-k>", "<Esc>ddi", { desc = "Delete line" })

map("x", "<C-S-k>", "d", { desc = "Delete selection" })

-- Ctrl + Enter = Insert Line Below

map("n", "<C-CR>", "o", { desc = "Insert line below" })

map("i", "<C-CR>", "<Esc>o", { desc = "Insert line below" })

map("x", "<C-CR>", "<Esc>o", { desc = "Insert line below" })

map("n", "<C-Enter>", "o", { desc = "Insert line below" })

map("i", "<C-Enter>", "<Esc>o", { desc = "Insert line below" })

map("x", "<C-Enter>", "<Esc>o", { desc = "Insert line below" })

-- Ctrl + Shift + Enter = Insert Line Above

map("n", "<C-S-CR>", "O", { desc = "Insert line above" })

map("i", "<C-S-CR>", "<Esc>O", { desc = "Insert line above" })

map("x", "<C-S-CR>", "<Esc>O", { desc = "Insert line above" })

map("n", "<C-S-Enter>", "O", { desc = "Insert line above" })

map("i", "<C-S-Enter>", "<Esc>O", { desc = "Insert line above" })

map("x", "<C-S-Enter>", "<Esc>O", { desc = "Insert line above" })

-- Ctrl + Shift + \ = Jump to matching bracket

map({ "n", "x" }, "<C-S-\\>", "%", { desc = "Jump to matching bracket" })

map("i", "<C-S-\\>", "<Esc>%i", { desc = "Jump to matching bracket" })

-- Ctrl + ] / [ = Indent / Outdent

map("n", "<C-]>", ">>", { desc = "Indent line" })

map("i", "<C-]>", "<Esc>>>i", { desc = "Indent line" })

map("x", "<C-]>", ">gv", { desc = "Indent selection" })

map("n", "<C-[>", "<<", { desc = "Outdent line" })

map("i", "<C-[>", "<Esc><<i", { desc = "Outdent line" })

map("x", "<C-[>", "<gv", { desc = "Outdent selection" })

-- Ctrl + Home / End = Beginning / End of File

map({ "n", "x" }, "<C-Home>", "gg", { desc = "Go to beginning of file" })

map("i", "<C-Home>", "<Esc>ggi", { desc = "Go to beginning of file" })

map({ "n", "x" }, "<C-End>", "G", { desc = "Go to end of file" })

map("i", "<C-End>", "<Esc>Gi", { desc = "Go to end of file" })

-- Ctrl + Up / Down = Scroll line up/down

map({ "n", "i", "x" }, "<C-Up>", "<C-y>", { desc = "Scroll line up" })

map({ "n", "i", "x" }, "<C-Down>", "<C-e>", { desc = "Scroll line down" })

-- Alt + PgUp / PgDn = Scroll page up/down

map({ "n", "i", "x" }, "<A-PageUp>", "<C-b>", { desc = "Scroll page up" })

map({ "n", "i", "x" }, "<A-PageDown>", "<C-f>", { desc = "Scroll page down" })

-- Folds

map("n", "<C-S-[>", "zc", { desc = "Fold region" })

map("n", "<C-S-]>", "zo", { desc = "Unfold region" })

map("n", "<C-k><C-[>", "zM", { desc = "Fold all regions" })

map("n", "<C-k><C-]>", "zR", { desc = "Unfold all regions" })

map("n", "<C-k><C-0>", "zM", { desc = "Fold all" })

map("n", "<C-k><C-j>", "zR", { desc = "Unfold all" })

-- Comments

map("n", "<C-/>", "gcc", { remap = true, desc = "Toggle line comment" })

map("i", "<C-/>", "<Esc>gcci", { remap = true, desc = "Toggle line comment" })

map("x", "<C-/>", "gc", { remap = true, desc = "Toggle line comment" })

map("n", "<C-k><C-c>", "gcc", { remap = true, desc = "Add line comment" })

map("x", "<C-k><C-c>", "gc", { remap = true, desc = "Add line comment" })

map("n", "<C-k><C-u>", "gcc", { remap = true, desc = "Remove line comment" })

map("x", "<C-k><C-u>", "gc", { remap = true, desc = "Remove line comment" })

map("n", "<S-A-a>", "gbc", { remap = true, desc = "Toggle block comment" })

map("x", "<S-A-a>", "gb", { remap = true, desc = "Toggle block comment" })

-- Alt + Z = Toggle Word Wrap

map({ "n", "i", "x" }, "<A-z>", function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle word wrap" })

-- =========================

-- MOVE / COPY LINE

-- =========================

local function copy_line_down()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  vim.cmd(row .. "copy " .. row)

  vim.api.nvim_win_set_cursor(0, { row + 1, col })
end

local function copy_line_up()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  local target = row - 1

  if target < 0 then
    target = 0
  end

  vim.cmd(row .. "copy " .. target)

  vim.api.nvim_win_set_cursor(0, { row, col })
end

local function copy_selection_down()
  local s = vim.fn.line("'<")

  local e = vim.fn.line("'>")

  if s > e then
    s, e = e, s
  end

  vim.cmd(("%d,%dcopy %d"):format(s, e, e))

  vim.cmd("normal! gv")
end

local function copy_selection_up()
  local s = vim.fn.line("'<")

  local e = vim.fn.line("'>")

  if s > e then
    s, e = e, s
  end

  local target = s - 1

  if target < 0 then
    target = 0
  end

  vim.cmd(("%d,%dcopy %d"):format(s, e, target))

  vim.cmd("normal! gv")
end

for _, key in ipairs({ "<S-A-Down>", "<A-S-Down>", "<S-M-Down>", "<M-S-Down>" }) do
  map("n", key, copy_line_down, { desc = "Copy line down" })

  map("i", key, function()
    vim.cmd("stopinsert")

    copy_line_down()

    vim.cmd("startinsert")
  end, { desc = "Copy line down" })

  map("x", key, copy_selection_down, { desc = "Copy selection down" })
end

for _, key in ipairs({ "<S-A-Up>", "<A-S-Up>", "<S-M-Up>", "<M-S-Up>" }) do
  map("n", key, copy_line_up, { desc = "Copy line up" })

  map("i", key, function()
    vim.cmd("stopinsert")

    copy_line_up()

    vim.cmd("startinsert")
  end, { desc = "Copy line up" })

  map("x", key, copy_selection_up, { desc = "Copy selection up" })
end

local function move_line_down()
  vim.cmd("move .+1")

  vim.cmd("normal! ==")
end

local function move_line_up()
  vim.cmd("move .-2")

  vim.cmd("normal! ==")
end

for _, key in ipairs({ "<A-Down>", "<M-Down>" }) do
  map("n", key, move_line_down, { desc = "Move line down" })

  map("i", key, function()
    vim.cmd("stopinsert")

    move_line_down()

    vim.cmd("startinsert")
  end, { desc = "Move line down" })

  map("x", key, ":<C-u>move '>+1<CR>gv=gv", { desc = "Move selection down" })
end

for _, key in ipairs({ "<A-Up>", "<M-Up>" }) do
  map("n", key, move_line_up, { desc = "Move line up" })

  map("i", key, function()
    vim.cmd("stopinsert")

    move_line_up()

    vim.cmd("startinsert")
  end, { desc = "Move line up" })

  map("x", key, ":<C-u>move '<-2<CR>gv=gv", { desc = "Move selection up" })
end

-- =========================

-- NAVIGATION

-- =========================

map({ "n", "i", "x" }, "<C-t>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  picker_symbols()
end, { desc = "Show all symbols" })

map({ "n", "i", "x" }, "<C-g>", function()
  vim.ui.input({ prompt = "Go to line: " }, function(input)
    if input and input ~= "" then
      vim.cmd("normal! " .. input .. "G")
    end
  end)
end, { desc = "Go to line" })

map({ "n", "i", "x" }, "<C-S-o>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  picker_symbols()
end, { desc = "Go to symbol" })

map({ "n", "i", "x" }, "<C-S-m>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  diagnostic_list()
end, { desc = "Show problems" })

map("n", "<F8>", function()
  vim.diagnostic.goto_next()
end, { desc = "Next error or warning" })

map("n", "<S-F8>", function()
  vim.diagnostic.goto_prev()
end, { desc = "Previous error or warning" })

map("n", "<A-Left>", "<C-o>", { desc = "Go back" })

map("n", "<A-Right>", "<C-i>", { desc = "Go forward" })

-- =========================

-- SEARCH AND REPLACE

-- =========================

map("n", "<C-f>", "/", { desc = "Find in current file" })

map("i", "<C-f>", "<Esc>/", { desc = "Find in current file" })

map("x", "<C-f>", "<Esc>/", { desc = "Find in current file" })

map("n", "<C-h>", ":%s/", { desc = "Replace in current file" })

map("i", "<C-h>", "<Esc>:%s/", { desc = "Replace in current file" })

map("x", "<C-h>", ":s/", { desc = "Replace in selection" })

map("n", "<F3>", "n", { desc = "Find next" })

map("n", "<S-F3>", "N", { desc = "Find previous" })

map("n", "<C-d>", "*", { desc = "Add selection to next find match / search word" })

map("x", "<C-d>", "y/<C-r>0<CR>", { desc = "Search selection" })

-- =========================

-- MULTI-CURSOR AND SELECTION

-- =========================

map("n", "<C-l>", "V", { desc = "Select current line" })

map("i", "<C-l>", "<Esc>V", { desc = "Select current line" })

map("x", "<C-l>", "V", { desc = "Select current line" })

map(
  "n",
  "<C-F2>",
  ":%s/<C-r><C-w>//gn<Left><Left><Left>",
  { desc = "Select all occurrences of current word substitute helper" }
)

map("n", "<S-A-Right>", "vaw", { desc = "Expand selection" })

map("x", "<S-A-Right>", "e", { desc = "Expand selection" })

map("x", "<S-A-Left>", "o", { desc = "Shrink selection alternative" })

-- =========================

-- RICH LANGUAGE EDITING / LSP

-- =========================

map({ "n", "i" }, "<C-Space>", function()
  feed("<C-x><C-o>")
end, { desc = "Trigger suggestion" })

map({ "n", "i" }, "<C-i>", function()
  feed("<C-x><C-o>")
end, { desc = "Trigger suggestion" })

map("n", "<S-A-f>", format_file, { desc = "Format document" })

map("i", "<S-A-f>", function()
  vim.cmd("stopinsert")

  format_file()

  vim.cmd("startinsert")
end, { desc = "Format document" })

map("x", "<S-A-f>", format_file, { desc = "Format selection" })

map("n", "<C-k><C-f>", format_file, { desc = "Format selection" })

map("x", "<C-k><C-f>", format_file, { desc = "Format selection" })

map("n", "<F12>", vim.lsp.buf.definition, { desc = "Go to definition" })

map("n", "<A-F12>", vim.lsp.buf.hover, { desc = "Peek definition / hover" })

map("n", "<C-k><F12>", vim.lsp.buf.definition, { desc = "Open definition to side" })

map("n", "<C-.>", vim.lsp.buf.code_action, { desc = "Quick fix" })

map("x", "<C-.>", vim.lsp.buf.code_action, { desc = "Quick fix" })

map("n", "<S-F12>", vim.lsp.buf.references, { desc = "Show references" })

map("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol" })

map("n", "<C-k><C-x>", function()
  vim.cmd([[%s/\s\+$//e]])
end, { desc = "Trim trailing whitespace" })

-- =========================

-- EDITOR MANAGEMENT

-- =========================

map({ "n", "i", "x" }, "<C-w>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  pcall(vim.cmd, "bd")
end, { desc = "Close editor" })

map({ "n", "i", "x" }, "<C-F4>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  pcall(vim.cmd, "bd")
end, { desc = "Close editor" })

map("n", "<C-\\>", "<cmd>vsplit<CR>", { desc = "Split editor" })

map("n", "<C-1>", "1<C-w>w", { desc = "Focus editor group 1" })

map("n", "<C-2>", "2<C-w>w", { desc = "Focus editor group 2" })

map("n", "<C-3>", "3<C-w>w", { desc = "Focus editor group 3" })

map("n", "<C-Tab>", "<cmd>bnext<CR>", { desc = "Open next editor" })

map("n", "<C-S-Tab>", "<cmd>bprevious<CR>", { desc = "Open previous editor" })

-- =========================

-- FILE MANAGEMENT

-- =========================

map({ "n", "i", "x" }, "<C-n>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  vim.cmd("enew")
end, { desc = "New file" })

map({ "n", "i", "x" }, "<C-o>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  picker_files()
end, { desc = "Open file" })

map({ "n", "i", "x" }, "<C-S-s>", function()
  vim.cmd("write")
end, { desc = "Save as / Save" })

map({ "n", "i", "x" }, "<C-k><s>", function()
  vim.cmd("wall")
end, { desc = "Save all" })

map("n", "<C-k><C-w>", "<cmd>bufdo bd<CR>", { desc = "Close all editors" })

map("n", "<C-S-t>", "<cmd>edit #<CR>", { desc = "Reopen closed editor / alternate file" })

map("n", "<C-k><p>", function()
  local path = vim.fn.expand("%:p")

  vim.fn.setreg("+", path)

  print("Copied path: " .. path)
end, { desc = "Copy path of active file" })

map("n", "<C-k><r>", function()
  local path = vim.fn.expand("%:p:h")

  vim.fn.jobstart({ "explorer.exe", path }, { detach = true })
end, { desc = "Reveal active file in Explorer" })

-- =========================

-- DISPLAY

-- =========================

map({ "n", "i", "x" }, "<C-b>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  toggle_explorer()
end, { desc = "Toggle sidebar" })

map({ "n", "i", "x" }, "<C-S-e>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  toggle_explorer()
end, { desc = "Show Explorer / Toggle Focus" })

map({ "n", "i", "x" }, "<C-S-f>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  picker_grep()
end, { desc = "Show Search" })

map({ "n", "i", "x" }, "<C-S-g>", safe_cmd("Git"), { desc = "Show Source Control" })

map({ "n", "i", "x" }, "<C-S-h>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  picker_grep()
end, { desc = "Replace in files / Search" })

map({ "n", "i", "x" }, "<C-S-u>", safe_cmd("messages"), { desc = "Show Output" })

map("n", "<C-S-v>", safe_cmd("MarkdownPreview"), { desc = "Open Markdown preview" })

map("n", "<C-k><v>", safe_cmd("MarkdownPreview"), { desc = "Open Markdown preview to side" })

map("n", "<C-k><z>", safe_cmd("ZenMode"), { desc = "Zen Mode" })

-- Ctrl + = / - = Zoom is terminal-level; Neovim alternative: resize font is not reliable in terminal.

-- =========================

-- DEBUG

-- =========================

map("n", "<F9>", safe_cmd("DapToggleBreakpoint"), { desc = "Toggle breakpoint" })

map("n", "<F5>", safe_cmd("DapContinue"), { desc = "Start / Continue" })

map("n", "<S-F5>", safe_cmd("DapTerminate"), { desc = "Stop debug" })

map("n", "<F10>", safe_cmd("DapStepOver"), { desc = "Step over" })

map("n", "<F11>", safe_cmd("DapStepInto"), { desc = "Step into" })

map("n", "<S-F11>", safe_cmd("DapStepOut"), { desc = "Step out" })

map("n", "<C-k><C-i>", vim.lsp.buf.hover, { desc = "Show hover" })

-- =========================

-- INTEGRATED TERMINAL

-- =========================

local term_buf = nil

function _G.KibotToggleTerminal()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)

    if vim.bo[buf].buftype == "terminal" then
      vim.api.nvim_win_close(win, true)

      return
    end
  end

  vim.cmd("botright 15split")

  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.api.nvim_set_current_buf(term_buf)
  else
    vim.cmd("terminal")

    term_buf = vim.api.nvim_get_current_buf()
  end

  vim.cmd("startinsert")
end

map({ "n", "i", "x" }, "<C-`>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  _G.KibotToggleTerminal()
end, { desc = "Toggle integrated terminal" })

map({ "n", "i", "x" }, "<C-S-`>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  vim.cmd("botright 15split | terminal")
end, { desc = "Create new terminal" })

map("t", "<C-`>", [[<C-\><C-n><cmd>lua KibotToggleTerminal()<CR>]], { desc = "Toggle terminal" })

map("t", "<C-S-`>", [[<C-\><C-n><cmd>botright 15split | terminal<CR>]], { desc = "Create new terminal" })

map("t", "<C-v>", [[<C-\><C-n>"+pi]], { desc = "Paste into terminal" })

map("t", "<C-c>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

map("t", "<C-Up>", [[<C-\><C-n><C-y>i]], { desc = "Terminal scroll up" })

map("t", "<C-Down>", [[<C-\><C-n><C-e>i]], { desc = "Terminal scroll down" })

-- Fallback if Ctrl + ` is not detected by terminal

map({ "n", "i", "x" }, "<C-Space>", function()
  if vim.fn.mode() ~= "n" then
    feed("<Esc>")
  end

  _G.KibotToggleTerminal()
end, { desc = "Toggle terminal fallback" })

map("t", "<C-Space>", [[<C-\><C-n><cmd>lua KibotToggleTerminal()<CR>]], { desc = "Toggle terminal fallback" })
