 let str = "25525511@35"
 let str2 = "0000"
 let str3 = "101023"

function ip_valid(str) {
    let arr=[]
    let temp="";
    for(let i=0;i<str.length;i++){
        if(str[i]=="."){
            arr.push(temp)
            temp="";
        }else{
            temp=temp+str[i];
        }
    }
    arr.push(temp)
    for(let i=0;i<arr.length;i++){
        if(arr[i].length>3 || parseInt(arr[i])>255 || parseInt(arr[i]) < 0){
            return 0;
        }
        if(arr[i].length>1 && parseInt(arr[i])==0){
            return 0;
        }
        if(arr[i].length>1 && parseInt(arr[i])!=0 && arr[i][0]=="0"){
            return 0
        }
    }
    return 1;
}



 let saprate_str = (s)=>{

    function spacialcharacter(str) {
        const specialChars = /[`!@#$%^&*()_+\-=\[\]{};':"\\|,<>\/?~]/;
        return specialChars.test(str);
    }
    let l = s.length
    if(s.length<4 || s.length>12){
        console.log("invalid ip string");
    }

    let new_str = s;
    let arr =new Array()
    
        for(i=1; i<l-2; i++){
            for(j=i+1; j<l-1; j++){
                for(k=j+1; k<l; k++){
                
                    new_str = new_str.substring(0,k) + "." + new_str.substring(k,new_str.length);
                    new_str = new_str.substring(0,j) + "." + new_str.substring(j,new_str.length);
                    new_str = new_str.substring(0,i) + "." + new_str.substring(i,new_str.length);

                    if(spacialcharacter(new_str) != true){
                    if(ip_valid(new_str)){
                        arr.push(new_str);
                        console.log(new_str);
                    }
                    }else return "invalid str"

                    new_str = s;
                }
            }
        }
        

 }

 console.log(saprate_str(str));