import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AccessoriesComponent } from './accessories/accessories.component';
import { EverythingComponent } from './everything/everything.component';
import { MenComponent } from './men/men.component';
import { WomenComponent } from './women/women.component';

const routes: Routes = [
  {
    path:'everything',
    component:EverythingComponent
  },
  {
    path:'accessories',
    component:AccessoriesComponent
  },
  {
    path:'women',
    component:WomenComponent
  },
  {
    path:'men',
    component:MenComponent
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ProductCategoryRoutingModule { }
