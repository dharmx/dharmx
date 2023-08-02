local Color = {}

local std = require("core.std")
local functional = require("core.functional")

local named_colors = {
  aliceblue = "F0F8FF",
  antiquewhite = "FAEBD7",
  aqua = "0FF",
  aquamarine = "7FFFD4",
  azure = "F0FFFF",
  beige = "F5F5DC",
  bisque = "FFE4C4",
  black = "000",
  blanchedalmond = "FFEBCD",
  blue = "00F",
  blueviolet = "8A2BE2",
  brown = "A52A2A",
  burlywood = "DEB887",
  burntsienna = "EA7E5D",
  cadetblue = "5F9EA0",
  chartreuse = "7FFF00",
  chocolate = "D2691E",
  coral = "FF7F50",
  cornflowerblue = "6495ED",
  cornsilk = "FFF8DC",
  crimson = "DC143C",
  cyan = "0FF",
  darkblue = "00008B",
  darkcyan = "008B8B",
  darkgoldenrod = "B8860B",
  darkgray = "A9A9A9",
  darkgreen = "006400",
  darkgrey = "A9A9A9",
  darkkhaki = "BDB76B",
  darkmagenta = "8B008B",
  darkolivegreen = "556b2F",
  darkorange = "FF8C00",
  darkorchid = "9932CC",
  darkred = "8B0000",
  darksalmon = "E9967A",
  darkseagreen = "8FBC8F",
  darkslateblue = "483D8B",
  darkslategray = "2F4F4F",
  darkslategrey = "2F4F4F",
  darkturquoise = "00CED1",
  darkviolet = "9400d3",
  deeppink = "FF1493",
  deepskyblue = "00BFFF",
  dimgray = "696969",
  dimgrey = "696969",
  dodgerblue = "1E90FF",
  firebrick = "B22222",
  floralwhite = "FFFAF0",
  forestgreen = "228B22",
  fuchsia = "F0F",
  gainsboro = "DCDCDC",
  ghostwhite = "F8F8FF",
  gold = "FFD700",
  goldenrod = "DAA520",
  gray = "808080",
  green = "008000",
  greenyellow = "ADFF2F",
  grey = "808080",
  honeydew = "F0FFF0",
  hotpink = "FF69B4",
  indianred = "CD5C5C",
  indigo = "4B0082",
  ivory = "FFFFF0",
  khaki = "F0E68C",
  lavender = "E6E6FA",
  lavenderblush = "FFF0F5",
  lawngreen = "7CFC00",
  lemonchiffon = "FFFACD",
  lightblue = "ADD8E6",
  lightcoral = "F08080",
  lightcyan = "E0FFFF",
  lightgoldenrodyellow = "FAFAD2",
  lightgray = "D3D3D3",
  lightgreen = "90EE90",
  lightgrey = "D3D3D3",
  lightpink = "FFB6C1",
  lightskyblue = "87CEFA",
  lightslategray = "789",
  lightslategrey = "789",
  lightsteelblue = "B0C4DE",
  lightyellow = "FFFFE0",
  lime = "0F0",
  limegreen = "32CD32",
  linen = "FAF0E6",
  magenta = "F0F",
  maroon = "800000",
  mediumaquamarine = "66CDAA",
  mediumblue = "0000CD",
  mediumorchid = "BA55D3",
  mediumpurple = "9370DB",
  mediumseagreen = "3CB371",
  mediumslateblue = "7B68EE",
  mediumspringgreen = "00FA9A",
  mediumturquoise = "48D1CC",
  mediumvioletred = "C71585",
  midnightblue = "191970",
  mintcream = "F5FFFA",
  mistyrose = "FFE4E1",
  moccasin = "FFE4B5",
  navajowhite = "FFDEAD",
  navy = "000080",
  oldlace = "FDF5E6",
  olive = "808000",
  olivedrab = "6B8E23",
  orange = "FFA500",
  orangered = "FF4500",
  orchid = "DA70D6",
  palegoldenrod = "EEE8AA",
  palegreen = "98FB98",
  paleturquoise = "AFEEEE",
  palevioletred = "DB7093",
  papayawhip = "FFEFD5",
  peachpuff = "FFDAB9",
  peru = "CD853F",
  pink = "FFC0CB",
  plum = "DDA0DD",
  powderblue = "B0E0E6",
  purple = "800080",
  rebeccapurple = "663399",
  red = "F00",
  rosybrown = "BC8F8F",
  royalblue = "4169E1",
  saddlebrown = "8B4513",
  salmon = "FA8072",
  sandybrown = "F4A460",
  seagreen = "2E8B57",
  seashell = "FFF5EE",
  sienna = "A0522D",
  silver = "C0C0C0",
  skyblue = "87CEEB",
  slateblue = "6A5ACD",
  slategray = "708090",
  slategrey = "708090",
  snow = "FFFAFA",
  springgreen = "00FF7F",
  steelblue = "4682B4",
  tan = "D2B48C",
  teal = "008080",
  thistle = "D8BFD8",
  tomato = "FF6347",
  turquoise = "40E0D0",
  violet = "EE82EE",
  wheat = "F5DEB3",
  white = "FFF",
  whitesmoke = "F5F5F5",
  yellow = "FF0",
  yellowgreen = "9ACD32",
}

local function limit(c, a, op)
  if op == "i" then
    return (c + a) > 100 and 100 or c + a
  elseif op == "d" then
    return (c - a) < 0 and 0 or c - a
  end
  error("operation should be either i or, d", 5)
end

local function in_range(number, finish)
  assert(number, "number should not be nil")
  local temp = number

  if type(number) == "string" and number:find("%.") and tonumber(number) == 1 then
    number = tonumber(number) * 100 .. "%"
  end

  if type(number) == "string" and number:find("%%") then
    temp = (tonumber(number:sub(1, #number - 1)) * finish) / 100
  end

  assert(temp >= 0 and temp <= finish, "number should be between 0-255/0-1/0-100")
  return temp
end

function Color:new(params)
  local colors = functional.if_nil(params, { r = 0, g = 0, b = 0 })
  if colors.name then
    local c = named_colors[colors.name]
    assert(c, colors.name .. " is not a named color")
    colors = Color.hex2rgb(c)
  elseif colors.hex then
    colors = Color.hex2rgb(colors.hex)
  elseif colors.int then
    colors = Color.hex2rgb(string.format("#%06X", colors.int))
  elseif colors.h and colors.s and colors.l then
    colors = Color.hsl2rgb(colors.h, colors.s, colors.l)
  else
    colors.r = math.floor(in_range(colors.r, 255))
    colors.g = math.floor(in_range(colors.g, 255))
    colors.b = math.floor(in_range(colors.b, 255))
  end

  self.__index = self
  setmetatable(colors, self)
  return colors
end

function Color:get_named()
  for name, c in pairs(named_colors) do
    ---@diagnostic disable-next-line: undefined-field
    if c == self:to_hex():upper() then return name end
  end
  return nil
end

function Color:to_perc(number)
  local c = {
    r = (self.r / 255) * 100,
    g = (self.g / 255) * 100,
    b = (self.b / 255) * 100,
  }
  if number then return c end
  c.r = c.r .. "%"
  c.g = c.g .. "%"
  c.b = c.b .. "%"
  return c
end

function Color:to_float()
  local floating = {}
  for key, value in pairs(self:to_perc()) do
    local float_done = tonumber(value:sub(1, #value - 1)) / 100
    floating[key] = float_done == 1 and "1.0" or string.format("%.2F", float_done)
  end
  return floating
end

function Color:to_hex(prefix)
  local prefix_sym = prefix and "#" or ""
  local function callback(item) return item:len() == 1 and item:rep(2) or item end
  local hex_tbl = std.tbl_map(callback, {
    string.format("%02X", self.r),
    string.format("%02X", self.g),
    string.format("%02X", self.b),
  })
  return prefix_sym .. table.concat(hex_tbl)
end

function Color:to_int() return self.r .. self.g .. self.b end

function Color:to_hsl(unit)
  local c = self:to_float()
  local r = tonumber(c.r)
  local g = tonumber(c.g)
  local b = tonumber(c.b)
  assert(type(r) == "number" and type(g) == "number" and type(c) == "number")

  local max = math.max(r, g, b)
  local min = math.min(r, g, b)
  local h = (max + min) / 2
  local l = h
  local s = h

  if max == min then
    h = 0
    s = 0
  else
    local diff = max - min
    s = l > 0.5 and diff / (2 - max - min) or diff / (max + min)
    if max == r then
      h = (g - b) / diff + (g < b and 6 or 0)
    elseif max == self.g then
      h = (b - r) / diff + 2
    elseif max == b then
      h = (r - g) / diff + 4
    end
    h = h / 6
  end
  return unit
      and {
        h = math.ceil(h * 360) .. "deg",
        s = math.ceil(s * 100) .. "%",
        l = math.ceil(l * 100) .. "%",
      }
    or { h = h, s = s, l = l }
end

function Color:inc_red(a)
  local c = self:to_perc(true)
  return Color:new({
    r = limit(c.r, a, "i") .. "%",
    g = c.g .. "%",
    b = c.b .. "%",
  })
end

function Color:inc_green(a)
  local c = self:to_perc(true)
  return Color:new({
    r = c.r .. "%",
    g = limit(c.g, a, "i") .. "%",
    b = c.b .. "%",
  })
end

function Color:inc_blue(a)
  local c = self:to_perc(true)
  return Color:new({
    r = c.r .. "%",
    g = c.g .. "%",
    b = limit(c.b, a, "i") .. "%",
  })
end

function Color:dec_red(a)
  local c = self:to_perc(true)
  return Color:new({
    r = limit(c.r, a, "d") .. "%",
    g = c.g .. "%",
    b = c.b .. "%",
  })
end

function Color:dec_green(a)
  local c = self:to_perc(true)
  return Color:new({
    r = c.r .. "%",
    g = limit(c.g, a, "d") .. "%",
    b = c.b .. "%",
  })
end

function Color:dec_blue(a)
  local c = self:to_perc(true)
  return Color:new({
    r = c.r .. "%",
    g = c.g .. "%",
    b = limit(c.b, a, "d") .. "%",
  })
end

local function clamp(value) return math.min(1, math.max(0, value)) end

function Color:brighten(a)
  a = a == 0 and 0 or (a or 10)
  return Color:new({
    r = math.max(0, math.min(255, self.r - math.floor(255 * -(a / 100)))),
    g = math.max(0, math.min(255, self.g - math.floor(255 * -(a / 100)))),
    b = math.max(0, math.min(255, self.b - math.floor(255 * -(a / 100)))),
  })
end

function Color:lighten(a)
  a = a == 0 and 0 or (a or 10)
  local hsl = self:to_hsl()
  hsl.l = hsl.l + a / 100
  hsl.l = clamp(hsl.l)

  local rgb = Color.hsl2rgb(hsl.h, hsl.s, hsl.l)
  return Color:new({
    r = rgb.r,
    g = rgb.g,
    b = rgb.b,
  })
end

function Color:darken(a)
  a = a == 0 and 0 or (a or 10)
  local hsl = self:to_hsl()
  hsl.l = hsl.l - a / 100
  hsl.l = clamp(hsl.l)

  local rgb = Color.hsl2rgb(hsl.h, hsl.s, hsl.l)
  return Color:new({
    r = rgb.r,
    g = rgb.g,
    b = rgb.b,
  })
end

local function alter(attr, per) return math.floor(attr * (100 + per) / 100) end

function Color:shade_altered(a)
  a = a == 0 and 0 or (a or 5)
  self.r = alter(self.r, a)
  self.g = alter(self.g, a)
  self.b = alter(self.b, a)

  self.r = math.min(self.r, 255)
  self.g = math.min(self.g, 255)
  self.b = math.min(self.b, 255)
  return self
end

function Color:shade(a)
  a = a == 0 and 0 or (a or 10)
  return self:mix(Color:new({ name = "black" }), a)
end

function Color:tint(a)
  a = a == 0 and 0 or (a or 10)
  return self:mix(Color:new({ name = "white" }), a)
end

function Color:saturate(a)
  a = a == 0 and 0 or (a or 10)
  local hsl = self:to_hsl()
  hsl.s = hsl.s + a / 100
  hsl.s = clamp(hsl.s)

  local rgb = Color.hsl2rgb(hsl.h, hsl.s, hsl.l)
  return Color:new({
    r = rgb.r,
    g = rgb.g,
    b = rgb.b,
  })
end

function Color:desaturate(a)
  a = a == 0 and 0 or (a or 10)
  local hsl = self:to_hsl()
  hsl.s = hsl.s - a / 100
  hsl.s = clamp(hsl.s)

  local rgb = Color.hsl2rgb(hsl.h, hsl.s, hsl.l)
  return Color:new({
    r = rgb.r,
    g = rgb.g,
    b = rgb.b,
  })
end

function Color:spin(a)
  a = a == 0 and 0 or (a or 10)
  local hsl = self:to_hsl()
  local h = (hsl.h + a) % 360
  hsl.h = h < 0 and 360 + h or h

  local rgb = Color.hsl2rgb(hsl.h, hsl.s, hsl.l)
  return Color:new({
    r = rgb.r,
    g = rgb.g,
    b = rgb.b,
  })
end

function Color:get_complement()
  local HSL = self:to_hsl()
  return Color:new({ h = (HSL.h + 180) % 360, s = HSL.s, l = HSL.l })
end

function Color:get_triad()
  local HSL = self:to_hsl()
  local h = HSL.h
  return {
    self,
    Color:new({ h = (h + 120) % 360, s = HSL.s, l = HSL.l }),
    Color:new({ h = (h + 240) % 360, s = HSL.s, l = HSL.l }),
  }
end

function Color:get_tetrad()
  local HSL = self:to_hsl()
  local h = HSL.h
  return {
    self,
    Color:new({ h = (h + 90) % 360, s = HSL.s, l = HSL.l }),
    Color:new({ h = (h + 180) % 360, s = HSL.s, l = HSL.l }),
    Color:new({ h = (h + 270) % 360, s = HSL.s, l = HSL.l }),
  }
end

function Color:split_complement()
  local HSL = self:to_hsl()
  local h = HSL.h
  return {
    self,
    Color:new({ h = (h + 72) % 360, s = HSL.s, l = HSL.l }),
    Color:new({ h = (h + 216) % 360, s = HSL.s, l = HSL.l }),
  }
end

function Color:get_brightness() return (self.r * 299 + self.g * 587 + self.b * 114) / 1000 end

function Color:is_light() return not self:is_dark() end

function Color:is_dark() return self:get_brightness() < 128 end

function Color:get_luminance()
  local RsRGB, GsRGB, BsRGB, R, G, B
  RsRGB = self.r / 255
  GsRGB = self.g / 255
  BsRGB = self.b / 255

  if RsRGB <= 0.03928 then
    R = RsRGB / 12.92
  else
    R = ((RsRGB + 0.055) / 1.055) ^ 2.4
  end
  if GsRGB <= 0.03928 then
    G = GsRGB / 12.92
  else
    G = ((GsRGB + 0.055) / 1.055) ^ 2.4
  end
  if BsRGB <= 0.03928 then
    B = BsRGB / 12.92
  else
    B = ((BsRGB + 0.055) / 1.055) ^ 2.4
  end
  return (0.2126 * R) + (0.7152 * G) + (0.0722 * B)
end

function Color:greyscale() self:desaturate(100) end

function Color:get_readability(c)
  local sl = self:get_luminance()
  local cl = c:luminance()
  return (math.max(sl, cl) + 0.05) / (math.min(sl, cl) + 0.05)
end

local function validateWCAG2Parms(parms)
  parms = parms or { level = "AA", size = "small" }
  local level = (parms.level or "AA"):upper()
  local size = (parms.size or "small"):lower()

  if level ~= "AA" and level ~= "AAA" then level = "AA" end

  if size ~= "small" and size ~= "large" then size = "small" end
  return { level = level, size = size }
end

function Color:is_readable(c, wcag2)
  local readability = self:get_readability(c)
  local output = false
  local wcag2Parms = validateWCAG2Parms(wcag2)
  local level_size = wcag2Parms.level + wcag2Parms.size

  if level_size == "AAsmall" and level_size == "AAAlarge" then
    output = readability >= 4.5
  elseif level_size == "AAlarge" then
    output = readability >= 3
  elseif level_size == "AAAsmall" then
    output = readability >= 7
  end
  return output
end

function Color:mix(c, a)
  a = a == 0 and 0 or (a or 50)
  local value = a / 100
  return Color:new({
    r = ((c.r - self.r) * value) + self.r,
    g = ((c.g - self.g) * value) + self.g,
    b = ((c.b - self.b) * value) + self.b,
  })
end

function Color:invert() return Color:new({ name = "white" }) - self end

function Color:to_rgb()
  return {
    r = self.r,
    g = self.g,
    b = self.b,
  }
end

function Color.hex2rgb(hex)
  hex = hex:sub(1, 1) == "#" and hex:sub(2) or hex
  if hex:len() == 3 then hex = hex:sub(1, 1):rep(2) .. hex:sub(2, 2):rep(2) .. hex:sub(3, 3):rep(2) end

  return {
    r = tonumber(hex:sub(1, 2), 16),
    g = tonumber(hex:sub(3, 4), 16),
    b = tonumber(hex:sub(5, 6), 16),
  }
end

function Color.get_named_colors(prefix)
  if prefix then
    local colors = {}
    for name, value in pairs(named_colors) do
      colors[name] = "#" .. value
    end
    return colors
  end
  return named_colors
end

function Color.rand_color()
  return Color:new({
    r = math.random(0, 255),
    g = math.random(0, 255),
    b = math.random(0, 255),
  })
end

function Color.hsl2rgb(h, s, l)
  local rgb = {}

  local function hue2rgb(p, q, t)
    if t < 0 then t = t + 1 end
    if t > 1 then t = t - 1 end
    if t < 1 / 6 then return p + (q - p) * 6 * t end
    if t < 1 / 2 then return q end
    if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
    return p
  end

  if s == 0 then
    rgb.r = l
    rgb.g = l
    rgb.b = l
  else
    local q = l < 0.5 and l * (1 + s) or l + s - l * s
    local p = 2 * l - q
    rgb.r = hue2rgb(p, q, h + 1 / 3)
    rgb.g = hue2rgb(p, q, h)
    rgb.b = hue2rgb(p, q, h - 1 / 3)
  end

  return { r = math.ceil(rgb.r * 255), g = math.ceil(rgb.g * 255), b = math.ceil(rgb.b * 255) }
end

Color.__tostring = function(self, _) return self:to_hex(true) end

Color.__eq = function(self, o) return self.r == o.r and self.g == o.g and self.b == o.b end

Color.__lt = function(self, o) return std.tbl_sum(self:to_rgb()) > std.tbl_sum(o:RGB()) end

Color.__gt = function(self, o) return std.tbl_sum(self:to_rgb()) < std.tbl_sum(o:RGB()) end

Color.__add = function(self, o)
  self.r = self.r + o.r
  self.g = self.g + o.g
  self.b = self.b + o.b
  return self
end

Color.__sub = function(self, o)
  self.r = self.r - o.r
  self.g = self.g - o.g
  self.b = self.b - o.b
  return self
end

return Color
