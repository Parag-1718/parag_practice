import { Component } from '@angular/core';

@Component({
  selector: 'app-todo-list',
  templateUrl: './todo-list.component.html',
  styleUrls: ['./todo-list.component.css']
})
export class TodoListComponent {

  task:string = ''
  taskarr:any[] = [[],[],[]]
  getTask(v:string,v2:any){
    // this.taskarr.push({name:v,pri:v2})
    if(v2=="high"){
      this.taskarr[0].splice(this.taskarr[0].length,0,{name:v,pri:v2})
    }
    else if(v2=='low'){
      this.taskarr[2].splice(this.taskarr[1].length,0,{name:v,pri:v2})
    }else{
      this.taskarr[1].splice(this.taskarr[2].length,0,{name:v,pri:v2})
    }
    console.warn(this.taskarr);
  }
 
}
