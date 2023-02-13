
function display(val){
    document.getElementById('output').value += val;
}

function eual(){
    let x = document.getElementById('output').value;
    let y = eval(x);
    document.getElementById('output').value = y;
}

function clrscr(){
    let x = document.getElementById('output').value ="";
}
