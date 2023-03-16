import { Component } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {

  p:any = 100000; 
  n!:number;
  r:number = 7.2;

  resultAmount:any;
  PayableAmount:any;
  IntersetAmount:any;
   
  ngOnInit(){
    this.result();
  }

  result(){
    const mr= this.r / 1200;
    const N = this.p * mr * Math.pow(1 + mr, this.n);
    const D = Math.pow(1 + mr, this.n) - 1;
    this.resultAmount = N / D;
    
    this.PayableAmount = this.resultAmount * this.n;
    this.IntersetAmount = this.PayableAmount - this.p;

    this.tableData()
  }

  tableObj:any= [
  ]

  tableData(){
    let i;
   
    for(i=0;i<this.n;i++){
      let endbelence;
      endbelence = this.p - this.resultAmount
       let arr;
       let int = this.IntersetAmount/61;
       let pri = this.resultAmount - int
       arr = {index:i+1, bb: this.p ,emi: this.resultAmount,pri:pri, interest:int, end:endbelence }
       this.tableObj.push(arr)
    }
    console.log(this.tableObj);
  }


  
// P x R x (1+R)^N / [(1+R)^N-1] where-
// P = Principal loan amount
// N = Loan tenure in months
// R = Monthly interest rate
}
