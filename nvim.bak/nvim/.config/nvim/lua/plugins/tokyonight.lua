return {
  "folke/tokyonight.nvim",
  lazy = true,
  opts = {
    style = "night",
    light_style = "day",
    on_colors = function(colors)
      -- Deep black-inspired background tones
      colors.bg = "#131313"
      colors.bg_dark = "#0f0f0f"
      colors.bg_float = "#1a1a1a"
      colors.bg_sidebar = "#161616"
      colors.bg_popup = "#181818"
      colors.bg_statusline = "#1c1c1c"
      colors.bg_highlight = "#1f1f1f"

      -- Slightly muted foreground for a softer look
      colors.fg = "#c8c8c8" -- was #e0e0e0
      colors.fg_dark = "#a8a8a8" -- was #bbbbbb
      colors.fg_gutter = "#2c2c2c"

      -- Comments mid-gray for softer tone
      colors.comment = "#555555"
    end,
  },
}
