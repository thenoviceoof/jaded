net = require 'net'
jade = require 'jade'

server = net.createServer (c) ->
        console.log 'connected'
        # utf8 forever
        c.setEncoding 'utf8'

        c.on 'end', () ->
                console.log 'disconnect'

        c.on 'data', (data) ->
                template = jade.compile(data.toString())
                html = template()
                c.write html

server.listen 8080, () ->
        console.log 'server bound'
