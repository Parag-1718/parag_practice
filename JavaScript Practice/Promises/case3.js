let call1 = ()=>{

    return new Promise ((resolve,reject)=>{
        setTimeout(()=>{
            resolve("1st function is start executing");
          },10000)
    })
    
}

let call2 = ()=>{

    return new Promise ((resolve,reject)=>{
        setTimeout(()=>{
            resolve("2nd function is start executing");
          },10000)
    })
   
}

let call3 = ()=>{
    setTimeout(()=>{
      console.log("3rd function is start executing");
    },8000)
}

call1().then((resolve)=>{
    console.log(resolve);
    call2().then((resolve)=>{
        console.log(resolve);
        call3();
    })
})