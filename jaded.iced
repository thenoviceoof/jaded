net = require 'net'
jade = require 'jade'
fs = require 'fs'

# TODO figure out how js people do tests
server = net.createServer (c) ->
        # TODO do debug statements/logging well
        console.log 'connected'
        # utf8 forever
        c.setEncoding 'utf8'

        # TODO cache all the templates right about now

        c.on 'data', (data) ->
                # expected format: {template: 'path', data: {**}}
                request = JSON.parse data
                console.log request
                await fs.readFile request.template, defer err, template
                console.log template.toString()

                template_obj = jade.compile(template.toString())
                html = template_obj()
                c.write html

                # TODO INVESTIGATION
                # might need to switch to a websockets (or something)
                # style connection pooling thing to handle function
                # calls

        c.on 'end', () ->
                console.log 'disconnect'

# TODO need an argparse for v8 js
server.listen 8080, () ->
        console.log 'server bound'
