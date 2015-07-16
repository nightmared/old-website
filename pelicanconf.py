#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = 'Simon THOBY'
SITENAME = "Simon THOBY's homepage"
# TAGLINE = "A student fascinated by computer science and physics (although I also enjoys maths)"

PATH = 'content'

TIMEZONE = 'Europe/Paris'

DEFAULT_LANG = 'en'

FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

MENUITEMS = (('Home', ''),
             ('My Curriculum Vitae', 'cv'),
             ('About', 'about'),
             )

SOCIAL = (('twitter', 'http://twitter.com/infouelec'),
          ('github', 'https://github.com/t0b1nux'),)

DEFAULT_PAGINATION = 10

STATIC_PATHS = ['images', 'misc', 'themes/fonts', 'extras/robots.txt', 'extras/favicon.ico']
EXTRA_PATH_METADATA = {
    'extras/robots.txt': {'path': 'robots.txt'},
    'extras/favicon.ico': {'path': 'favicon.ico'},
}

ARTICLE_URL = 'blog/{date:%Y}/{date:%m}/{slug}/'
ARTICLE_SAVE_AS = ARTICLE_URL + 'index.html'
ARCHIVES_SAVE_AS = 'blog/index.html'
YEAR_ARCHIVES_SAVE_AS = 'blog/{date:%Y}/index.html'
MONTH_ARCHIVES_SAVE_AS = 'blog/{date:%Y}/{date:%m}/index.html'

PAGE_URL = '{slug}/'
PAGE_SAVE_AS = PAGE_URL + "index.html"

TAG_CLOUD_STEPS = 4
TAG_CLOUD_MAX_ITEMS = 30

# extensions
MD_EXTENSIONS = ['codehilite(css_class=highlight,linenums=False)']
PLUGIN_PATHS = ['/home/manjaro/.pelican/pelican-plugins']
PLUGINS = ['assets']

THEME = "theme"
