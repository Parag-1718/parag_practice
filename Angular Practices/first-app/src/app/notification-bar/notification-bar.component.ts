import { Component } from '@angular/core';
import { NotificationService } from '../notification.service';

@Component({
  selector: 'app-notification-bar',
  templateUrl: './notification-bar.component.html',
  styleUrls: ['./notification-bar.component.css']
})
export class NotificationBarComponent {

  constructor(private notificationbar:NotificationService){

  }
  noti = ''
  ngOnInit(){
    this.notificationbar.notification.subscribe((data)=>{
     this.noti= data;
    })
  }
}
