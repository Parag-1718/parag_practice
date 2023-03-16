import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Advance_routing';

  constructor(private router:Router){}

  gotoArticle(){
     this.router.navigate(['/artical'])
  }
  gotoComments(){
    this.router.navigate(['/comments'])
  }
}
