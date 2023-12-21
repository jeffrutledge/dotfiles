config.load_autoconfig(False)

# fix sheets rendering double text
c.qt.args = ["disable-accelerated-2d-canvas"]

# use windows instead of tabs
c.tabs.show = 'never'
c.tabs.tabs_are_windows = True

c.downloads.remove_finished = 0

config.bind(',M', 'hint links spawn /Applications/VLC.app {url} {hint-url}')
config.bind(',m', 'spawn /Applications/VLC.app {url}')

# notifications
config.set('content.notifications.enabled', True, 'https://calendar.google.com')
config.set('content.notifications.enabled', False, 'https://www.facebook.com')
config.set('content.notifications.enabled', False, 'https://www.youtube.com')
config.set('content.notifications.enabled', False, 'https://www.reddit.com')

# let google calendar open cal links
config.set('content.register_protocol_handler', True, 'https://calendar.google.com?cid=%25s')
# let gmail open mail links
config.set('content.register_protocol_handler', True, 'https://mail.google.com?extsrc=mailto&url=%25s')

# Settings in default generated config.py
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
config.set('content.javascript.enabled', True, 'qute://*/*')

# keybindings
config.bind('<ctrl-j>', 'completion-item-focus next', mode='command')
config.bind('<ctrl-k>', 'completion-item-focus prev', mode='command')
