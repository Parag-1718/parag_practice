const person = {
    name:"aaa",
    age:"18"
}
const add = {
    address:"kkkkkkkk"
}


function newobj(obj1,obj2){
    const newobject = new Object();
    newobject.name = obj1.name;
    newobject.age = obj1.age;
    newobject.address = obj2.address;
    return newobject;
}

console.log(newobj(person,add));

