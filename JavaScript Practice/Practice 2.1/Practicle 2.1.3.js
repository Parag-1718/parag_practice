// 3. Create a function that returns count from Array of objects where
// age > x. x is dynamic

Array = [
  {
    name: "AAA",
    age: 18,
    id: 1,
  },
  {
    name: "BBB",
    age: 17,
    id: 2,
  },
  {
    name: "CCC",
    age: 33,
    id: 3,
  },
];

let countAge = (a, x) => {
  let count = 0;
  for (let key of a) {
    if (key.age > x) {
      count += 1;
    }
  }
  return count;
};

console.log(countAge(Array, 25));
