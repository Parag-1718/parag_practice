let call1 = (callback)=>{
    setTimeout(()=>{
      console.log("1st function is start executing");
      callback(call3);
    },10000)
}

let call2 = (callback)=>{
    setTimeout(()=>{
      console.log("2nd function is start executing");
      callback();
    },10000)
}

let call3 = ()=>{
    setTimeout(()=>{
      console.log("3rd function is start executing");
    },8000)
}

call1(call2)