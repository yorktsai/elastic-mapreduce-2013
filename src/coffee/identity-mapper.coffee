#!/usr/bin/env coffee

readline = require('readline')

# set terminal to false to avoid \t be treated as auto-complete trigger
rl = readline.createInterface(process.stdin, process.stdout, null, false)

# generate a JSON object from the captured input data, and then generate
# the required output
rl.on "line", (line) ->
    return if not line or line is ""
    try
        process.stdout.write line + "\n"

    catch err
        # process.stderr.write('Error Processing Line ' + line + '\n')
        # process.stderr.write(err);
        return

rl.on "close", () ->
    # do nothing

