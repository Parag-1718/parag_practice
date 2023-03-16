import { SocialAuthService } from '@abacritt/angularx-social-login';
import { Component } from '@angular/core';
import { FormControl,FormGroup,Validators} from '@angular/forms'
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'angular-with-google';
  user:any;
  loggedIn!:boolean;

  loginbtn:any = "login";
  
  constructor(private authService: SocialAuthService) { }

  ngOnInit() {
    this.authService.authState.subscribe((user) => {
      this.user = user;
      this.loggedIn = (user != null);
      console.log(this.user);
      if(this.user){
        this.loginbtn = "logout";
      }
    });
}
  
    log(e:any){
    
      if(e=="login"){
        alert("please login with google")
      }
      else if (e=="logout"){
        this.authService.signOut();
        this.loginbtn = "login";
      }
    }
  }

