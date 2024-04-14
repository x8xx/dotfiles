-- local function map(mode, lhs, rhs, opts)
-- 	local options = {noremap = true}
--     if opts then options = vim.tbl_extend('force', options, opts) end
--     vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end

vim.api.nvim_set_keymap("n", "<leader>5", ":lua require'dap'.continue()<CR>", { noremap=true})
vim.api.nvim_set_keymap("n", "<leader>6", ":lua require'dap'.step_over()<CR>", { noremap=true})
vim.api.nvim_set_keymap("n", "<leader>7", ":lua require'dap'.step_into()<CR>", { noremap=true})
vim.api.nvim_set_keymap("n", "<leader>8", ":lua require'dap'.step_out()<CR>", { noremap=true})
vim.api.nvim_set_keymap("n", "<C-b>", ":lua require'dap'.toggle_breakpoint()<CR>", { noremap=true})
vim.api.nvim_set_keymap("n", "<C-b>c", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { noremap=true})
vim.api.nvim_set_keymap("n", "<leader>l", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { noremap=true})

-- dap-ui key map
vim.api.nvim_set_keymap("n", "<leader>4", ":lua require'dapui'.toggle()<CR>", { noremap=true})
vim.api.nvim_set_keymap("n", "<leader><leader>df", ":lua require'dapui'.eval()<CR>", { noremap=true})

-- dap-go key map
vim.api.nvim_set_keymap("n", "<leader>td", ":lua require'dap-go'.debug_test()<CR>", { noremap=true })
