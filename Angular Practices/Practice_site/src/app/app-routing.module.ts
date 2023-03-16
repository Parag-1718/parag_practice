import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { NotfoundComponent } from './notfound/notfound.component';

const routes: Routes = [
 
  {
    path: 'product-category',
    loadChildren: () => import('./product-category/product-category.module').then(m => m.ProductCategoryModule)
  },
  {
    path: 'users',
    loadChildren:()=> import('./users/users.module').then(m => m.UsersModule)
  },
  {
    path: 'dashbord',
    loadChildren:() => import('./dashbord/dashbord.module').then(m => m.DashbordModule)
  },
  {
    path: '',
    component:HomeComponent
  },
  {
    path:'**',
    component:NotfoundComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
