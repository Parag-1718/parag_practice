// Create a function that calculate age based on the date of birth. “Date of
// birth” will be passed via function argument.

let date = "12/8/2002";

let calculateAge = (str) => {
  let s = Array.from(str);
  let x = 2023;
  let temp = "";
  for (i = s.length - 4; i < s.length; i++) {
    temp = temp + s[i];
  }
  let ans = 2023 - parseInt(temp);
  return ans;
};
console.log(calculateAge(date));
