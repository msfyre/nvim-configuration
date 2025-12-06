---!strict

local WelcomeMessage = {
	"Neovim ran successfully!",
	"Have a nice day!",
	"\n",
	"This neovim setup is purely written by Moonstone Fyre.",
	"(@msfyre --- 2025)"
}


local WindowModule = {}

WindowModule.isRightSidebarOpen = false;
WindowModule.isLeftSidebarOpen = false;

WindowModule.term_win = nil;
WindowModule.cava_win = nil;
WindowModule.tree_win = nil;

--#region Sidebars
function WindowModule.ToggleRightSidebar()
    local opening = not WindowModule.isRightSidebarOpen

    -- Open function
    if opening then
        -- === Open Sidebar ===
        -- Terminal window
        vim.cmd [[botright vnew]]
        vim.cmd [[vertical resize 30]]
        vim.cmd [[terminal powershell]]

        WindowModule.term_win = vim.api.nvim_get_current_win()

        -- Cava window
        vim.cmd("belowright new")
        vim.cmd("RunCava")

        WindowModule.cava_win = vim.api.nvim_get_current_win()

    else
        -- === Close Sidebar ===
        -- close cava window if exists
        if WindowModule.cava_win and vim.api.nvim_win_is_valid(WindowModule.cava_win) then
            vim.api.nvim_win_close(WindowModule.cava_win, true)
        end

        -- close terminal window if exists
        if WindowModule.term_win and vim.api.nvim_win_is_valid(WindowModule.term_win) then
            vim.api.nvim_win_close(WindowModule.term_win, true)
        end

        WindowModule.term_win = nil
        WindowModule.cava_win = nil
    end

    WindowModule.isRightSidebarOpen = opening
end

function WindowModule.ToggleLeftSidebar()
    local opening = not WindowModule.isLeftSidebarOpen;

    if (opening) then
        WindowModule.ShowFileTree();

        WindowModule.tree_win = vim.api.nvim_get_current_win();
    else
        if WindowModule.tree_win and vim.api.nvim_win_is_valid(WindowModule.tree_win) then
            vim.api.nvim_win_close(WindowModule.tree_win, true)
        end

	WindowModule.tree_win = nil;
    end

    WindowModule.isLeftSidebarOpen = opening;
end

function WindowModule.ShowFileTree()
	neotreeModule.Show();
end

function WindowModule.PrepareWindow()
    WindowModule.ToggleRightSidebar();
    WindowModule.ToggleLeftSidebar();
end

function WindowModule.ShowWelcome()
	for i, messageString in ipairs(WelcomeMessage) do
		print(messageString .. "\n");
	end
end

return WindowModule
