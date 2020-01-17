let child_process = require('child_process')
function start (sqrtS){
    console.log('running')

    let proc = child_process.exec('./run uuuuu '+ sqrtS+','+sqrtS);
    proc.stdout.on('data', function(data){
        console.log(data.toString());
    });
    proc.stderr.on('data', function(data){
        console.log(data.toString());
    });
    proc.on('exit', function(code){
        console.log('subprocess exited with code ' + code);
        delete(proc);
        if(i<20){
            setTimeout(()=>{start(sqrtS+50);i++}, 3000)
        }
    })
}
let i = 0;
start(250)
