import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { AdminLayoutRoutes } from './admin-layout.routing';

import { DashboardComponent }       from '../../pages/dashboard/dashboard.component';
import { UserComponent }            from '../../pages/user/user.component';
import { VendorComponent }          from '../../pages/vendor/vendor.component';
import { TypographyComponent }      from '../../pages/typography/typography.component';
import { IconsComponent }           from '../../pages/icons/icons.component';
import { FileUploadComponent }      from '../../pages/fileUploader/file-upload.component';
import { NotificationsComponent }   from '../../pages/notifications/notifications.component';
import { UpgradeComponent }         from '../../pages/upgrade/upgrade.component';

import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { VendorManagmentComponent } from 'app/pages/vendor/vendor-managment/vendor-managment.component';
import { MaterialModule } from 'app/shared/material/material.module';
import { HttpClientModule } from '@angular/common/http';
import {ClipboardModule} from '@angular/cdk/clipboard';
import { ActivitiesComponent } from 'app/pages/activities/activities.component';
import { CategoryManageComponent } from 'app/pages/category/category-manage/category-manage.component';
import { CategoryComponent } from 'app/pages/category/category.component';
import { UserManagmentComponent } from 'app/pages/user/user-managment/user-managment.component';

@NgModule({
  imports: [
    CommonModule,
    RouterModule.forChild(AdminLayoutRoutes),
    FormsModule,
    NgbModule,
    ReactiveFormsModule,
    MaterialModule,
    HttpClientModule,
    ClipboardModule
  ],
  declarations: [
    DashboardComponent,
    UserComponent,
    VendorComponent,
    UpgradeComponent,
    TypographyComponent,
    IconsComponent,
    FileUploadComponent,
    NotificationsComponent,
    VendorManagmentComponent,
    UserManagmentComponent,
    CategoryComponent,
    ActivitiesComponent,
    CategoryManageComponent,
  ]
})

export class AdminLayoutModule {}
