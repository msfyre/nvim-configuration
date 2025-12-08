local neotree = {}

neotree.isOpen = false;

neotree.activeWindow = nil;

---@param header string?
---@param msg string
---@param level string
local function log(header, msg, level)
    local msgheader = string.format("[Neotree] - %s", header) or "[Neotree]"

	vim.notify(
		msg,
		level or "info",
		{
			title = msgheader
		}
	);
end

local function find_neotree_win()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local ok, ft = pcall(vim.api.nvim_buf_get_option, buf, "filetype")
        if ok and (ft == "neo-tree" or ft == "neo_tree" or ft == "neo") then
            return win
        end
        local name = vim.api.nvim_buf_get_name(buf)
        if name:match("[Nn]eo[_-]?tree") or name:match("Neotree") then
            return win
        end
    end
    return nil
end

function neotree.Open()
    if (neotree.isOpen and neotree.activeWindow ~= nil and vim.api.nvim_win_is_valid(neotree.activeWindow)) then
        vim.api.nvim_set_current_win(neotree.activeWindow);
        return;
    end

    vim.cmd("Neotree reveal");

    local win = find_neotree_win();
    if (win == nil) then
        log("Error", "Failed to open Neotree window.", "error");
        return;
    end

    neotree.activeWindow = win;
    neotree.isOpen = true;

    log("Opened!", "Neotree opened.", "Info");
end

function neotree.Close()
	if (not neotree.isOpen or neotree.activeWindow == nil) then
        return;
    end

    if (vim.api.nvim_win_is_valid(neotree.activeWindow)) then
        vim.api.nvim_win_close(neotree.activeWindow, true);
    end

    neotree.activeWindow = nil;
    neotree.isOpen = false;

    log("Closed!", "Neotree closed.", "Info");
end

function neotree.Toggle()
	if (neotree.isOpen) then
		neotree.Close();
	else
		neotree.Open();
	end
end

function neotree.Refresh()
	if (neotree.isOpen and neotree.activeWindow ~= nil and vim.api.nvim_win_is_valid(neotree.activeWindow)) then
		vim.api.nvim_set_current_win(neotree.activeWindow);
		vim.cmd("Neotree action=refresh")

		vim.notify("Refreshed!", "info", {
			title = "Neotree"
		})
	end
end

return neotree
