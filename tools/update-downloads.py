#!/usr/bin/env python

"""Update the downloads section in index.html.

Based on the lessons.json file like:

{
  "lessons": {
    "shell": {
      "downloads": "https://raw.githubusercontent.com/swcarpentry/shell-novice/v5.4/requirements.json"
    },
    "git": {
      "downloads": "https://raw.githubusercontent.com/swcarpentry/git-novice/v5.3/requirements.json"
    },
    "python": {
      "downloads": "https://raw.githubusercontent.com/swcarpentry/python-novice-inflammation/v5.4/requirements.json"
    },
    "sql": {
      "downloads": "https://raw.githubusercontent.com/swcarpentry/sql-novice-survey/v5.7/requirements.json"
    }
  }
}
"""

from __future__ import print_function  # for Python 2.6 compatibility

import json as _json
import logging as _logging
import sys as _sys
try:  # Python 3.x
    import urllib.parse as _urllib_parse
    import urllib.request as _urllib_request
except ImportError:  # Python 2.x
    import urlparse as _urllib_parse
    import urllib2 as _urllib_request  # for urlopen()


_LOG = _logging.getLogger(__name__)


def _get_json(url):
    response = _urllib_request.urlopen(url)  # not context manager in Python 2
    info = response.info()
    response_bytes = response.read()
    if hasattr(info, 'get_content_charset'):
        # Python 3, info is email.message.Message
        charset = info.get_content_charset('UTF-8')
    else:  # Python 2, info is mimetools.Message
        charset = info.getparam('charset') or 'UTF-8'
    response.close()
    json = response_bytes.decode(charset)
    return _json.loads(json)


def get_downloads(config):
    links = []
    with open(config, 'r') as f:
        setup = _json.load(f)
    for lesson, lesson_config in sorted(setup.get('lessons', {}).items()):
        downloads_url = lesson_config.get('downloads')
        if downloads_url:
            _LOG.debug('get downloads for {} from {}'.format(
                lesson, downloads_url))
            downloads = _get_json(url=downloads_url)
            links.extend(downloads)
    return links


def replace_downloads(path, downloads):
    lines = []
    with open(path, 'r') as f:
        in_downloads = False
        for line in f.readlines():
            if in_downloads:
                if line.startswith('</ul>'):
                    lines.append(line)
                    in_downloads = False
            else:
                lines.append(line)
            if line.startswith('<ul class="downloads">'):
                if f.newlines:
                    newline = f.newlines[0]
                else:
                    newline = '\n'
                in_downloads = True
                for download in downloads:
                    parsed = _urllib_parse.urlparse(download)
                    basename = parsed.path.rstrip('/').split('/')[-1]
                    lines.append(
                        '  <li><a href="{0}"><code>{1}</code></a></li>{2}'
                        .format(download, basename, newline))
        html = f.read()
    with open(path, 'w') as f:
        for line in lines:
            f.write(line)


if __name__ == '__main__':
    import optparse as _optparse

    _LOG.addHandler(_logging.StreamHandler())

    parser = _optparse.OptionParser(usage='%prog [options] CONFIG HTML')
    epilog = __doc__
    parser.format_epilog = lambda formatter: '\n' + epilog
    parser.add_option(
        '-v', '--verbose', action='store_true',
        help=('print additional information to help troubleshoot '
              'download updates'))
    options, args = parser.parse_args()

    if len(args) != 2:
        parser.print_usage(file=_sys.stderr)
        _sys.exit(1)

    config, html = args

    downloads = get_downloads(config=config)
    replace_downloads(path=html, downloads=downloads)
