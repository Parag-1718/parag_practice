let nums = [1,2,2]

let solution = (nums)=>{

    let n = nums.length;
    let p = 2**n;
    let ans = [];

     for(i=0; i<p; i++){
        let subset = []
        let temp ="";

        for(j=0; j<n; j++){
             if((1<<j)&i){
                subset.push(nums[j])
             } 
        }ans.push(subset);

     }
     return ans;
}

console.log(solution(nums));