
let validation = (callback)=>{
  
    let f = document.getElementById('fname').value;
    let l = document.getElementById('lname').value;
    let e = document.getElementById('email').value;
    let m = document.getElementById('mobile').value;
    if( f == "" || l == "" || e == "" || m == ""){
        alert("enkjbb")
    }
    callback();

}


let dispalay = ()=>{
    let f = document.getElementById('fname').value;
    let l = document.getElementById('lname').value;
    let e = document.getElementById('email').value;
    let m = document.getElementById('mobile').value;

    document.write(f + "<br>");
    document.write(l + "<br>");
    document.write(e + "<br>");
    document.write(m + "<br>");

}