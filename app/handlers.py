"""
Request Handlers
"""
from builtins import super
import logging
import json

from tornado.web import RequestHandler
from tornado.websocket import WebSocketHandler, WebSocketClosedError
from tornado import concurrent
from tornado import gen

logger = logging.getLogger("app")


class IndexHandler(RequestHandler):
    #Redirect to MainHandler
    def get(self):
        self.redirect('/main')


class MainHandler(RequestHandler):
    #Render Main page
    def get(self):
        self.render("main.html")
