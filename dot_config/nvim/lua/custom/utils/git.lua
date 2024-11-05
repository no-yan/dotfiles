local M = {}

-- Runs `git blame` for a specified line range or the entire file in a vertical split.
-- If line range (line1, line2) is provided, blames that range; otherwise, blames the entire file.
function M.GitBlameRange(line1, line2)
	local file_dir = vim.fn.expand("%:p:h") -- Directory of the current file
	local file_name = vim.fn.expand("%:t") -- Filename of the current file

	local command
	if line1 and line2 then
		command = "git -C " .. vim.fn.shellescape(file_dir) .. " blame -L " .. line1 .. "," .. line2 .. " " .. file_name
	else
		command = "git -C " .. vim.fn.shellescape(file_dir) .. " blame " .. file_name
	end

	-- Open a vertical split and execute the git blame command in a terminal
	vim.cmd("vsplit | term " .. command)
end

return M
