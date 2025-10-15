# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103
# pylint settings included to disable linting errors

import subprocess
def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], capture_output=True, check=True, text=True)
    lines = x.stdout.split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

xresources = read_xresources("*")


c.tabs.title.format = "{audio}{current_title}"
c.fonts.web.size.default = 20

c.url.searchengines = {
# note - if you use duckduckgo, you can make use of its built in bangs, of which there are many! https://duckduckgo.com/bangs
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        '!aw': 'https://wiki.archlinux.org/?search={}',
        '!apkg': 'https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=',
        '!gh': 'https://github.com/search?o=desc&q={}&s=stars',
        '!yt': 'https://www.youtube.com/results?search_query={}',
        }

c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']

config.load_autoconfig() # load settings done via the gui

c.auto_save.session = True # save tabs on quit/restart

# keybinding changes
config.bind('=', 'cmd-set-text -s :open')
config.bind('H', 'tab-prev')
config.bind('L', 'tab-next')
config.bind('J', 'back')
config.bind('K', 'forward')
config.bind('h', 'history')
config.bind('cs', 'cmd-set-text -s :config-source')
config.bind('tH', 'config-cycle tabs.show multiple never')
config.bind('sH', 'config-cycle statusbar.show always never')
config.bind('T', 'hint links tab')
config.bind('pP', 'open -- {primary}')
config.bind('pp', 'open -- {clipboard}')
config.bind('pt', 'open -t -- {clipboard}')
config.bind('qm', 'macro-record')

config.bind('tT', 'config-cycle tabs.position top left')
config.bind('gL', 'tab-move +')
config.bind('gH', 'tab-move -')
config.bind('gm', 'tab-move')

# dark mode setup
# c.colors.webpage.darkmode.enabled = True
# c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
# c.colors.webpage.darkmode.policy.images = 'never'
# config.set('colors.webpage.darkmode.enabled', False, 'file://*')

# styles, cosmetics
# c.content.user_stylesheets = ["~/.config/qutebrowser/styles/youtube-tweaks.css"]
c.tabs.padding = {'top': 0, 'bottom': 0, 'left': 2, 'right': 2}
c.tabs.indicator.width = 0 # no tab indicators
# c.window.transparent = True # apparently not needed
c.tabs.width = '7%'

# fonts
c.fonts.default_family = []
c.fonts.default_size = '13pt'
c.fonts.web.family.fixed = 'monospace'
c.fonts.web.family.sans_serif = 'monospace'
c.fonts.web.family.serif = 'monospace'
c.fonts.web.family.standard = 'monospace'

# privacy - adjust these settings based on your preference
# config.set("completion.cmd_history_max_items", 0)
# config.set("content.private_browsing", True)
# config.set("content.webgl", False, "*")
# config.set("content.canvas_reading", False)
# config.set("content.geolocation", False)
# config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
# config.set("content.cookies.accept", "all")
# config.set("content.cookies.store", True)
# config.set("content.javascript.enabled", False) # tsh keybind to toggle

# Adblocking info -->
# For yt ads: place the greasemonkey script yt-ads.js in your greasemonkey folder (~/.config/qutebrowser/greasemonkey).
# The script skips through the entire ad, so all you have to do is click the skip button.
# Yeah it's not ublock origin, but if you want a minimal browser, this is a solution for the tradeoff.
# You can also watch yt vids directly in mpv, see qutebrowser FAQ for how to do that.
# If you want additional blocklists, you can get the python-adblock package, or you can uncomment the ublock lists here.
c.content.blocking.enabled = True
c.content.blocking.method = 'adblock' # uncomment this if you install python-adblock
c.content.blocking.adblock.lists = [
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"]

c.content.javascript.log_message.excludes = {"userscript:_qute_stylesheet": ["*Refused to apply inline style because it violates the following Content Security Policy directive: *"], 
                                             "userscript:_qute_js": ["*TrustedHTML*"]}

bg_default = "#282c34"          # main shade darkest
bg_lighter = "#353b45"
bg_selection = "#3e4451"
# "#545862"
fg_disabled = "#565c64"
fg_default = "#abb2bf"
# "#b6bdca"
bg_lightest = "#c8ccd4"         # main shade lightest
fg_error = "#e06c75"            # red
# "#d19a66"                     # orange
bg_hint = "#e5c07b"             # yellow
fg_matched_text = "#98c379"     # green
bg_passthrough_mode = "#56b6c2" # teal
bg_insert_mode = "#61afef"      # blue
bg_warning = "#c678dd"          # purple
# "#be5046"                     # dark red

############
# SETTINGS #
############

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = fg_default

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = bg_lighter

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = bg_default

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = bg_hint

# Background color of the completion widget category headers.
c.colors.completion.category.bg = bg_default

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = bg_default

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = bg_default

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = fg_default

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = bg_selection

# Top border color of the selected completion item.
c.colors.completion.item.selected.border.top = bg_selection

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = bg_selection

# Foreground color of the matched text in the selected completion item.
c.colors.completion.item.selected.match.fg = fg_matched_text

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = fg_matched_text

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = fg_default

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = bg_default

# Background color of disabled items in the context menu.
c.colors.contextmenu.disabled.bg = bg_lighter

# Foreground color of disabled items in the context menu.
c.colors.contextmenu.disabled.fg = fg_disabled

# Background color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.bg = bg_default

# Foreground color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.fg =  fg_default

# Background color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.bg = bg_selection

#Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.fg = fg_default

# Background color for the download bar.
c.colors.downloads.bar.bg = bg_default

# Color gradient start for download text.
c.colors.downloads.start.fg = bg_default

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = bg_insert_mode

# Color gradient end for download text.
c.colors.downloads.stop.fg = bg_default

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = bg_passthrough_mode

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = fg_error

# Font color for hints.
c.colors.hints.fg = bg_default

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
c.colors.hints.bg = bg_hint

# Font color for the matched part of hints.
c.colors.hints.match.fg = fg_default

# Text color for the keyhint widget.
c.colors.keyhint.fg = fg_default

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = fg_default

# Background color of the keyhint widget.
c.colors.keyhint.bg = bg_default

# Foreground color of an error message.
c.colors.messages.error.fg = bg_default

# Background color of an error message.
c.colors.messages.error.bg = fg_error

# Border color of an error message.
c.colors.messages.error.border = fg_error

# Foreground color of a warning message.
c.colors.messages.warning.fg = bg_default

# Background color of a warning message.
c.colors.messages.warning.bg = bg_warning

# Border color of a warning message.
c.colors.messages.warning.border = bg_warning

# Foreground color of an info message.
c.colors.messages.info.fg = fg_default

# Background color of an info message.
c.colors.messages.info.bg = bg_default

# Border color of an info message.
c.colors.messages.info.border = bg_default

# Foreground color for prompts.
c.colors.prompts.fg = fg_default

# Border used around UI elements in prompts.
c.colors.prompts.border = bg_default

# Background color for prompts.
c.colors.prompts.bg = bg_default

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = bg_selection

# Foreground color for the selected item in filename prompts.
c.colors.prompts.selected.fg = fg_default

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = fg_matched_text

# Background color of the statusbar.
c.colors.statusbar.normal.bg = bg_default

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = bg_default

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = bg_insert_mode

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = bg_default

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = bg_passthrough_mode

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = bg_default

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = bg_lighter

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = fg_default

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = bg_default

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = fg_default

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = bg_default

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = bg_default

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = bg_warning

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = bg_default

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = bg_insert_mode

# Background color of the progress bar.
c.colors.statusbar.progress.bg = bg_insert_mode

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = fg_default

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = fg_error

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = fg_default

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = bg_passthrough_mode

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = fg_matched_text

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = bg_warning

# Background color of the tab bar.
c.colors.tabs.bar.bg = bg_default

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = bg_insert_mode

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = bg_passthrough_mode

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = fg_error

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = fg_default

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = bg_lighter

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = fg_default

# Background color of unselected even tabs.
c.colors.tabs.even.bg = bg_default

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = bg_passthrough_mode

# Foreground color of pinned unselected even tabs.
c.colors.tabs.pinned.even.fg = bg_lightest

# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = fg_matched_text

# Foreground color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.fg = bg_lightest

# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = bg_selection

# Foreground color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.fg = fg_default

# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = bg_selection

# Foreground color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.fg = fg_default

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = fg_default

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = bg_selection

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = fg_default

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = bg_selection
