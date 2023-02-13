let boilWater = (callback) => {
  setTimeout(() => {
    console.log("boil water for 5s");
    callback(addMilk);
  }, 5000);
};

let boilTeaLeaves = (callback) => {
  setTimeout(() => {
    console.log("boil tea leaves for 2s");
    callback();
  }, 2000);
};

let addMilk = () => {
  console.log("add milk");
};

boilWater(boilTeaLeaves);
// boilTeaLeaves();
// addMilk();
