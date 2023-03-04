import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Basics';

  // Properties :
  imageUral:string = 'https://picsum.photos/id/155/200/256';
  images = [
    'https://picsum.photos/id/155/200/256',
    'https://picsum.photos/id/155/200/256',
    'https://picsum.photos/id/155/200/256'
  ]
  cuurentDate = new Date();
  cost = 2000;
  temprature = 18.13;
  changeBodyColor = false;
  fontSize = 16

  changeImageUrl(e:KeyboardEvent){
    this.imageUral = (e.target as HTMLInputElement).value
  }
  
  // changeImageUrl(e:any){
  //   this.imageUral = e.target.value
  // }
  imgLog(e:string){
    console.log(e);
  }
}
