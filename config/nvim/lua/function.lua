
function file_exists(fname)
	local stat = vim.loop.fs_stat(fname)
	return (stat and stat.type) or false
end
