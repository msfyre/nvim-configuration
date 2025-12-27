local module = {}

--- @param plugin string Plugin file written in the require format
function module.LoadPlugin(plugin)
	local loadable, result = pcall(require, plugin)

	if loadable then
		return result
	else
		return vim.notify(result, "error", {
			title = "Failed to load plugin!",
		})
	end
end

return module
