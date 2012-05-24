formidable = require 'formidable'
fs = require 'fs'
querystring = require 'querystring'

start = (response) ->
  console.log "request handler 'start' was called."

  body =
  """
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
    <body>
      <form action="/upload" enctype="multipart/form-data" method="post">
        <input type="file" name="upload" multiple="multiple" />
        <input type="submit" value="Upload PNG" />
      </form>
    </body>
  </html>
  """
  response.writeHead 200, 'Content-Type': 'text/html'
  response.write body
  response.end()

upload = (response, request) ->
  console.log "request handler 'upload' was called."

  form = new formidable.IncomingForm()
  console.log 'about to parse'
  form.parse request, (error, fields, files) ->
    console.log 'parsing done'

    # possible error on Windows systems:
    # tried to rename to an already existing file
    fs.rename files.upload.path, '/tmp/test.png', (err) ->
      if err
        fs.unlink '/tmp/test.png'
        fs.rename files.upload.path, '/tmp/test.png'

  response.writeHead 200, 'Content-Type': 'text/html'
  response.write 'received image:<br />'
  response.write '<img src="/show" >'
  response.end()

show = (response) ->
  console.log "Request handler 'show' was called."
  fs.readFile "/tmp/test.png", "binary", (error, file) ->
    if error
      response.writeHead 500, 'Content-Type': 'text/plain'
      response.write error + '\n'
      response.end()
    else
      response.writeHead 200, 'Content-Type': 'image/png'
      response.write file, 'binary'
      response.end()

exports.start = start
exports.upload = upload
exports.show = show
