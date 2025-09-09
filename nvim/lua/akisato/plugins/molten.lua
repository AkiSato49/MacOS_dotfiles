return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
		dependencies = { "3rd/image.nvim" },
		build = ":UpdateRemotePlugins",
		ft = { "python", "markdown", "quarto" },
		lazy = false,
		init = function()
			-- these are examples, not defaults. Please see the readme
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
			-- I find auto open annoying, keep in mind setting this option will require setting
			-- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
			vim.g.molten_auto_open_output = true

			-- this guide will be using image.nvim
			-- Don't forget to setup and install the plugin if you want to view image outputs
			vim.g.molten_image_provider = "image.nvim"

			-- optional, I like wrapping. works for virt text and the output window
			vim.g.molten_wrap_output = true

			-- Output as virtual text. Allows outputs to always be shown, works with images, but can
			-- be buggy with longer images
			vim.g.molten_virt_text_output = true

			-- this will make it so the output shows up below the \`\`\` cell delimiter
			vim.g.molten_virt_lines_off_by_1 = true
			vim.keymap.set(
				"n",
				"<leader>me",
				":MoltenEvaluateOperator<CR>",
				{ desc = "evaluate operator", silent = true }
			)
			vim.keymap.set(
				"n",
				"<leader>mo",
				":noautocmd MoltenEnterOutput<CR>",
				{ desc = "open output window", silent = true }
			)
			vim.keymap.set("n", "<leader>mr", ":MoltenReevaluateCell<CR>", { desc = "re-eval cell", silent = true })
			vim.keymap.set(
				"v",
				"<leader>m",
				":<C-u>MoltenEvaluateVisual<CR>gv",
				{ desc = "execute visual selection", silent = true }
			)
			vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>", { desc = "close output window", silent = true })
			vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", { desc = "delete Molten cell", silent = true })

			-- if you work with html outputs:
			vim.keymap.set(
				"n",
				"<leader>mx",
				":MoltenOpenInBrowser<CR>",
				{ desc = "open output in browser", silent = true }
			)
			-- run current code block, either a #%% block or a ```python block

			-- ADD (e.g. in your Molten config/init)
			vim.keymap.set("n", "<leader>mO", function()
				vim.cmd([[
          tabnew
          noautocmd MoltenEnterOutput
          only
        ]])
			end, { desc = "Molten: output fullscreen tab", silent = true })
			vim.keymap.set("n", "<leader>mb", function()
				local ft = vim.bo.filetype
				local s, e
				if ft == "markdown" or ft == "quarto" then
					s = vim.fn.search("^```\\s*\\(python\\|py\\)\\>", "bnW")
					if s == 0 then
						vim.notify("No ```python fence found above cursor", vim.log.levels.WARN)
						return
					end
					e = vim.fn.search("^```\\s*$", "nW")
					if e == 0 or e <= s then
						vim.notify("Closing ``` not found", vim.log.levels.ERROR)
						return
					end
					s = s + 1
					e = e - 1
				else
					s = vim.fn.search("^\\s*#\\s*%%", "bnW")
					if s == 0 then
						s = 1
					end
					local n = vim.fn.search("^\\s*#\\s*%%", "nW")
					e = (n == 0) and vim.fn.line("$") or (n - 1)
				end
				if s > e then
					vim.notify("Empty code block", vim.log.levels.WARN)
					return
				end
				vim.api.nvim_win_set_cursor(0, { s, 0 })
				vim.cmd("normal! V")
				vim.api.nvim_win_set_cursor(0, { e, 0 })
				vim.cmd("MoltenEvaluateVisual")
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
			end, { silent = true, desc = "Molten: run current code block (#%% or ```python)" })
		end,
	},
	{
		-- see the image.nvim readme for more information about configuring this plugin
		"3rd/image.nvim",
		opts = {
			backend = "kitty", -- whatever backend you would like to use
			max_width = 100,
			max_height = 12,
			max_height_window_percentage = math.huge,
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		},
	},
}
