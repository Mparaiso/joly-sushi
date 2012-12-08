/** session nodejs **/
fs = require('fs')
fs.readdirSync(".")
images = fs.readdirSync(".")
data=[]
for(i in images){
  data.push({src:images[i]})
  }
extract = function(n){return n.match(/^(\S+)(\.\w+)$/)[1].replace("_"," "); }
extract("avocat.jpg")
for(var i in data){
  data[i].name = extract(data[i].src);
  }
serial = JSON.stringify(data,null," ")
fs.writeFileSync("data.json",serial,"utf-8")
prices = [1,3,2,4,3,4,2,5,3,4]
for(var i in data){
  data[i].price = prices[i];
  }
data
fs.writeFileSync("data.json",JSON.stringify(data,null," "),"utf-8")
for(var i in data){
  data[i].type = "sushi";
  }
fs.writeFileSync("data.json",JSON.stringify(data,null," "),"utf-8")
file = fs.readdirSync(".")
file.filter(function(element){ return element.indexOf("maki")>=0 }
  )
file = file.filter(function(element){ return element.indexOf("maki")>=0 })
getRandomPrice = function(){ return Math.ceil(Math.random()*5) }
getMaki=function(str){
  return {
    type:"maki",
    price:getRandomPrice(),
    src:str,
    name:str.match(/^(maki_)(\S+)(\.\w+)$/)[2]
    }
  }
getMaki(file[0])
for(var i in file){
  data.push(getMaki(file[i]))
  }
data
fs.writeFileSync("data.json",JSON.stringify(data,null," "),"utf-8")
