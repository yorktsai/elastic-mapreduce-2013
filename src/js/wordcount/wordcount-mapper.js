#!/usr/bin/env node

var events = require('events');
var emitter = new events.EventEmitter();

// generate a JSON object from the captured input data, and then generate
// the required output
emitter.on('lineReady', function(line) {
    if (!line || line == '') {
        return;
    }
    
    try {
        var obj = JSON.parse(line);
        for (var i=0;i<obj.length; i++) {
            process.stdout.write(obj[i] + '\t' + JSON.stringify({
            	word: obj[i],
			    count : 1
			}) + '\n');
        }
    } catch (err) {
        process.stderr.write('Error Processing Line ' + data + '\n')
        process.stderr.write(err);
        return;
    }
});

// fires on every block of data read from stdin
var remaining = '';
process.stdin.on('data', function(chunk) {
    var capture = chunk.split('\n');
    for (var i=0;i<capture.length; i++) {
        if (i==0) {
            emitter.emit('lineReady',remaining + capture[i]);
        } else if (i<capture.length-1) {
            emitter.emit('lineReady',capture[i]);
        } else {
            remaining = capture[i];
        }
    }
});

// fires when stdin is completed being read
process.stdin.on('end', function() {
    // do nothing
});

// resume STDIN - paused by default
process.stdin.resume();

// set up the encoding for STDIN
process.stdin.setEncoding('utf8');