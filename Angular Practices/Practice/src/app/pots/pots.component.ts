import { Component,Input,EventEmitter,Output,OnChanges } from '@angular/core';

@Component({
  selector: 'app-pots',
  templateUrl: './pots.component.html',
  styleUrls: ['./pots.component.css']
})
export class PotsComponent{

  @Input('img') postImg : string = ''
  @Output() imgSelected = new EventEmitter<string>()

  text:string = "";
  constructor(){
    this.text="Ravi"
    console.log("text",this.text);
  }
  ngOnInit(){
    this.text="Parag"
    console.log("text",this.text);
  }

}
