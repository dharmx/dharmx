import json
from getpass import getuser
from os import getenv
from pathlib import Path

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
config.set("fonts.contextmenu", "Cooper Hewitt")
config.set("fonts.default_family", "Cooper Hewitt")
config.set("fonts.downloads", "Cooper Hewitt")
config.set("fonts.hints", "Cooper Hewitt")
config.set("fonts.web.family.fixed", "Iosevka Nerd Font")
config.set("fonts.web.family.serif", "Cooper Hewitt")
config.set("fonts.web.family.standard", "Cooper Hewitt")
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


full = json.loads(Path(f"{XDG_CONFIG_HOME}/qutebrowser/theme.json").read_text())
theme = full["common"]

config.set("colors.contextmenu.menu.fg", theme["base04"])
config.set("colors.contextmenu.menu.bg", theme["base00"])
config.set("colors.contextmenu.disabled.fg", theme["base04"])
config.set("colors.contextmenu.disabled.bg", theme["base08"])
config.set("colors.contextmenu.selected.fg", theme["base00"])
config.set("colors.contextmenu.selected.bg", theme["base10"])
config.set("colors.completion.category.border.bottom", theme["base09"])
config.set("colors.completion.category.border.bottom", theme["base09"])

c.colors.completion.category.bg = theme["base00"]
c.colors.completion.category.border.bottom = theme["base00"]
c.colors.completion.category.border.top = theme["base00"]
c.colors.completion.category.fg = theme["base05"]
c.colors.completion.even.bg = full["shades"]["shade08"]
c.colors.completion.odd.bg = full["shades"]["shade08"]
c.colors.completion.fg = theme["base04"]
c.colors.completion.item.selected.bg = theme["base04"]
c.colors.completion.item.selected.border.bottom = theme["base04"]
c.colors.completion.item.selected.border.top = theme["base04"]
c.colors.completion.item.selected.fg = theme["base00"]
c.colors.completion.match.fg = theme["base13"]
c.colors.completion.scrollbar.bg = theme["base01"]
c.colors.completion.scrollbar.fg = theme["base05"]
c.colors.downloads.bar.bg = theme["base00"]
c.colors.downloads.error.bg = theme["base01"]
c.colors.downloads.error.fg = theme["base07"]
c.colors.downloads.stop.bg = theme["base09"]
c.colors.hints.bg = theme["base05"]
c.colors.hints.fg = theme["base00"]
c.colors.hints.match.fg = theme["base10"]
c.colors.keyhint.bg = theme["base01"]
c.colors.keyhint.fg = theme["base00"]
c.colors.keyhint.suffix.fg = theme["base08"]
c.colors.messages.error.bg = theme["base05"]
c.colors.messages.error.border = theme["base05"]
c.colors.messages.error.fg = theme["base00"]
c.colors.messages.info.bg = theme["base08"]
c.colors.messages.info.border = theme["base08"]
c.colors.messages.info.fg = theme["base05"]
c.colors.messages.warning.bg = theme["base04"]
c.colors.messages.warning.border = theme["base04"]
c.colors.messages.warning.fg = theme["base00"]
c.colors.prompts.bg = theme["base08"]
c.colors.prompts.border = "1px solid " + theme["base00"]
c.colors.prompts.fg = theme["base05"]
c.colors.prompts.selected.bg = theme["base03"]
c.colors.statusbar.caret.bg = theme["base15"]
c.colors.statusbar.caret.fg = theme["base05"]
c.colors.statusbar.caret.selection.bg = theme["base15"]
c.colors.statusbar.caret.selection.fg = theme["base08"]
c.colors.statusbar.command.bg = theme["base02"]
c.colors.statusbar.command.fg = theme["base14"]
c.colors.statusbar.command.private.bg = theme["base02"]
c.colors.statusbar.command.private.fg = theme["base09"]
c.colors.statusbar.insert.bg = theme["base01"]
c.colors.statusbar.insert.fg = theme["base15"]
c.colors.statusbar.normal.bg = theme["base00"]
c.colors.statusbar.normal.fg = theme["base05"]
c.colors.statusbar.passthrough.bg = theme["base04"]
c.colors.statusbar.passthrough.fg = theme["base00"]
c.colors.statusbar.private.bg = theme["base03"]
c.colors.statusbar.private.fg = theme["base01"]
c.colors.statusbar.progress.bg = theme["base00"]
c.colors.statusbar.url.error.fg = theme["base11"]
c.colors.statusbar.url.fg = theme["base00"]
c.colors.statusbar.url.hover.fg = theme["base08"]
c.colors.statusbar.url.success.http.fg = theme["base09"]
c.colors.statusbar.url.success.https.fg = theme["base09"]
c.colors.statusbar.url.warn.fg = theme["base12"]
c.colors.tabs.bar.bg = theme["base03"]
c.colors.tabs.even.bg = theme["base03"]
c.colors.tabs.even.fg = theme["base00"]
c.colors.tabs.indicator.error = theme["base11"]
c.colors.tabs.indicator.system = "none"
c.colors.tabs.odd.bg = theme["base03"]
c.colors.tabs.odd.fg = theme["base00"]
c.colors.tabs.selected.even.bg = theme["base00"]
c.colors.tabs.selected.even.fg = theme["base05"]
c.colors.tabs.selected.odd.bg = theme["base00"]
c.colors.tabs.selected.odd.fg = theme["base05"]

# vim:ft=python:nowrap
