from qutebrowser.api import interceptor

def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (url.host() == 'www.youtube.com' and
        url.path() == '/get_video_info' and
            '&adformat=' in url.query()):
        info.block()


interceptor.register(filter_yt)

config.load_autoconfig(False)
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
config.set('content.notifications.enabled', False, 'https://www.reddit.com')
c.tabs.show = "switching"
c.statusbar.show = "in-mode"
c.tabs.favicons.show = "always"

c.tabs.position = "bottom"
c.completion.shrink = True
config.set('url.start_pages', ['/home/maker/Templates/startpages/startpage/index.html'])
config.set('fonts.contextmenu', 'GE Inspira')
config.set('fonts.default_family', 'GE Inspira')
config.set('fonts.downloads', 'GE Inspira')
config.set('fonts.hints', 'GE Inspira')
config.set('fonts.web.family.fixed', 'JetBrainsMono Nerd Font')
config.set('fonts.web.family.serif', 'GE Inspira')
config.set('fonts.web.family.standard', 'GE Inspira')
config.set('completion.scrollbar.width', 10)

c.downloads.location.directory = "/home/maker/Downloads"
c.downloads.location.prompt = False
c.editor.command = ["kitty", "nvim '{}'"]

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
    "bottom": 1,
}

c.tabs.select_on_remove = "prev"
c.url.default_page = "duckduckgo.com"
c.url.searchengines = {"DEFAULT": "duckduckgo.com/?q={}"}

nord = {
    # Polar Night
    'nord0': '#2e3440',
    'nord1': '#3b4252',
    'nord2': '#434c5e',
    'nord3': '#4c566a',
    # Snow Storm
    'nord4': '#d8dee9',
    'nord5': '#e5e9f0',
    'nord6': '#eceff4',
    # Frost
    'nord7': '#8fbcbb',
    'nord8': '#88c0d0',
    'nord9': '#81a1c1',
    'nord10': '#5e81ac',
    # Aurora
    'nord11': '#bf616a',
    'nord12': '#d08770',
    'nord13': '#ebcb8b',
    'nord14': '#a3be8c',
    'nord15': '#b48ead',
}

config.set('colors.contextmenu.menu.fg', '#d8dee9')
config.set('colors.contextmenu.menu.bg', '#2e3440')
config.set('colors.contextmenu.disabled.fg', '#d8dee9')
config.set('colors.contextmenu.disabled.bg', '#3b4252')
config.set('colors.contextmenu.selected.fg', '#d8dee9')
config.set('colors.contextmenu.selected.bg', '#5e81ac')
config.set('colors.completion.category.border.bottom', '#81a1c1')
config.set('colors.completion.category.border.bottom', '#81a1c1')

c.colors.completion.category.bg = nord['nord0']
c.colors.completion.category.border.bottom = nord['nord0']
c.colors.completion.category.border.top = nord['nord0']
c.colors.completion.category.fg = nord['nord5']
c.colors.completion.even.bg = nord['nord1']
c.colors.completion.odd.bg = nord['nord1']
c.colors.completion.fg = nord['nord4']
c.colors.completion.item.selected.bg = nord['nord3']
c.colors.completion.item.selected.border.bottom = nord['nord3']
c.colors.completion.item.selected.border.top = nord['nord3']
c.colors.completion.item.selected.fg = nord['nord6']
c.colors.completion.match.fg = nord['nord13']
c.colors.completion.scrollbar.bg = nord['nord1']
c.colors.completion.scrollbar.fg = nord['nord5']
c.colors.downloads.bar.bg = nord['nord0']
c.colors.downloads.error.bg = nord['nord11']
c.colors.downloads.error.fg = nord['nord5']
c.colors.downloads.stop.bg = nord['nord15']
c.colors.hints.bg = nord['nord13']
c.colors.hints.fg = nord['nord0']
c.colors.hints.match.fg = nord['nord10']
c.colors.keyhint.bg = nord['nord1']
c.colors.keyhint.fg = nord['nord5']
c.colors.keyhint.suffix.fg = nord['nord13']
c.colors.messages.error.bg = nord['nord11']
c.colors.messages.error.border = nord['nord11']
c.colors.messages.error.fg = nord['nord5']
c.colors.messages.info.bg = nord['nord8']
c.colors.messages.info.border = nord['nord8']
c.colors.messages.info.fg = nord['nord5']
c.colors.messages.warning.bg = nord['nord12']
c.colors.messages.warning.border = nord['nord12']
c.colors.messages.warning.fg = nord['nord5']
c.colors.prompts.bg = nord['nord2']
c.colors.prompts.border = '1px solid ' + nord['nord0']
c.colors.prompts.fg = nord['nord5']
c.colors.prompts.selected.bg = nord['nord3']
c.colors.statusbar.caret.bg = nord['nord15']
c.colors.statusbar.caret.fg = nord['nord5']
c.colors.statusbar.caret.selection.bg = nord['nord15']
c.colors.statusbar.caret.selection.fg = nord['nord5']
c.colors.statusbar.command.bg = nord['nord2']
c.colors.statusbar.command.fg = nord['nord5']
c.colors.statusbar.command.private.bg = nord['nord2']
c.colors.statusbar.command.private.fg = nord['nord5']
c.colors.statusbar.insert.bg = nord['nord14']
c.colors.statusbar.insert.fg = nord['nord1']
c.colors.statusbar.normal.bg = nord['nord0']
c.colors.statusbar.normal.fg = nord['nord5']
c.colors.statusbar.passthrough.bg = nord['nord10']
c.colors.statusbar.passthrough.fg = nord['nord5']
c.colors.statusbar.private.bg = nord['nord3']
c.colors.statusbar.private.fg = nord['nord5']
c.colors.statusbar.progress.bg = nord['nord5']
c.colors.statusbar.url.error.fg = nord['nord11']
c.colors.statusbar.url.fg = nord['nord5']
c.colors.statusbar.url.hover.fg = nord['nord8']
c.colors.statusbar.url.success.http.fg = nord['nord5']
c.colors.statusbar.url.success.https.fg = nord['nord14']
c.colors.statusbar.url.warn.fg = nord['nord12']
c.colors.tabs.bar.bg = nord['nord3']
c.colors.tabs.even.bg = nord['nord3']
c.colors.tabs.even.fg = nord['nord5']
c.colors.tabs.indicator.error = nord['nord11']
c.colors.tabs.indicator.system = 'none'
c.colors.tabs.odd.bg = nord['nord3']
c.colors.tabs.odd.fg = nord['nord5']
c.colors.tabs.selected.even.bg = nord['nord0']
c.colors.tabs.selected.even.fg = nord['nord5']
c.colors.tabs.selected.odd.bg = nord['nord0']
c.colors.tabs.selected.odd.fg = nord['nord5']
# c.colors.webpage.bg = 'white'
