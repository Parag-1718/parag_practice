let str="abcd";

let getArray = (str)=>{

    let arr = [];
    for(i=0; i<str.length; i++){
          arr[i] = str[i]  ;
    }
    return arr;
}
console.log(getArray(str));