local naughty = require("naughty")
local awful = require("awful")
local util = require("core.util")

local M = {
  levels = {
    ERROR = 3,
    WARNING = 2,
    NORMAL = 1,
    DEBUG = 0,
  },
  loggers = {},
  mt = {},
  _loaded = false,
}

M.defaults = { colors = true }
M.settings = util.deepcopy(M.defaults)

M.defaults.loggers = {}
M.defaults.defaultlevel = 0

for key, value in pairs(M.defaults) do
  M.settings[key] = value
end

local function log_level(message, level)
  for _, logger in ipairs(M.settings.loggers) do
    logger(message, level)
  end
end

function M.debug(message) log_level(message, 0) end

function M.log(message) log_level(message, 1) end

function M.warn(message) log_level(message, 2) end

function M.error(message) log_level(message, 3) end

function M.add_logger(logger, level)
  if level == nil then level = M.settings.defaultlevel end
  table.insert(M.settings.loggers, function(message, severity)
    if severity >= level then logger(message, severity) end
  end)
end

function M.loggers.naughty(message, severity)
  if severity == M.levels.WARNING then
    message = '<span color="#ff6">' .. message .. "</span>"
  elseif severity == M.levels.ERROR then
    message = '<span color="#f66">' .. message .. "</span>"
  end
  naughty.notify({ text = message })
end

function M.spawn(command)
  M.debug("Executing: " .. command)
  awful.spawn(command)
end

function M.loggers.stdio(message, severity) print(message) end

M.mt.__call = function(_, message) M.log(message) end
return setmetatable(M, M.mt)
