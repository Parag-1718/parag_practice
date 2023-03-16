import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';

@Component({
  selector: 'app-iplookup',
  templateUrl: './iplookup.component.html',
  styleUrls: ['./iplookup.component.css']
})
export class IplookupComponent {

  constructor(private http:HttpClient) {
    
  }
  ipAddress!:string;

  ipInfo:any;
 
  getIp(){
    this.http.get(`https://ipapi.co/${this.ipAddress}/json/`)
    .subscribe((data)=>{
      this.ipInfo = data;
      console.log(this.ipInfo.city,this.ipInfo.region);
    })
  }
}
