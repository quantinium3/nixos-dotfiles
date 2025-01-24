require('which-key').setup()
require('which-key').add({
    mode = { "n", "v" },     -- NORMAL and VISUAL mode
    { "<leader>c", desc = "[C]ode", },
    { "<leader>d", desc = "[D]ocument", },
    { "<leader>g", desc = "[G]it", },
    { "<leader>h", desc = "More git", },
    { "<leader>r", desc = "[R]ename", },
    { "<leader>s", desc = "[S]earch", },
    { "<leader>w", desc = "[W]orkspace", },
    {
        "<leader>lvs",
        desc = "Run live-server as a background process",
    },
    { "<leader>u", desc = "Open UndoTree" },
    { "<leader>a", desc = "Mark a harpoon file" },
    { "<C-e>",     desc = "Toggle harpoon menu" },
    { "<C-h>",     desc = "jump to 1st file" },
    { "<C-j>",     desc = "jump to 2nd file" },
    { "<C-k>",     desc = "jump to 3rd file" },
    { "<C-l>",     desc = "jump to 4th file" },
})

