import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ArticleService {

  constructor(private http:HttpClient) { }
  data:any;
  getApi(){
     
    this.data = this.http.get("https://jsonplaceholder.typicode.com/todos")
    return this.data;
  }

  userLogin(){
    return true;
  }
}
