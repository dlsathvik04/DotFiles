return {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name

			-- If a zls.json exists in project, respect it and don't override
			if vim.uv.fs_stat(path .. "/zls.json") then
				return
			end
		end

		-- Extend default zls settings
		client.config.settings.zls = vim.tbl_deep_extend("force", client.config.settings.zls or {}, {
			enable_autofix = true,
			enable_import_embedfile_arg = true,
			enable_snippets = true,
			warn_style = true,

			-- Optional: zig executable path
			-- zig_exe_path = "zig",

			-- Optional: zls cache dir
			-- zig_lib_path = "",
		})
	end,

	settings = {
		zls = {},
	},
}
