import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
@Component({
  selector: 'app-departments-details',
  templateUrl: './departments-details.component.html',
  styleUrls: ['./departments-details.component.css']
})
export class DepartmentsDetailsComponent implements OnInit{
  
  
  constructor(private route : ActivatedRoute){

  }
  ngOnInit() {
    // let mm = parseInt(this.route.snapshot.paramMap.get('id'));
    let id = this.route.snapshot.params["id"];
    console.log("id",id);
    
  }

}
