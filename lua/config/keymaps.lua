-- Save
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Esc>:w<CR>")

local Snacks = require("snacks")

-- Lazy
vim.keymap.set("n", "<leader>L", ":Lazy<CR>")

-- Interface
vim.keymap.set("n", "<leader>e", function()
    Snacks.explorer()
end)

-- Pickers
vim.keymap.set("n", "<leader>/", function()
    Snacks.picker.grep()
end)

vim.keymap.set("n", "<leader>ff", function()
    Snacks.picker.files()
end)

vim.keymap.set("n", "<leader>fp", function()
    Snacks.picker.projects()
end)

vim.keymap.set("n", "<leader>z", function()
    Snacks.zen()
end)
