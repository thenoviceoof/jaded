net = require('net')

server = net.createServer (c) ->
        console.log 'connected'
        c.on 'end', () ->
                console.log 'disconnect'
        c.write 'hello\r\n'
        c.pipe c

server.listen 8080, () ->
        console.log 'server bound'
