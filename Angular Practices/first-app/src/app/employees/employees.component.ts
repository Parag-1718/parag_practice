import { Component } from '@angular/core';
import { NotificationService } from '../notification.service';

@Component({
  selector: 'app-employees',
  templateUrl: './employees.component.html',
  styleUrls: ['./employees.component.css']
})
export class EmployeesComponent {

  constructor(private notify:NotificationService){ }
  
  sendNotification(data:any){
    this.notify.notification.next(data.value)
  }
}
