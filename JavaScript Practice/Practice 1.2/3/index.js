var arr = [
    {
        "name": "virat",
        "product": "mrf"
    }, 
    {
        "name": "hardik",
        "product": "sg"
    }, 
    {
        "name": "rohit",
        "product": "ceat"
    }
]

for (let key in arr) {
    let value;

    value = "name : " + arr[key].name + "<br>Product : " + arr[key].product +
            "<br>";
    document.write(value);

}