vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(args)
        editor_macros.format(args)
    end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function(args)
        vim.notify(args.file, nil, {
            title = "Saved!",
        })
    end,
})
