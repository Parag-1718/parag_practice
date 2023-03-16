import { Component } from '@angular/core';
import { FormControl,Validators,FormGroup} from '@angular/forms'
@Component({
  selector: 'app-contactus',
  templateUrl: './contactus.component.html',
  styleUrls: ['./contactus.component.css']
})
export class ContactusComponent {

  email = new FormControl ('',[
    Validators.required,
    Validators.pattern("[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$")
  ])
  name = new FormControl ('',[
    Validators.required
  ])
  phone = new FormControl ('',[
    Validators.required,
    Validators.pattern('[7-9]{1}[0-9]{9}')
  ])
  msg = new FormControl ('',[
    Validators.required,
    Validators.minLength(10)
  ])
  

  contact = new FormGroup ({
    email:this.email,
    password:this.name,
    phone:this.phone,
    msg:this.msg
  })

  submitBtn(){
    console.log('contact_us_data',this.contact.value);
    if(this.contact.valid){
      this.contact.reset()
     }
  }
  resetBtn(){
    this.contact.reset()
  }
}
