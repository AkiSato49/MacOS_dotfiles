return {
	"sphamba/smear-cursor.nvim",

	opts = {
		stiffness = 0.8, -- 0.6      [0, 1]
		trailing_stiffness = 0.5, -- 0.4      [0, 1]
		stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
		trailing_stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
		distance_stop_animating = 0.5, -- 0.1      > 0
		time_interval = 3,
		-- Smear cursor when switching buffers
		smear_between_buffers = true,

		-- Smear cursor when moving within line or to neighbor lines
		smear_between_neighbor_lines = true,

		-- Use floating windows to display smears over wrapped lines or outside buffers.
		-- May have performance issues with other plugins.
		use_floating_windows = true,

		-- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
		-- Smears will blend better on all backgrounds.
		legacy_computing_symbols_support = true,
		transparent_bg_fallback_color = "#303030",
	},
}
