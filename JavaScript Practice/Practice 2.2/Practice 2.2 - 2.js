// BMI formula: mass / height ^ 2
let m = 56;
let h = 1.80;

let BmiCalculator = (m,h)=>{
    let BMI;
    BMI = m/h**2;
    return BMI;
   
}



function Bmi(){
    let x = document.getElementById("Weight").value;
    let x1 = document.getElementById("Height").value;
    document.getElementById("mc").innerHTML=Math.floor(BmiCalculator(x,x1));
}


