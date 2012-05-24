route = (handle, pathname, response) ->
  console.log "About to route #{pathname}"
  if typeof handle[pathname] is "function"
    handle[pathname](response)
  else
    console.log "No request handler found for " + pathname
    response.writeHead 404, "Content-Type": "text/plain"
    response.write "404 Not Found"
    response.end()

exports.route = route