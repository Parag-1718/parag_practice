// 1. Create a function that returns Boolean - whether a passed string is
// Palindrome or not.

let str = "amanxnama";

let ValidPalidrom = (s) => {
  var newS = Array.from(s);
  let n = newS.length;
  var temp = [];
  for (i = 0; i < n; i++) {
    temp[i] = s[i];
  }

  newS.reverse();
  for (i = 0; i < newS.length; i++) {
    if (newS[i] != temp[i]) {
      return false;
    }
  }
  return true;
};

console.log(ValidPalidrom(str));
