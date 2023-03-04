import { Component } from '@angular/core';
import { Route, Router } from '@angular/router';

@Component({
  selector: 'app-departments',
  templateUrl: './departments.component.html',
  styleUrls: ['./departments.component.css']
})
export class DepartmentsComponent {

  dept:any = [
    {name:'it',id:1},
    {name:'ce',id:2},
    {name:'se',id:3},
]
  constructor(public router: Router){

  }

  onselect(dept:any){
    this.router.navigate(['/departments',dept.id])
  }
}
