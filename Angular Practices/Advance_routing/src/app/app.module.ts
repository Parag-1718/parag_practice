import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ArticalComponent } from './artical/artical.component';
import { CommentsComponent } from './comments/comments.component';
import { NotfoundComponent } from './notfound/notfound.component';
import { AddComponent } from './comments/add/add.component';
import { EditComponent } from './comments/edit/edit.component';

import { ArticleService } from './services/article.service';
import { HttpClientModule } from '@angular/common/http'

import { AuthGuard } from './guards/auth.guard';
import { UsersGuard } from './guards/users.guard';
import { FormGuard } from './guards/form.guard';


@NgModule({
  declarations: [
    AppComponent,
    ArticalComponent,
    CommentsComponent,
    NotfoundComponent,
    AddComponent,
    EditComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [
    ArticleService,
    AuthGuard,
    UsersGuard,
    FormGuard
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
