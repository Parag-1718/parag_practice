let arr = [12,16,12,18,9,7,17,18]
// let arr = ["virat","ram","rohit","MD_siraj","S_gill",'rohit']
console.log(arr);

function newFun(arr) {
    
    arr.sort(); 
    let arr2 = []
    for(i=0; i<arr.length-1; i++){
            if(arr[i] != arr[i+1]){
                arr2.push(arr[i]);
            }
    } 
    console.log(arr2);
}

console.log(newFun(arr));