vim.g.mapleader = " "

-- vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap=true})
vim.api.nvim_set_keymap("i", "<C-c>", "<C-]><C-c>", {noremap=true})
vim.api.nvim_set_keymap("n", "<Tab>", "gt", {noremap=true})
vim.api.nvim_set_keymap("n", "<S-Tab>", "gT", {noremap=true})

vim.api.nvim_set_keymap("n", "H", "<C-w>h", {noremap=true})
vim.api.nvim_set_keymap("n", "J", "<C-w>j", {noremap=true})
vim.api.nvim_set_keymap("n", "K", "<C-w>k", {noremap=true})
vim.api.nvim_set_keymap("n", "L", "<C-w>l", {noremap=true})
vim.api.nvim_set_keymap("n", "zj", "18j", {noremap=true})
vim.api.nvim_set_keymap("n", "zk", "18k", {noremap=true})
vim.api.nvim_set_keymap("i", "<C-f>", "<Right>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-y>", "y`m", {noremap=true})

vim.api.nvim_set_keymap("n", "x", "\"_x", {noremap=true})
vim.api.nvim_set_keymap("n", "X", "\"_X", {noremap=true})
vim.keymap.set("n", "dd", function()
  local line = vim.api.nvim_get_current_line()
  if string.match(line, '^%s*$') then
    vim.cmd('normal! "_dd')
  else
    vim.cmd('normal! dd')
  end
end, { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>1", ":<C-u>b #<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "<leader>2", ":<C-u>CopilotChatOpen<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>2", "<cmd>lua require'CopilotChat'.open({ selection = require'CopilotChat.select'.buffer })<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>3", ":<C-u>noh<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>4", "/- (x).*<CR>", {noremap=true})

--word search
vim.api.nvim_set_keymap("n", "#", "*", {noremap=true})
vim.api.nvim_set_keymap("n", "*", "#", {noremap=true})

--deol
vim.api.nvim_set_keymap("n", "<leader>o", ":<C-u>Deol -split=floating -winheight=55 -winwidth=160<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "<leader>o", ":<C-u>:call deol#start({'split': 'floating', 'winheight': 55, 'winwidth': 160})<CR>", {noremap=true})
vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", {noremap=true})
vim.api.nvim_set_keymap("t", "<C-\\>", "<C-\\><C-n>", {noremap=true})
-- vim.api.nvim_set_keymap("t", "<C-\\>q", "<C-\\><C-n>:q<CR>", {noremap=true}):wq

--neogit
-- vim.api.nvim_set_keymap("n", "<leader>", ":<C-u>Neogit<CR>", {noremap=true})

--yanky
vim.api.nvim_set_keymap("n", "p", "<Plug>(YankyPutAfter)", {noremap=true})
vim.api.nvim_set_keymap("n", "P", "<Plug>(YankyPutBefore)", {noremap=true})
vim.api.nvim_set_keymap("n", "gp", "<Plug>(YankyGPutAfter)", {noremap=true})
vim.api.nvim_set_keymap("n", "gP", "<Plug>(YankyGPutBefore)", {noremap=true})

--telescope
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>lua require'telescope.builtin'.buffers({ cwd=vim.fn.getcwd(), cwd_only=true, })<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>ab", "<cmd>lua require'telescope.builtin'.buffers({})<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>g", ":<C-u>Telescope live_grep<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>ag", ":<C-u>Telescope ast_grep<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>lua require'telescope'.extensions.file_browser.file_browser({path = '%:p:h'})<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>y", ":<C-u>Telescope yank_history<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "<leader>fh", ":<C-u>Telescope help_tags<CR>", {noremap=true})

--Neotree
-- vim.api.nvim_set_keymap("n", "<leader>n", ":<C-u>Neotree<CR>", {noremap=true})

-- Copilot
vim.api.nvim_set_keymap("n", "<leader>c", ":Ccq<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>a", ":Sccap<CR>", {noremap=true})

-- mycommand
vim.api.nvim_set_keymap("n", "<leader>d", ":Bd<CR>", {noremap=true})

--todo
vim.api.nvim_set_keymap("v", "2", ":s/^/- (x) /<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "q", ":s/^- (x) /- (\\/) /<CR>", {noremap=true})
vim.api.nvim_set_keymap("v", "a", ":s/^- (\\/) /- (x) /<CR>", {noremap=true})
