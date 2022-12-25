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
import { HttpClientModule, HTTP_INTERCEPTORS } from "@angular/common/http";
import {ClipboardModule} from '@angular/cdk/clipboard';
import { CategoryComponent } from './pages/category/category.component';
import { ActivitiesComponent } from './pages/activities/activities.component';
import { CategoryManageComponent } from './pages/category/category-manage/category-manage.component';
import { LoadFilePipe } from './shared/load-file.pipe';
import { MessageViewComponent } from './shared/message-view/message-view.component';
import { ShowPasswordComponent } from './shared/show-password/show-password.component';
import { FormsModule } from '@angular/forms';
import { AuthenticationServiceService } from "./services/authentication-service.service";
import { AuthGuard } from "./core/guard/auth.guard";
import { AuthInterceptor } from "./services/auth.interceptor";
import { HashLocationStrategy, LocationStrategy } from "@angular/common";
import { InterceptorService } from "./loader/interceptor.service";
import { NgxSpinnerModule } from "ngx-spinner";
import { MatListWithSearchComponent } from './shared/mat-list-with-search/mat-list-with-search.component';


@NgModule({
  declarations: [
    AppComponent,
    AdminLayoutComponent,
    LoadFilePipe,
    MessageViewComponent,
    ShowPasswordComponent,
    MatListWithSearchComponent,
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
    FormsModule,
    FixedPluginModule,
    ReactiveFormsModule,
    MaterialModule,
    HttpClientModule,
    ClipboardModule,
    NgxSpinnerModule
  ],
  providers: [
    AuthenticationServiceService, AuthGuard,
    { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true },
    { provide: LocationStrategy, useClass: HashLocationStrategy },
    { provide: HTTP_INTERCEPTORS, useClass: InterceptorService, multi: true }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
