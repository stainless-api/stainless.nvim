vim.lsp.config("stainless", {
	cmd = { "stainless-language-server", "--stdio" },
	filetypes = {},
	settings = {},
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "stainless.yml", "stainless.yaml", "*.stainless.yml", "openapi.yaml", "openapi.yml" },
	callback = function(args)
		if next(vim.lsp.get_clients({ bufnr = args.buf, name = "stainless" })) then
			return
		end

		vim.lsp.start(vim.lsp.config["stainless"])

		-- temporary autocmd to disable the yamlls lsp to avoid duplicative behaviour
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client.name == "yamlls" then
					vim.lsp.buf_detach_client(args.buf, client.id)
					vim.api.nvim_del_autocmd(args.id)
				end
			end,
		})
	end,
})
