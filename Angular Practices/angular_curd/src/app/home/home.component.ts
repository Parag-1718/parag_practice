import { Component } from '@angular/core';
import { Validators, FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { userModel } from 'src/user-model';
import { UserService } from '../user.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})

export class HomeComponent {
  usersArr: any=[]
  ShowData(){
    this.userService.getUser().subscribe((res: any) => {
      if (res && res.body && res.body.length) {
        this.usersArr.push(res.body);
      }
    });
  }
  constructor(private userService: UserService , private router:Router) {
    this.ShowData()
  }

  ngOnInit() {
    this.ShowData();
    // this.usersArr = this.userService.getUser();
    
  }
  onEdit(data:userModel) {
   this.userService.editUser(data),
   this.router.navigate(["/update/",data.id])
  }
 
  onDelete(data:userModel){
    this.userService.deleteUser(data).subscribe((res:any)=>{
      this.usersArr.splice(res- 1, 1)
    })
    
  }
}
