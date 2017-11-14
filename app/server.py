# !/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import logging
import logging.config

import tornado.ioloop
import tornado.web
from tornado.options import options

from app.config import settings
from app.handlers import IndexHandler
from app.handlers import MainHandler
#from app.handlers import MainSocketHandler

def main():
    """Creates Tornado Application and starts the IO Loop
    """

    # Get the Port and Debug mode from command line options
    options.parse_command_line()

    # create logger for app
    logger = logging.getLogger('app')
    logger.setLevel(logging.INFO)

    FORMAT = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    logging.basicConfig(format=FORMAT)


    urls = [
        (r"/$", IndexHandler),
        (r"/main$", MainHandler),
        #(r"/main/ws$", MainSocketHandler, dict(game_manager=tic_tac_toe_game_manager))
    ]

    # Create Tornado application
    application = tornado.web.Application(
        urls,
        debug=options.debug,
        autoreload=options.debug,
        **settings)

    # Start Server
    logger.info("Starting App on Port: {} with Debug Mode: {}".format(options.port, options.debug))
    application.listen(options.port)
    tornado.ioloop.IOLoop.current().start()
