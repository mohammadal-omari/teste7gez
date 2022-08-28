import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { NavbarComponent } from './navbar.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import {MatBadgeModule} from '@angular/material/badge';

@NgModule({
    imports: [ RouterModule, CommonModule, NgbModule,MatBadgeModule ],
    declarations: [ NavbarComponent ],
    exports: [ NavbarComponent ]
})

export class NavbarModule {}
