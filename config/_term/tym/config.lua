local tym = require("tym")

-- set individually
tym.set("width", 80)
tym.set("height", 20)
tym.set("cell_height", 125)
-- tym.set('cell_width', 50)

tym.set("font", "Iosevka Nerd Font 14")

-- set by table
tym.set_config({
	shell = "/usr/bin/zsh", -- '/usr/bin/hilbish',
	cursor_shape = "block",
	autohide = true,
	padding_horizontal = 25,
	padding_vertical = 20,
	term = "xterm-256color",
	cjk_width = "narrow",
	cursor_blink_mode = "off",
})

function update_alpha(delta)
	local r, g, b, a = tym.color_to_rgba(tym.get("color_background"))
	tym.set("color_background", tym.rgba_to_color(r, g, b, math.max(math.min(1.0, a + delta), 0.0)))
end

-- dynamic opacity
tym.set_keymaps({
	["<Ctrl><Shift>Up"] = function()
		update_alpha(0.05)
	end,
	["<Ctrl><Shift>Down"] = function()
		update_alpha(-0.05)
	end,
})

-- font scaling
tym.set_hook("scroll", function(_, dy, _, _)
	if tym.check_mod_state("<Ctrl>") then
		if dy > 0 then
			s = tym.get("scale") - 10
		else
			s = tym.get("scale") + 10
		end
		tym.set("scale", s)
		tym.notify("set scale: " .. s .. "%")
		return true
	end
	if tym.check_mod_state("<Shift>") then
		update_alpha(dy < 0 and 0.05 or -0.05)
		return true
	end
end)

tym.set_keymap("<Ctrl><Shift>o", function()
	local h = tym.get("height")
	tym.set("height", h + 1)
	tym.notify("Set window height :" .. h)
end)

tym.set_keymap("<Ctrl><Shift>p", function()
	local w = tym.get("width")
	tym.set("width", w + 1)
	tym.notify("Set window width :" .. w)
end)

tym.set_keymaps({
	["<Ctrl><Shift>r"] = function()
		tym.reload()
		tym.notify("Reloaded configurations!", "TYM Terminal")
	end,
})

-- tmux leader delay fix
local remap = function(a, b)
	tym.set_keymap(a, function()
		tym.send_key(b)
	end)
end
remap("<Alt>h", "<Alt>Left") -- remap as meta key inputs
remap("<Alt>l", "<Alt>Right")
remap("<Alt><Shift>h", "<Alt><Shift>Left")
remap("<Alt><Shift>l", "<Alt><Shift>Right")

-- vim:ft=lua:nowrap:number
