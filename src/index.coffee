router = require './router'
server = require './server'

requestHandlers = require './requestHandlers'

handle =
  '/'       : requestHandlers.start
  '/show'   : requestHandlers.show
  '/start'  : requestHandlers.start
  '/upload' : requestHandlers.upload

server.start(router.route, handle)
