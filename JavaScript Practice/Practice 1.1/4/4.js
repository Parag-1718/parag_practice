

function vali() {
    var x= document.forms["regform"]["name"].value;
    if (x == "") {
      alert("Name must be filled out");
    }
    var y=document.forms["regform"]["email"].value;
    if(y== ""){
      alert("email must be filled out");

    }
    var z=document.forms["regform"]["phoneNo"].value;
    if(z== ""){
      alert("phone number must be filled out");

    }
  } 