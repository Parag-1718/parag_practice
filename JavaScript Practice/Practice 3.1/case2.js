let async1 = async () => {

  let one = new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(console.log("output from one"));
    }, 5000);
  });

  let two = new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(console.log("output from two"));
    }, 10000);
  });

  let three = new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(console.log("output from three"));
    }, 20000);
  });

  let oneawa = await one;
  let twoawa = await two;
  let threeawa = await three;
  return oneawa, twoawa, threeawa;
};

async1().then((resolve) => {
  resolve;
});
