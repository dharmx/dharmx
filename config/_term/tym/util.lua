local M = {}
local tym = require("tym")

function M.scale(_, dy, _, _)
  if tym.check_mod_state("<Ctrl>") then
    local amount = tym.get("scale") + 10
    if dy > 0 then amount = tym.get("scale") - 10 end
    tym.set("scale", amount)
    return true
  end
  if tym.check_mod_state("<Shift>") then
    M.alpha(dy < 0 and 0.05 or -0.05)
    return true
  end
end

function M.alpha(delta)
  local red, green, blue, alpha = tym.color_to_rgba(tym.get("color_background"))
  tym.set("color_background", tym.rgba_to_color(red, green, blue, math.max(math.min(1.0, alpha + delta), 0.0)))
end

return M
