"""
This module displays the number of emails tagged with inbox and unread using notmuch.
"""
from notmuch import Query, Database


class Py3status:

    def notmuch_status(self):
        with Database() as db:
            inbox = Query(db, 'not tag:spam and tag:inbox').search_messages()
            unread = Query(db, 'not tag:spam and tag:unread').search_messages()
            inbox_count = len(list(inbox))
            unread_count = len(list(unread))
        return {
            'full_text': 'M: {}({})'.format(inbox_count, unread_count),
            'cached_until': self.py3.time_in(60)
        }
