local palette = {
	base = "#1e1e2e",
	mantle = "#181825",
	crust = "#11111b",

	text = "#cdd6f4",
	subtext1 = "#bac2de",
	subtext0 = "#a6adc8",

	surface2 = "#585b70",
	surface1 = "#45475a",
	surface0 = "#313244",

	overlay2 = "#9399b2",
	overlay1 = "#7f849c",
	overlay0 = "#6c7086",

	blue = "#89b4fa",
	lavender = "#b4befe",
	sapphire = "#74c7ec",
	sky = "#89dceb",
	teal = "#94e2d5",
	green = "#a6e3a1",
	yellow = "#f9e2af",
	peach = "#fab387",
	maroon = "#eba0ac",
	red = "#f38ba8",
	mauve = "#cba6f7",
	pink = "#f5c2e7",
	flamingo = "#f2cdcd",
	rosewater = "#f5e0dc",
}

-- local palette = {
-- 	base = "#1e1e1e",
-- 	mantle = "#181818",
-- 	crust = "#111111",
--
-- 	text = "#d4d4d4",
-- 	subtext1 = "#bfbfbf",
-- 	subtext0 = "#a8a8a8",
--
-- 	surface2 = "#5c5c5c",
-- 	surface1 = "#474747",
-- 	surface0 = "#323232",
--
-- 	overlay2 = "#9a9a9a",
-- 	overlay1 = "#828282",
-- 	overlay0 = "#6e6e6e",
--
-- 	-- primary accents converted to greys
-- 	blue = "#a6a6a6",
-- 	lavender = "#b0b0b0",
-- 	sapphire = "#9c9c9c",
-- 	sky = "#b8b8b8",
-- 	teal = "#a0a0a0",
--
-- 	-- keep semantic colors (optional)
-- 	green = "#a6e3a1",
-- 	yellow = "#f9e2af",
-- 	peach = "#fab387",
-- 	maroon = "#eba0ac",
-- 	red = "#f38ba8",
-- 	mauve = "#cba6f7",
-- 	pink = "#f5c2e7",
-- 	flamingo = "#f2cdcd",
-- 	rosewater = "#f5e0dc",
-- }
--
local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "mytheme"
vim.o.termguicolors = true
vim.o.background = "dark"

-- Editor
hi("Normal", { fg = palette.text, bg = palette.base })
hi("NormalFloat", { fg = palette.text, bg = palette.mantle })
hi("FloatBorder", { fg = palette.surface2, bg = palette.mantle })
hi("CursorLine", { bg = palette.surface0 })
hi("CursorColumn", { bg = palette.surface0 })
hi("ColorColumn", { bg = palette.surface0 })
hi("CursorLineNr", { fg = palette.yellow, bold = true })
hi("LineNr", { fg = palette.overlay0 })
hi("SignColumn", { bg = palette.base })
hi("EndOfBuffer", { fg = palette.base })
hi("VertSplit", { fg = palette.surface0 })
hi("WinSeparator", { fg = palette.surface1 })
hi("StatusLine", { fg = palette.text, bg = palette.mantle })
hi("StatusLineNC", { fg = palette.overlay1, bg = palette.mantle })
hi("TabLine", { fg = palette.subtext0, bg = palette.crust })
hi("TabLineFill", { bg = palette.crust })
hi("TabLineSel", { fg = palette.blue, bg = palette.surface0, bold = true })
hi("Pmenu", { fg = palette.text, bg = palette.mantle })
hi("PmenuSel", { fg = palette.base, bg = palette.blue, bold = true })
hi("PmenuSbar", { bg = palette.surface0 })
hi("PmenuThumb", { bg = palette.surface2 })
hi("Visual", { bg = palette.surface1 })
hi("Search", { fg = palette.base, bg = palette.yellow })
hi("IncSearch", { fg = palette.base, bg = palette.peach })
hi("CurSearch", { fg = palette.base, bg = palette.peach, bold = true })
hi("MatchParen", { fg = palette.peach, bold = true })
hi("Folded", { fg = palette.subtext0, bg = palette.surface0 })
hi("FoldColumn", { fg = palette.overlay0, bg = palette.base })
hi("NonText", { fg = palette.surface1 })
hi("Whitespace", { fg = palette.surface1 })
hi("SpecialKey", { fg = palette.surface2 })
hi("Conceal", { fg = palette.overlay1 })
hi("Directory", { fg = palette.blue, bold = true })
hi("Title", { fg = palette.mauve, bold = true })
hi("ErrorMsg", { fg = palette.red, bold = true })
hi("WarningMsg", { fg = palette.yellow, bold = true })
hi("MoreMsg", { fg = palette.green, bold = true })
hi("ModeMsg", { fg = palette.green, bold = true })
hi("Question", { fg = palette.blue })

-- Syntax
hi("Comment", { fg = palette.overlay0, italic = true })
hi("Constant", { fg = palette.peach })
hi("String", { fg = palette.green })
hi("Character", { fg = palette.green })
hi("Number", { fg = palette.peach })
hi("Boolean", { fg = palette.peach })
hi("Float", { fg = palette.peach })

hi("Identifier", { fg = palette.lavender })
hi("Function", { fg = palette.blue })

hi("Statement", { fg = palette.mauve })
hi("Conditional", { fg = palette.mauve })
hi("Repeat", { fg = palette.mauve })
hi("Label", { fg = palette.sapphire })
hi("Operator", { fg = palette.sky })
hi("Keyword", { fg = palette.mauve, italic = true })
hi("Exception", { fg = palette.red })

hi("PreProc", { fg = palette.pink })
hi("Include", { fg = palette.mauve })
hi("Define", { fg = palette.mauve })
hi("Macro", { fg = palette.pink })
hi("PreCondit", { fg = palette.pink })

hi("Type", { fg = palette.yellow })
hi("StorageClass", { fg = palette.yellow })
hi("Structure", { fg = palette.yellow })
hi("Typedef", { fg = palette.yellow })

hi("Special", { fg = palette.flamingo })
hi("SpecialChar", { fg = palette.flamingo })
hi("Tag", { fg = palette.blue })
hi("Delimiter", { fg = palette.subtext1 })
hi("SpecialComment", { fg = palette.overlay1 })
hi("Debug", { fg = palette.red })

hi("Underlined", { underline = true })
hi("Bold", { bold = true })
hi("Italic", { italic = true })

hi("Error", { fg = palette.red, bold = true })
hi("Todo", { fg = palette.base, bg = palette.yellow, bold = true })

-- Diagnostics
hi("DiagnosticError", { fg = palette.red })
hi("DiagnosticWarn", { fg = palette.yellow })
hi("DiagnosticInfo", { fg = palette.sky })
hi("DiagnosticHint", { fg = palette.teal })
hi("DiagnosticOk", { fg = palette.green })

hi("DiagnosticVirtualTextError", { fg = palette.red, bg = palette.surface0 })
hi("DiagnosticVirtualTextWarn", { fg = palette.yellow, bg = palette.surface0 })
hi("DiagnosticVirtualTextInfo", { fg = palette.sky, bg = palette.surface0 })
hi("DiagnosticVirtualTextHint", { fg = palette.teal, bg = palette.surface0 })

hi("DiagnosticUnderlineError", { undercurl = true, sp = palette.red })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = palette.yellow })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = palette.sky })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = palette.teal })

-- Diff
hi("DiffAdd", { bg = "#283b4d" })
hi("DiffChange", { bg = "#363a4f" })
hi("DiffDelete", { bg = "#47242b" })
hi("DiffText", { bg = "#4c4f69" })

-- Git signs style groups
hi("Added", { fg = palette.green })
hi("Changed", { fg = palette.yellow })
hi("Removed", { fg = palette.red })

-- Spell
hi("SpellBad", { undercurl = true, sp = palette.red })
hi("SpellCap", { undercurl = true, sp = palette.blue })
hi("SpellRare", { undercurl = true, sp = palette.mauve })
hi("SpellLocal", { undercurl = true, sp = palette.teal })

-- Treesitter / modern groups
hi("@comment", { link = "Comment" })
hi("@string", { link = "String" })
hi("@number", { link = "Number" })
hi("@boolean", { link = "Boolean" })
hi("@constant", { link = "Constant" })
hi("@constant.builtin", { fg = palette.peach, italic = true })
hi("@function", { link = "Function" })
hi("@function.builtin", { fg = palette.blue, italic = true })
hi("@constructor", { fg = palette.sapphire })
hi("@parameter", { fg = palette.rosewater })
hi("@property", { fg = palette.lavender })
hi("@field", { fg = palette.lavender })
hi("@variable", { fg = palette.text })
hi("@variable.builtin", { fg = palette.red, italic = true })
hi("@type", { link = "Type" })
hi("@type.builtin", { fg = palette.yellow, italic = true })
hi("@keyword", { link = "Keyword" })
hi("@keyword.function", { fg = palette.mauve, italic = true })
hi("@keyword.return", { fg = palette.mauve, italic = true })
hi("@operator", { link = "Operator" })
hi("@punctuation.delimiter", { fg = palette.subtext1 })
hi("@punctuation.bracket", { fg = palette.overlay1 })
hi("@tag", { fg = palette.blue })
hi("@tag.attribute", { fg = palette.teal })
hi("@tag.delimiter", { fg = palette.overlay1 })

-- LSP references
hi("LspReferenceText", { bg = palette.surface0 })
hi("LspReferenceRead", { bg = palette.surface0 })
hi("LspReferenceWrite", { bg = palette.surface0 })

-- Telescope
hi("TelescopeNormal", { fg = palette.text, bg = palette.mantle })
hi("TelescopeBorder", { fg = palette.surface2, bg = palette.mantle })
hi("TelescopePromptNormal", { fg = palette.text, bg = palette.surface0 })
hi("TelescopePromptBorder", { fg = palette.surface2, bg = palette.surface0 })
hi("TelescopePromptTitle", { fg = palette.base, bg = palette.blue, bold = true })
hi("TelescopePreviewTitle", { fg = palette.base, bg = palette.green, bold = true })
hi("TelescopeResultsTitle", { fg = palette.base, bg = palette.mauve, bold = true })
hi("TelescopeSelection", { bg = palette.surface0, bold = true })
hi("TelescopeMatching", { fg = palette.peach, bold = true })

-- NvimTree
hi("NvimTreeNormal", { fg = palette.text, bg = palette.mantle })
hi("NvimTreeNormalNC", { fg = palette.text, bg = palette.mantle })
hi("NvimTreeRootFolder", { fg = palette.mauve, bold = true })
hi("NvimTreeFolderName", { fg = palette.blue })
hi("NvimTreeOpenedFolderName", { fg = palette.blue, bold = true })
hi("NvimTreeEmptyFolderName", { fg = palette.overlay1 })
hi("NvimTreeIndentMarker", { fg = palette.surface2 })
hi("NvimTreeVertSplit", { fg = palette.mantle, bg = palette.mantle })
hi("NvimTreeWinSeparator", { fg = palette.mantle, bg = palette.mantle })
hi("NvimTreeCursorLine", { bg = palette.surface0 })
hi("NvimTreeSpecialFile", { fg = palette.pink, underline = true })
hi("NvimTreeImageFile", { fg = palette.flamingo })
hi("NvimTreeGitDirty", { fg = palette.yellow })
hi("NvimTreeGitNew", { fg = palette.green })
hi("NvimTreeGitDeleted", { fg = palette.red })

-- blink.cmp / completion
hi("BlinkCmpMenu", { fg = palette.text, bg = palette.mantle })
hi("BlinkCmpMenuBorder", { fg = palette.surface2, bg = palette.mantle })
hi("BlinkCmpMenuSelection", { fg = palette.base, bg = palette.blue, bold = true })
hi("BlinkCmpScrollBarThumb", { bg = palette.surface2 })
hi("BlinkCmpScrollBarGutter", { bg = palette.surface0 })
hi("BlinkCmpLabel", { fg = palette.text })
hi("BlinkCmpLabelDeprecated", { fg = palette.overlay1, strikethrough = true })
hi("BlinkCmpLabelMatch", { fg = palette.peach, bold = true })
hi("BlinkCmpKind", { fg = palette.mauve })
hi("BlinkCmpSource", { fg = palette.overlay1 })

-- WhichKey
hi("WhichKey", { fg = palette.mauve })
hi("WhichKeyGroup", { fg = palette.blue })
hi("WhichKeyDesc", { fg = palette.text })
hi("WhichKeySeparator", { fg = palette.overlay0 })
hi("WhichKeyFloat", { bg = palette.mantle })
hi("WhichKeyBorder", { fg = palette.surface2, bg = palette.mantle })

-- ToggleTerm
hi("ToggleTerm", { fg = palette.text, bg = palette.base })
hi("ToggleTermNormal", { fg = palette.text, bg = palette.base })
hi("ToggleTermBorder", { fg = palette.surface1, bg = palette.base })
hi("ToggleTermTitle", { fg = palette.blue, bold = true })

-- Terminal
hi("TermCursor", { fg = palette.base, bg = palette.text })
hi("TermCursorNC", { fg = palette.base, bg = palette.overlay1 })
