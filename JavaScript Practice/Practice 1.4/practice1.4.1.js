
let input = [1,8,6,2,5,4,8,3,7]

max = 0;


for(i=0; i<input.length; i++){
    for(j=i+1; j<input.length; j++){
       let minH = Math.min(input[i],input[j])
       let wid = j-1;
       let aera = minH * wid;
       max = Math.max(max,aera)

    }
}
console.log(max);
2

