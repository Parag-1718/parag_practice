
let arr = [
    {
        name:'virat',
        age:35
    },
    {
        name:'hardik',
        age:33
    },
    {
        name:'sundar',
        age:25
    }]

    console.log(arr);


    // sort by name:
let sort_arrBy_Name = arr.sort((obj1,obj2)=>{
     return (obj1.name > obj2.name ? 1 : -1);
}) 
console.log(sort_arrBy_Name);

// sort by age:
let sort_arrBy_Age = arr.sort((obj1,obj2)=>{
    return (obj1.age > obj2.age ? 1 : -1);
}) 
console.log(sort_arrBy_Age );
