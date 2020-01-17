var fs = require('fs');
function read(sqrtS, i){
	return new Promise((resolve)=>{
		fs.readFile(`run.uuuuu.00${sqrtS},00${sqrtS},00010/00000`+(i<10? '0':'')+JSON.stringify(i), 'utf8', function(err, contents) {
				if(!err){
					var re1= /\|\#.PT=..(.......)/g;
					var re2= /\|\#.sqrtS=..(.......)/g;
					var re3 = /2.*\+\-.*p/g;
					var foundPar = re1.exec(contents)||[0];
					var foundSqrtS = re2.exec(contents)||[0];
					var foundRes = re3.exec(contents)||[''];
					var loopdata = foundRes[0];
					var value = (loopdata.split('2 ')[1]||'').split('+')[0];
					var error = (loopdata.split('- ')[1]||'').split('p')[0];
						resolve([foundPar[1]*1,foundSqrtS[1]*1,[value*1,error*1]]);
				} else {
					//console.log(err)
					resolve(false);
				}
		});
	})
}


var promises=[];
for(var i=1; i<50; i++){	
	for(var j=1;j<50;j++){
		promises.push(read(100+j*50,i));
	}
}

Promise.all(promises).then((res)=>{
	//console.log(res);
  var report=[],nbreport="result={",par,sqrtS,sigma,error;
	res.forEach((val)=>{
		if(val&&val[2][0]!=NaN&&val[2][1]!=NaN){
				par=val[0];
				sqrtS=val[1];
				sigma=val[2][0].toString().replace('e','*10^');
				error=val[2][1].toString().replace('e','*10^');
				nbreport=nbreport+`{${par},${sqrtS},{${sigma},${error}}},`
				report.push(val)
		}
	})
  nbreport = nbreport+'{0,0,{0,0}}}';
	
	fs.writeFile('result.json', JSON.stringify(report), (err) => {
    if (err) throw err;
    console.log('Report created!');
	});
	fs.writeFile('result.nb', nbreport, (err) => {
    if (err) throw err;
    console.log('nb Report created!');
	});
})
