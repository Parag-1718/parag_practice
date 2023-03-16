import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ArticalComponent } from './artical/artical.component';
import { AddComponent } from './comments/add/add.component';
import { CommentsComponent } from './comments/comments.component';
import { EditComponent } from './comments/edit/edit.component';

import { AuthGuard } from './guards/auth.guard';
import { FormGuard } from './guards/form.guard';
import { UsersGuard } from './guards/users.guard';
import { NotfoundComponent } from './notfound/notfound.component';

const routes: Routes = [
  {
    path:'', 
    component:ArticalComponent, canActivate:[AuthGuard]
  },
  {
    path:'artical',
    component:ArticalComponent , 
    // canActivate:[AuthGuard],
    canDeactivate:[FormGuard]
  },
  {
    path:'comments',
    component:CommentsComponent, canActivateChild:[UsersGuard], canActivate:[AuthGuard],
    children:[
      {path:'edit', component:EditComponent, outlet:'pj'},
      {path:'add', component:AddComponent}
    ]
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
