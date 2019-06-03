// var input = {
//     "Albert Einstein": "03/14/1879",
//     "Benjamin Franklin": "01/17/1706",
//     "Ada Lovelace": "12/10/1815",
//     "Donald Trump": "06/14/1946",
//     "Rowan Atkinson": "01/6/1955"
// };
var fs = require('fs');
function brithdayOfMonth(){
    fs.readFile('./data.json',function(err,data){
        if(err){
            return console.error(err);
        }
        var brithday = data.toString();
        brithday = JSON.parse(brithday);
        var montharr = [ "January", "February", "March" ,"April","May","June","July","August","September","October","November","December"];
        var map = new Map();
        for(var key in brithday){
            var month = parseInt(brithday[key].substr(0, 2));
            if(map.has(montharr[month-1])){
                map.set(montharr[month-1], parseInt(map.get(montharr[month-1]))+1);
            }else{
                map.set(montharr[month-1],1);
            }
        }
        console.log(JSON.stringify(strMapToObj(map)));
    })
}
function strMapToObj(strMap) {
    let obj = Object.create(null);
    for (let [k,v] of strMap) {
        obj[k] = v;
    }
    return obj;
}
brithdayOfMonth()

