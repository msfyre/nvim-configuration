local module = {}

--- @param plugin string Plugin file written in the require format
function module.LoadPlugin(plugin)
	local loadable, result = pcall(require, plugin)

	if loadable then
		return result
	else
		vim.notify(
			("require('%s') failed:\n%s"):format(plugin, result),
			vim.log.levels.ERROR,
			{ title = "Failed to load plugin!" }
		)

		return nil
	end
end

return module
