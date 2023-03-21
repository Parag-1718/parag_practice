import { Component, OnInit } from '@angular/core';
import { FormArray, FormControl,FormGroup,Validators} from '@angular/forms'
import { Observable} from 'rxjs'
import { formModel } from 'src/form-model';
@Component({
  selector: 'app-reactive-form',
  templateUrl: './reactive-form.component.html',
  styleUrls: ['./reactive-form.component.css']
})
export class ReactiveFormComponent implements OnInit {
  

  loginform: FormGroup;
  formStatus:string

  ngOnInit(): void {
    this.loginform = new FormGroup({
      email : new FormControl(null, [Validators.required,Validators.email], this.noEmailAllowed),
      pass : new FormControl(null, [Validators.required,Validators.minLength(3)]),
      check : new FormControl('true'),
      // skills: new FormArray([
      //   new FormControl(null,[Validators.required,this.noSpaceAllowed]),
      // ])
    })

    // this.loginform.get('email').valueChanges.subscribe(res=>{
    //   console.log(res);
    // })

    // this.loginform.valueChanges.subscribe(res=>{
    //   console.log(res);
    // })

    this.loginform.statusChanges.subscribe(res=>{
      console.log(res);
      this.formStatus = res
    })
  }

  add(){
    (<FormArray>this.loginform.get('skills')).push(new FormControl(null,Validators.required))
  }
  onsubmit(data : formModel){
    console.log(data);
  }

  noSpaceAllowed(control:FormControl){
      if(control.value != null && control.value.indexOf(' ') != -1){
        return {noSpaceAllowed:true}
      }
      return null
  }

  // custome async validators
  noEmailAllowed(control:FormControl): Promise<any> | Observable<any> {
    let response = new Promise ((resolve,reject)=>{
           setTimeout(()=>{
              if(control.value === 'abc@gmail.com'){
                resolve ({noEmailAllowed:true})
              }
              resolve (null)
           },5000)
    })
    return response;
  }
}
