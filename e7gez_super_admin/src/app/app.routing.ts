import { Routes } from '@angular/router';
import { AuthGuard } from './core/guard/auth.guard';

import { AdminLayoutComponent } from './layouts/admin-layout/admin-layout.component';

export const AppRoutes: Routes = [
  {
    path: 'auth',
    loadChildren: () => import('./auth/auth.module').then(m => m.AuthModule)
  },
  {
    path: '',
    redirectTo: 'dashboard',
    canActivate: [AuthGuard],
    pathMatch: 'full',
  }, {
    path: '',
    component: AdminLayoutComponent,
    canActivate: [AuthGuard],
    children: [
      {
        path: '',
        loadChildren: () => import('./layouts/admin-layout/admin-layout.module').then(x => x.AdminLayoutModule)
      }]
  },
  {
    path: '**',
    canActivate: [AuthGuard],
    redirectTo: 'dashboard'
  }
]
