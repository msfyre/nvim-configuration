local M = {}

function M.format(args)
    local conform_found, conform = pcall(require, "conform")
    vim.notify("Formatting...")

    if not conform_found then
        vim.lsp.buf.format({ bufnr = args.buf })
    else
        conform.format({ bufnr = args.buf })
    end
end

return M
