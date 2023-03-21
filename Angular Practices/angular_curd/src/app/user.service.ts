import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { environment } from 'src/environments/environment.development';
import { userModel } from 'src/user-model';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  base_url = environment.baseUrl;
  user_url = environment.userUrl;
  
  constructor(private http: HttpClient, private router: Router) {}

  addUser(data: userModel) {
    return this.http
      .post(this.base_url + this.user_url, data, { observe: 'response' })
      .subscribe((res: any) => {
        console.log('user', res);
      });
  }

  userArr: any = [];
  getUser() {
    return this.http
      .get(this.base_url + this.user_url, { observe: 'response' })
      
    // console.log(this.userArr);
    // return this.userArr;
  }

  editUser(id:any) {
  // get the id data releted to id
   return this.http.get(this.base_url+this.user_url+`/${id}`)
  }

  deleteUser(data:userModel){
   return this.http.delete(this.base_url+this.user_url+`/${data.id}`)
  }

  ngOnInit(){
    this.getUser();
  }

  editUserData(id:any,data:userModel){
    return this.http.put(this.base_url+this.user_url+`/${id}`,data).subscribe();
  }

}