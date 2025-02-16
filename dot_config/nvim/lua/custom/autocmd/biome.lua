local function code_action_sync(client, bufnr, cmd)
	-- https://github.com/golang/tools/blob/gopls/v0.11.0/gopls/doc/vim.md#imports
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { cmd }, diagnostics = {} }
	-- gopls のドキュメントでは `vim.lsp.buf_request_sync` を使っているが、
	-- ここでは対象 Language Server を1つに絞るために `vim.lsp.Client` の `request_sync` を使う
	local res = client.request_sync("textDocument/codeAction", params, 3000, bufnr)
	for _, r in pairs(res and res.result or {}) do
		if r.edit then
			local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
			vim.lsp.util.apply_workspace_edit(r.edit, enc)
		end
	end
end

---@param client vim.lsp.Client
---@param bufnr integer
local function organize_imports_sync(client, bufnr)
	code_action_sync(client, bufnr, "source.organizeImports")
end

---@param client vim.lsp.Client
---@param bufnr integer
local function fix_all_sync(client, bufnr)
	code_action_sync(client, bufnr, "source.fixAll")
end

---@type table<string, fun(client: vim.lsp.Client, bufnr: integer)[]>
local save_handlers_by_client_name = {
	biome = { fix_all_sync, organize_imports_sync },
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		-- アタッチされた LSP クライアントを取得
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local bufnr = args.buf

		-- アタッチされたクライアント名がテーブルにあれば処理を仕込む
		local save_handlers = save_handlers_by_client_name[client.name]
		if save_handlers then
			-- このバッファにのみ有効な BufWritePre の autocmd を作る
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					local shouldSleep = false
					for _, handler in ipairs(save_handlers) do
						if shouldSleep then
							-- 連続で codeAction を実行するときだけ sleep を挟む
							vim.cmd("sleep 10m")
						else
							shouldSleep = true
						end
						handler(client, bufnr)
					end
				end,
			})
		end
	end,
})
