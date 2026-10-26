local lush = require("lush")
local hsl = lush.hsl

local pink = hsl("#E6BCC8") -- comments, line numbers
local teal = hsl("#A5CED5") -- untracked files in the Snacks explorer

---@diagnostic disable: undefined-global
return lush(function(injected)
	local sym = injected.sym
	return {
		-- Transparent background
		Normal({ bg = "NONE" }),
		NormalNC({ bg = "NONE" }),
		SignColumn({ bg = "NONE" }),
		EndOfBuffer({ bg = "NONE" }),
		MsgArea({ bg = "NONE" }),
		FoldColumn({ bg = "NONE" }),
		CursorLineNr({ bg = "NONE" }),
		NormalFloat({ bg = "NONE" }),
		FloatBorder({ bg = "NONE" }),
		StatusLine({ bg = "NONE" }),
		StatusLineNC({ bg = "NONE" }),
		VertSplit({ bg = "NONE" }),

		-- Comments and line numbers
		Comment({ fg = pink, gui = "italic" }),
		sym("@comment")({ Comment }),
		LineNr({ Comment }),

		-- Snacks explorer: untracked files
		SnacksPickerGitStatusUntracked({ fg = teal }),
	}
end)
