vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Explorer file
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = '[P]roject [V]iewer' })
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- init.lua or init.vim (Neovim's configuration file)
vim.api.nvim_set_keymap('x', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', 'K', ":m '>-2<CR>gv=gv", { noremap = true, silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })


vim.api.nvim_set_keymap('n', '<leader>gf', [[<Cmd>lua require('telescope.builtin').git_files()<CR>]],
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sf', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]],
    { noremap = true, silent = true })

--- undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
vim.keymap.set('n', '<leader>gf', "<cmd>Telescope git_files", { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', "<cmd>Telescope find_files", { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', "<cmd>Telescope help_tags", { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', "<cmd>Telescope grep_string", { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', "<cmd>Telescope live_grep", { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', "<cmd>Telescope diagnostics", { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', "<cmd>Telescope resume", { desc = '[S]earch [R]esume' })

