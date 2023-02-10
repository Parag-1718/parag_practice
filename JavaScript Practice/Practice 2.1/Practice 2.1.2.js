let Array = [2,4,4,1,0,3];
let number = 0 

let largeElement = (a,n)=>{
    let arr=[];
    for(i=0; i<a.length; i++){
        if(a[i]>n){
            arr.push(a[i]);
        }
    }return arr;
}

console.log(largeElement(Array,number));