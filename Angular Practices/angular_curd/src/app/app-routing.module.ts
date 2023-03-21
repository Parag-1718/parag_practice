import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddUserComponent } from './add-user/add-user.component';
import { HomeComponent } from './home/home.component';

const routes: Routes = [
  {
    path:'', redirectTo:'/home',
   pathMatch:'full'
  },
  {
    path:'home',
    component:HomeComponent
  },
  {
    path:'add',
    component:AddUserComponent
  },
  {
    path:'update/:id',
    component:AddUserComponent
  },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
