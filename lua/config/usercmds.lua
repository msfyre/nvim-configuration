vim.api.nvim_create_user_command("Format", function(args)
    editor_macros.format(args)
end, {
    desc = "Run the formatter",
})
