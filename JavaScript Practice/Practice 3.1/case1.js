let saveDetails = () => {
    
    let f = document.getElementById('fname').value;
    let l = document.getElementById('lname').value;
    let e = document.getElementById('email').value;
    let m = document.getElementById('mobile').value;
  return new Promise((resolve, reject) => {
    if (f == "" || l == "" || e == "" || m == "") {
      //   reject(alert("jkk"));
      reject(alert("enter valid data"));
    }else {
      resolve(console.log(f + l + m + e));
    }
  });
};
function data(){
saveDetails()
  .then((resolve) => {
    console.log(resolve);
  })
  .catch((reject) => {
    console.log(reject);
  });
}