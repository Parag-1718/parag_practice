import { Component } from '@angular/core';

@Component({
  selector: 'app-todo-list',
  templateUrl: './todo-list.component.html',
  styleUrls: ['./todo-list.component.css'],
})
export class TodoListComponent {
  task: any = '';
  selectOption: string[] = ['high', 'medium', 'low'];

  taskarr: any[] = [];

  getTask(v: string, v2: string) {
    const newTask = { name: v, pri: v2 };

    if (v) {
      if (v2 == 'high') 
      {
        this.taskarr.unshift(newTask);
      } 
      else if (v2 == 'low') 
      {
        this.taskarr.push(newTask);
      } 
      else 
      { const lastIndex = this.taskarr.reduce((lastIndex, task, index) => {
          if (task.pri === 'high') {
            return index;
          }
          return lastIndex;
        }, -1);
        this.taskarr.splice(lastIndex + 1, 0, newTask);
        console.log(lastIndex);
      }
      console.warn(this.taskarr);
    }
  }
}
