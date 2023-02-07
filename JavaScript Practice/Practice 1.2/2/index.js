
 const product = [
    {
        name : 't-shirt',
        price : 399,
        quantity : 1
    },
    {
        name : 'shirt',
        price : 550,
        quantity : 2
    },
    {
        name : 'pent',
        price : 450,
        quantity : 3
    }
 ];

for(let key in product){
    let value;
    value = "name : "+product[key].name+"<br>"+"price : "+product[key].price+"<br>"+"quantity : "+product[key].quantity+"<br>"
    document.write(value+"<br>");
}

var sum =0;
for (var i = 0; i < product.length; i++) {
    sum += product[i].price * product[i].quantity;
}
document.write("Total Price = " + sum);


