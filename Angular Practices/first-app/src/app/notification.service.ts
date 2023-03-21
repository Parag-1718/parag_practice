import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class NotificationService {

  notification = new Subject<string>();
  constructor() { }

  getNotification(data:any){
    debugger
    this.notification.next(data)
    console.warn(data);
  }
}
