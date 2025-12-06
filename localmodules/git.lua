local Git = {}

Git.setupDone = false;

function Git.Setup()
    vim.cmd("Neogit");
end

return Git;
