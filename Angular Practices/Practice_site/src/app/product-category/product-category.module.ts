import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProductCategoryRoutingModule } from './product-category-routing.module';
import { EverythingComponent } from './everything/everything.component';
import { WomenComponent } from './women/women.component';
import { MenComponent } from './men/men.component';
import { AccessoriesComponent } from './accessories/accessories.component';


@NgModule({
  declarations: [
    EverythingComponent,
    WomenComponent,
    MenComponent,
    AccessoriesComponent
  ],
  imports: [
    CommonModule,
    ProductCategoryRoutingModule
  ]
})
export class ProductCategoryModule {
  constructor(){
    console.log("product");
  }
 }
