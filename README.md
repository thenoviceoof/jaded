NOTE: this project is not actually under development yet, but I wanted
to write down my ideas. Here they are.

jaded
================================================================================
Use vanilla jade templates in your language of choice, via a node
server that produces jade for you.

    Once upon a midnight weary
    While I coded, caffinated, very
    Over many a quine
    but hankering for javascript more

    Then I thought it, addiction trapping
    suddenly jade templates were attracting
    As the pale clones were mocking,
    failing me in need once more

    "Tis' served templates," I muttered
    "transferring from some local port -
        Only this and nothing more"


USAGE
--------------------------------------------------------------------------------
There are two ways of using jaded: one way is to start the server
manually and build the TCP queries yourself, and the other is to use
the provided bindings in various other languages to start and/or
manage the jaded process and wrap the interface.

After getting jaded via your favorite javascript package manager, you
start the jaded process with:

    jaded localhost:7389

And it will look for all the *.jade templates in that current
directory (and it's subdirectories) and start serving back templates
in response to TCP connections, which carry the variable values to be
inserted into the templates.

As an example of a binding, let's look at the python interface:

    import jaded
    jaded.serve('.') # this will start the jaded server in the current directory
    print jaded.template('directory/template.jade', {'some_var': 'some_value'})

Since you may not want to start a jaded instance for each instance of
the library, there is a bit of flexibility in the .serve() interface,
which allows you to attach to an already created server.

There might also be pre-made hooks into various frameworks.


PERFORMANCE
--------------------------------------------------------------------------------
I have no idea whether this is performant or not. I hope it is, but it
does involve interprocess communication: if it only has a small
multiple of a speed drop compared to native methods, it might be able
to be lived with.

    Even in winter
    clings the need to optimize
    really, fast enough


LICENSE
--------------------------------------------------------------------------------
MIT Licensed

Copyright (c) 2013 thenoviceoof

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

But really, there's no code there yet, so it's more of a CC
thing. Let's say CC-by.

https://creativecommons.org/licenses/by/2.0/
