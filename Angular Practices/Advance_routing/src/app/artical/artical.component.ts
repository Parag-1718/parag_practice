import { Component } from '@angular/core';
import { ArticleService } from '../services/article.service'

@Component({
  selector: 'app-artical',
  templateUrl: './artical.component.html',
  styleUrls: ['./artical.component.css']
})
export class ArticalComponent {

  constructor(private articleservice:ArticleService){ }
 
  result:any;
  ngOnInit(){
    localStorage.removeItem("form")
    this.articleservice.getApi().subscribe((res:any)=>{
      this.result = res
    })
  }

  submitbtn(){
    localStorage.setItem("form", "done")
    console.log(localStorage.getItem("form"));
  }
}
