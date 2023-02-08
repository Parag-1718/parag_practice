
let arr = ["virat","ram","rohit","MD_siraj","S_gill"]
console.log(arr);

let longStr = arr.reduce((x1,x2)=>{
     if(x1.length > x2.length){
        return x1;
     }else{
        return x2;
     }
})
console.log(longStr);