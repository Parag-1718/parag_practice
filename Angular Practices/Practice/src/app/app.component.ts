import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Practice';

  imgUrl : string = 'https://picsum.photos/id/189/200/300'

  logImg(event:string){
    console.log(event);
  }
}
