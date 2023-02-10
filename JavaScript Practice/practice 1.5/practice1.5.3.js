
let nums = [3,4,-1,1];
let nums1 = [7,8,9,11,12];
let nums2 = [1,2,0];



let solution = (nums)=>{

    let n = nums.length; // 4
    for(i=0; i<n; i++){
     
        element = nums[i];  // 1
       if(nums[i]>=1 && nums[i]<=n){ 
        orgPosition = element-1;      // 0
         
        if(nums[orgPosition] != element){    // 1->0 !
            let temp = nums[orgPosition];
            nums[orgPosition] = nums[i];
            nums[i] = temp; 
            i--;
        }
    }
    }

    for(i=0; i<n; i++){
        if(1+i != nums[i]){
            return i+1;
        }
        
    }return n+1
    
    
}

console.log(solution(nums));


// console.log(n+1);