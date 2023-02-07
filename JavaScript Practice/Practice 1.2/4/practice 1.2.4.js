const person = {
    name : 'aaa',
    age : 18,
    addres : 'mmm',
}

const person1 = {
    name : 'ppp',
    age : 18,
    addres : 'mmm',
}


function newobj(person){

    const newobject = new Object();
    newobject.name = person.name;
    newobject.age = person.age;
    return newobject;
}

console.log(newobj(person1));