return {
	settings = {
		basedpyright = {
			analysis = {
				useLibraryCodeForTypes = true,
				typeCheckingMode = "off",
				diagnosticMode = "workspace",
				autoSearchPath = true,
				inlayHints = {
					callArgumentNames = true,
				},
				extraPaths = {
					"...",
					"...",
				},
			},
			-- python = {
			-- 	venvPath = "/path/to/venv",
			-- 	venv = "venv",
			-- },
		},
	},
}
