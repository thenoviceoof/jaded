net = require 'net'
jade = require 'jade'
fs = require 'fs'

server = net.createServer (c) ->
        console.log 'connected'
        # utf8 forever
        c.setEncoding 'utf8'

        c.on 'end', () ->
                console.log 'disconnect'

        c.on 'data', (data) ->
                request = JSON.parse data
                console.log request
                await fs.readFile request.template, defer err, template
                console.log template.toString()

                template_obj = jade.compile(template.toString())
                html = template_obj()
                c.write html

server.listen 8080, () ->
        console.log 'server bound'
