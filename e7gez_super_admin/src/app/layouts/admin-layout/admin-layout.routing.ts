import { Routes } from '@angular/router';

import { DashboardComponent } from '../../pages/dashboard/dashboard.component';
import { UserComponent } from '../../pages/user/user.component';
import { VendorComponent } from '../../pages/vendor/vendor.component';
import { TypographyComponent } from '../../pages/typography/typography.component';
import { IconsComponent } from '../../pages/icons/icons.component';
import { MapsComponent } from '../../pages/maps/maps.component';
import { NotificationsComponent } from '../../pages/notifications/notifications.component';
import { UpgradeComponent } from '../../pages/upgrade/upgrade.component';
import { VendorManagmentComponent } from 'app/pages/vendor/vendor-managment/vendor-managment.component';
import { UserManagmentComponent } from 'app/pages/user/user-managment/user-managment.component';
import { CategoryManageComponent } from 'app/pages/category/category-manage/category-manage.component';
import { CategoryComponent } from 'app/pages/category/category.component';

export const AdminLayoutRoutes: Routes = [
    { path: 'dashboard',      component: DashboardComponent },
    { path: 'user',           component: UserComponent },
    { path: 'vendor',          component: VendorComponent },
    { path: 'categories',     component: CategoryComponent },
    { path: 'icons',          component: IconsComponent },
    { path: 'maps',           component: MapsComponent },
    { path: 'notifications',  component: NotificationsComponent },
    { path: 'vendor-managment',  component: VendorManagmentComponent },
    { path: 'vendor-managment/:id',  component: VendorManagmentComponent },
    { path: 'user-managment/:id',  component: UserManagmentComponent },
    { path: 'user-managment',  component: UserManagmentComponent },
    { path: 'category-managment/:id',  component: CategoryManageComponent },
    { path: 'category-managment',  component: CategoryManageComponent },
    { path: 'upgrade',        component: UpgradeComponent }
];
