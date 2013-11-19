#!/usr/bin/env node

var events = require('events');
var emitter = new events.EventEmitter();

var summary = {
    word : '',
    count : 0
};

// data is complete, write it to the required output channel
emitter.on('dataReady', function(o) {
    if (o.count <= 0) {
        return;
    }
    process.stdout.write(JSON.stringify(o) + '\n');
});

// generate a JSON object from the captured input data, and then generate
// the required output
emitter.on('lineReady', function(line) {
    if (!line || line == '') {
        return;
    }
    
    try {
        var obj = JSON.parse(line.split("\t")[1]);
        if (obj.word == summary.word) {
            summary.count += obj.count;
        } else {
            // raise an event that the reduced array is completed
            emitter.emit('dataReady', summary);
            summary = obj;
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
    emitter.emit('dataReady', summary);
});

// resume STDIN - paused by default
process.stdin.resume();

// set up the encoding for STDIN
process.stdin.setEncoding('utf8');