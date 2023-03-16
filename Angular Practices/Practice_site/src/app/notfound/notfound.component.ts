import { Component } from '@angular/core';

@Component({
  selector: 'app-notfound',
  template: `
   <div class="container">
    <h1>Oops!</h1>
    <p>The page you are looking for doesn't exist.</p>
    <a routerLink="/">Go Back Home</a>
  </div>
  `,
  styles: [`
  body {
font-family: Arial, sans-serif;
color: #333;
background-color: #f7f7f7;
}
.container {
max-width: 960px;
margin: 0 auto;
text-align: center;
padding-top: 100px;
}
h1 {
font-size: 72px;
margin: 0;
}
p {
font-size: 18px;
margin: 20px 0;
}
a {
color: #fff;
background-color: #007bff;
border-color: #007bff;
display: inline-block;
font-weight: 400;
text-align: center;
vertical-align: middle;
-webkit-user-select: none;
-moz-user-select: none;
-ms-user-select: none;
user-select: none;
padding: .375rem .75rem;
font-size: 1rem;
line-height: 1.5;
border-radius: .25rem;
text-decoration: none;
}
a:hover {
color: #fff;
background-color: #0069d9;
border-color: #0062cc;
}
`
  ]
})
export class NotfoundComponent {

}
