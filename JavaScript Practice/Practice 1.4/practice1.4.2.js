
let str = "<html><head></head><body><br/></body></html>";
let str1 = "<html><head></head><body></boy></html>";
let str2 = "<html><head></head><body><p>this is test element</p></body></html>";
let str3 = "<html><head></head><body><p>this is test element<br/></p></body></html>";


validation = (str)=>{
    arr = []
    i=0;
    
        while (i < str.length - 1) {
            if (str[i] === '<') {
                let j = i + 1;
                let temp = "";
                 for(z=j; str[z] !== ">"; z++){
                    temp = temp + str[z]
                 }
                // while (j < str.length && str[j] !== ">") {
                //     temp += str[j];
                //     j++;
                // }
    
                if(temp[temp.length-1] == "/" ){
                    i = j+1;
                    continue;
                }
    
                if (temp.startsWith("/") && arr.length>0) {
                    let popedElement = arr.pop();
                    // console.log("Poped = ", popedElement);
                    // console.log("Temp = ", temp.substring(1));
                    if(temp.substring(1) !== popedElement){
                        console.log("Invalid String");
                        break;
                    }
    
                } else {
                    arr.push(temp);
                }
                i = j + 1;
            } else {
                i++;
            }
        }
        
    
        if(arr.length == 0){
            console.log("Valid String");
        }

}

console.log(validation(str3));
