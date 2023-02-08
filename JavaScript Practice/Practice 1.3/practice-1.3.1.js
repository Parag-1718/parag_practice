
let arr = [12,16,18,17,9,7]
console.log(arr);

// sum of a given array element
let sum = arr.reduce((x1,x2)=>{
         return x1+x2;
})
console.log(sum);

// average of a given array element
let ave = sum/arr.length;
console.log(ave);

// maximum value of a given array
let maxVal = arr.reduce((x1,x2)=>{
    return Math.max(x1,x2);
})
console.log(maxVal);