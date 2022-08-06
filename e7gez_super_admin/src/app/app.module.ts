import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { ToastrModule } from "ngx-toastr";

import { SidebarModule } from './sidebar/sidebar.module';
import { FooterModule } from './shared/footer/footer.module';
import { NavbarModule} from './shared/navbar/navbar.module';
import { FixedPluginModule} from './shared/fixedplugin/fixedplugin.module';

import { AppComponent } from './app.component';
import { AppRoutes } from './app.routing';

import { AdminLayoutComponent } from './layouts/admin-layout/admin-layout.component';
import { ReactiveFormsModule } from "@angular/forms";
import { MaterialModule } from "./shared/material/material.module";
import { UserManagmentComponent } from './pages/user/user-managment/user-managment.component';
import { HttpClientModule } from "@angular/common/http";
import {ClipboardModule} from '@angular/cdk/clipboard';
import { CategoryComponent } from './pages/category/category.component';
import { ActivitiesComponent } from './pages/activities/activities.component';
import { CategoryManageComponent } from './pages/category/category-manage/category-manage.component';


@NgModule({
  declarations: [
    AppComponent,
    AdminLayoutComponent,
    // UserManagmentComponent,
    // CategoryComponent,
    // ActivitiesComponent,
    // CategoryManageComponent,
  ],
  imports: [
    BrowserAnimationsModule,
    RouterModule.forRoot(AppRoutes,{
      useHash: true
    }),
    SidebarModule,
    NavbarModule,
    ToastrModule.forRoot(),
    FooterModule,
    FixedPluginModule,
    ReactiveFormsModule,
    MaterialModule,
    HttpClientModule,
    ClipboardModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
