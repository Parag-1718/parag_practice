function add(){
    var li = document.createElement("li");
    li.innerHTML="item";
    document.getElementById("mylist").appendChild(li);
}

function remove(){
    var mylist = document.getElementById("mylist");
    var removeitem = document.querySelectorAll("#mylist li");
    mylist.removeChild(removeitem[removeitem.length-1]);
}