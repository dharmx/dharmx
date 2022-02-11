import json
from getpass import getuser
from os import getenv

from qutebrowser.api import interceptor

HOME = f"/home/{getuser()}"

XDG_CONFIG_HOME = getenv("XDG_CONFIG_HOME", f"{HOME}/.config")
XDG_CACHE_HOME = getenv("XDG_CACHE_HOME", f"{HOME}/.cache")

XDG_DATA_HOME = getenv("XDG_DATA_HOME", f"{HOME}/.local/share")
XDG_STATE_HOME = getenv("XDG_STATE_HOME", f"{HOME}/.local/state")

XDG_DOCUMENTS_DIR = getenv("XDG_DOCUMENTS_DIR", f"{HOME}/Documents")
XDG_DOWNLOAD_DIR = getenv("XDG_DOWNLOAD_DIR", f"{HOME}/Downloads")
XDG_MUSIC_DIR = getenv("XDG_MUSIC_DIR", f"{HOME}/Music")
XDG_PICTURES_DIR = getenv("XDG_PICTURES_DIR", f"{HOME}/Pictures")
XDG_TEMPLATES_DIR = getenv("XDG_TEMPLATES_DIR", f"{HOME}/Templates")
XDG_VIDEOS_DIR = getenv("XDG_VIDEOS_DIR", f"{HOME}/Videos")

XDG_CONFIG_DIRS = getenv("XDG_CONFIG_DIRS", "/etc/xdg")


# noinspection SpellCheckingInspection
def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (
        url.host() == "www.youtube.com"
        and url.path() == "/get_video_info"
        and "&adformat=" in url.query()
    ):
        info.block()


interceptor.register(filter_yt)

config.load_autoconfig(False)
config.set("content.cookies.accept", "all", "chrome-devtools://*")
config.set("content.cookies.accept", "all", "devtools://*")
config.set("content.headers.accept_language", "", "https://matchmaker.krunker.io/*")
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {"
    "upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}",
    "https://web.whatsapp.com/",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0",
    "https://accounts.google.com/*",
)
config.set(
    "content.headers.user_agent",
    "Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 "
    "Safari/537.36",
    "https://*.slack.com/*",
)
config.set("content.images", True, "chrome-devtools://*")
config.set("content.images", True, "devtools://*")
config.set("content.javascript.enabled", True, "chrome-devtools://*")
config.set("content.javascript.enabled", True, "devtools://*")
config.set("content.javascript.enabled", True, "chrome://*/*")
config.set("content.javascript.enabled", True, "qute://*/*")
config.set("content.notifications.enabled", False, "https://www.reddit.com")
c.tabs.show = "switching"
c.statusbar.show = "in-mode"
c.tabs.favicons.show = "always"

c.tabs.position = "bottom"
c.completion.shrink = True
## config.set("url.start_pages", [f"{XDG_TEMPLATES_DIR}/startpages/luther/index.html"])
config.set("url.start_pages", ["https://duckduckgo.com"])
config.set("fonts.contextmenu", "Roboto Condensed")
config.set("fonts.default_family", "Roboto Condensed")
config.set("fonts.downloads", "Roboto Condensed")
config.set("fonts.hints", "Roboto Condensed")
config.set("fonts.web.family.fixed", "JetBrainsMono Nerd Font")
config.set("fonts.web.family.serif", "Roboto Condensed")
config.set("fonts.web.family.standard", "Roboto Condensed")
config.set("completion.scrollbar.width", 8)

c.downloads.location.directory = f"{XDG_DOWNLOAD_DIR}"
c.downloads.location.prompt = False
c.editor.command = ["st -e", "nvim '{}'"]

c.hints.chars = "asdfghjklie"
c.input.insert_mode.auto_leave = True
c.input.insert_mode.auto_load = True
c.scrolling.smooth = False
c.tabs.background = True
c.tabs.last_close = "close"

c.tabs.padding = {
    "left": 5,
    "right": 5,
    "top": 0,
    "bottom": 0,
}

c.tabs.select_on_remove = "prev"
c.url.default_page = "duckduckgo.com"
c.url.searchengines = {"DEFAULT": "duckduckgo.com/?q={}"}

with open(f"{XDG_CONFIG_HOME}/qutebrowser/colors.json", "r") as file:
    color_full = json.load(file)
    color = color_full["colors"]
    special = color_full["special"]

config.set("colors.contextmenu.menu.fg", color["color4"])
config.set("colors.contextmenu.menu.bg", color["color0"])
config.set("colors.contextmenu.disabled.fg", color["color4"])
config.set("colors.contextmenu.disabled.bg", color["color8"])
config.set("colors.contextmenu.selected.fg", color["color0"])
config.set("colors.contextmenu.selected.bg", color["color10"])
config.set("colors.completion.category.border.bottom", color["color9"])
config.set("colors.completion.category.border.bottom", color["color9"])

c.colors.completion.category.bg = color["color0"]
c.colors.completion.category.border.bottom = color["color0"]
c.colors.completion.category.border.top = color["color0"]
c.colors.completion.category.fg = color["color5"]
c.colors.completion.even.bg = special["background"]
c.colors.completion.odd.bg = special["background"]
c.colors.completion.fg = color["color4"]
c.colors.completion.item.selected.bg = color["color4"]
c.colors.completion.item.selected.border.bottom = color["color4"]
c.colors.completion.item.selected.border.top = color["color4"]
c.colors.completion.item.selected.fg = color["color0"]
c.colors.completion.match.fg = color["color13"]
c.colors.completion.scrollbar.bg = color["color1"]
c.colors.completion.scrollbar.fg = color["color5"]
c.colors.downloads.bar.bg = color["color0"]
c.colors.downloads.error.bg = color["color1"]
c.colors.downloads.error.fg = color["color7"]
c.colors.downloads.stop.bg = color["color9"]
c.colors.hints.bg = color["color5"]
c.colors.hints.fg = color["color0"]
c.colors.hints.match.fg = color["color10"]
c.colors.keyhint.bg = color["color1"]
c.colors.keyhint.fg = color["color0"]
c.colors.keyhint.suffix.fg = color["color8"]
c.colors.messages.error.bg = color["color5"]
c.colors.messages.error.border = color["color5"]
c.colors.messages.error.fg = color["color0"]
c.colors.messages.info.bg = color["color8"]
c.colors.messages.info.border = color["color8"]
c.colors.messages.info.fg = color["color5"]
c.colors.messages.warning.bg = color["color4"]
c.colors.messages.warning.border = color["color4"]
c.colors.messages.warning.fg = color["color0"]
c.colors.prompts.bg = color["color8"]
c.colors.prompts.border = "1px solid " + color["color0"]
c.colors.prompts.fg = color["color5"]
c.colors.prompts.selected.bg = color["color3"]
c.colors.statusbar.caret.bg = color["color15"]
c.colors.statusbar.caret.fg = color["color5"]
c.colors.statusbar.caret.selection.bg = color["color15"]
c.colors.statusbar.caret.selection.fg = color["color8"]
c.colors.statusbar.command.bg = color["color2"]
c.colors.statusbar.command.fg = color["color0"]
c.colors.statusbar.command.private.bg = color["color2"]
c.colors.statusbar.command.private.fg = color["color9"]
c.colors.statusbar.insert.bg = color["color1"]
c.colors.statusbar.insert.fg = color["color15"]
c.colors.statusbar.normal.bg = color["color0"]
c.colors.statusbar.normal.fg = color["color5"]
c.colors.statusbar.passthrough.bg = color["color4"]
c.colors.statusbar.passthrough.fg = color["color0"]
c.colors.statusbar.private.bg = color["color3"]
c.colors.statusbar.private.fg = color["color1"]
c.colors.statusbar.progress.bg = color["color0"]
c.colors.statusbar.url.error.fg = color["color11"]
c.colors.statusbar.url.fg = color["color0"]
c.colors.statusbar.url.hover.fg = color["color8"]
c.colors.statusbar.url.success.http.fg = color["color9"]
c.colors.statusbar.url.success.https.fg = color["color9"]
c.colors.statusbar.url.warn.fg = color["color12"]
c.colors.tabs.bar.bg = color["color3"]
c.colors.tabs.even.bg = color["color3"]
c.colors.tabs.even.fg = color["color0"]
c.colors.tabs.indicator.error = color["color11"]
c.colors.tabs.indicator.system = "none"
c.colors.tabs.odd.bg = color["color3"]
c.colors.tabs.odd.fg = color["color0"]
c.colors.tabs.selected.even.bg = color["color0"]
c.colors.tabs.selected.even.fg = color["color5"]
c.colors.tabs.selected.odd.bg = color["color0"]
c.colors.tabs.selected.odd.fg = color["color5"]

# vim:ft=python:nowrap
