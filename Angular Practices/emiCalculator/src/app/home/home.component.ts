import { Component } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {

  p:any = 100000; 
  n:number = 120;
  r:number = 8;

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



  tableData(){
    let tableObj: any[] = [];
      let tableBeggingBalance = this.p;
      tableBeggingBalance.toFixed(2);
      let tableEMI = this.resultAmount;
      tableEMI.toFixed(2);
      let interestAmount = (this.r / 1200) * tableBeggingBalance;
      interestAmount.toFixed(2);
      let tablePrinciple = tableEMI - interestAmount;
      tablePrinciple.toFixed(2);
      let tableEndingBalance = tableBeggingBalance - tablePrinciple;
      tableEndingBalance.toFixed(2);
      for (let i = 0; i < this.n; i++) {
        let obj = {
          index: i+1,
          one: tableBeggingBalance.toFixed(2),
          two: tableEMI.toFixed(2),
          three: tablePrinciple.toFixed(2),
          four: interestAmount.toFixed(2),
          five: tableEndingBalance.toFixed(2)
        };
        tableObj.push(obj);
        tableBeggingBalance = tableEndingBalance;
        interestAmount = (this.r / 1200) * tableBeggingBalance;
        tablePrinciple = tableEMI - interestAmount;
        tableEndingBalance = tableBeggingBalance - tablePrinciple;
      }
      return tableObj;
  }


  
// P x R x (1+R)^N / [(1+R)^N-1] where-
// P = Principal loan amount
// N = Loan tenure in months
// R = Monthly interest rate
}
