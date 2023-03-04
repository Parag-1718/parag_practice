import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule , routingComponents} from './app-routing.module';
import { AppComponent } from './app.component';
import { TodoListComponent } from './todo-list/todo-list.component';
import { FormsModule } from '@angular/forms';
import { DepartmentsComponent } from './departments/departments.component';
import { EmployeesComponent } from './employees/employees.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { DepartmentsDetailsComponent } from './departments-details/departments-details.component';
@NgModule({
  declarations: [
    AppComponent,
    TodoListComponent,
   routingComponents,
   PageNotFoundComponent,
   DepartmentsDetailsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
