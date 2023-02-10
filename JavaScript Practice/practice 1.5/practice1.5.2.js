let  nums = [-1,2,1,-4]

let solution = (nums,target)=>{

    let diffrence = Infinity;
    nums.sort();
    var sum = 0;
    for(i=0; i<nums.length; i++){
        let first = nums[i];
        let start = i+1;
        let end = nums.length-1;

        while(start<end){
    
            if(first+nums[start]+nums[end] == target) return target;
            else if(Math.abs(first+nums[start]+nums[end] - target) < diffrence){
                diffrence = Math.abs(first+nums[start]+nums[end] - target);
                sum = first+nums[start]+nums[end];
            }
            if(first+nums[start]+nums[end] > target) end--;
            else start++;
        }
       
    }
    return sum;
}

console.log(solution(nums,1));