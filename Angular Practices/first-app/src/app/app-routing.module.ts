import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DepartmentsDetailsComponent } from './departments-details/departments-details.component';
import { DepartmentsComponent } from './departments/departments.component';
import { EmployeesComponent } from './employees/employees.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { TodoListComponent } from './todo-list/todo-list.component';

const routes: Routes = [
  {path:"", redirectTo:"/departments", pathMatch:'full'},
  {path:"todo-list",component:TodoListComponent},
  {path:"departments",component:DepartmentsComponent},
  {path:'departments/:id', component:DepartmentsDetailsComponent},
  {path:"employees",component:EmployeesComponent},
  {path:"**", component:PageNotFoundComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
export const routingComponents = [
  TodoListComponent,
  DepartmentsComponent,
  EmployeesComponent,
  PageNotFoundComponent,
  DepartmentsDetailsComponent
]
