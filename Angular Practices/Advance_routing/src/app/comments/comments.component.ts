import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-comments',
  templateUrl: './comments.component.html',
  styleUrls: ['./comments.component.css']
})
export class CommentsComponent {

  constructor(private router:Router){}
  
  gotoEdit(){
    this.router.navigate(['/comments',{ outlets:{ 'pj':['edit']}}])
  }
  gotoAdd(){
    this.router.navigate(['comments/add'])
  }
}
