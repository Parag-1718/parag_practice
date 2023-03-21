import { Component , OnInit} from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { userModel } from 'src/user-model';
import { UserService } from '../user.service';

@Component({
  selector: 'app-add-user',
  templateUrl: './add-user.component.html',
  styleUrls: ['./add-user.component.css'],
})
export class AddUserComponent implements OnInit{

  userForm! : FormGroup
  userID!: string | null;
  btnMode:boolean = true

  updateUser(){
    this.router.paramMap.subscribe(res=>{
      this.userID= res.get('id');
      console.log(this.userID);
    })

    this.userService.editUser(this.userID).subscribe((res:any)=>{
      this.resData = res;
      console.log(this.resData);
      this.userForm.setValue({
        email: this.resData.email || "",
        password: this.resData.password || ""
      })
      this.btnMode =false
    })
  }
  constructor(private userService: UserService , private router:ActivatedRoute,private route:Router) {
    this.updateUser();
  }

  ngOnInit(): void {
    this.updateUser();
   this.userForm = new FormGroup({
      email: new FormControl('', [Validators.required,Validators.email]),
      password: new FormControl('', [Validators.required,Validators.minLength(3)])
    });

  }

  resData:any;
 
  
  addUser(data:userModel) {
    if(this.btnMode == true)
    {
    this.userService.addUser(data)
    this.userForm.reset();
  }else{
    this.userService.editUserData(this.userID,data);
    this.route.navigate(['/home'])
  }
  }
}