import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { User } from 'app/core/models/user';
import { UserService } from 'app/services/user/user.service';
import { ROLE } from 'app/shared/enums/roles';
import { BaseComponent } from '../base.component';
import { ToastrService } from 'ngx-toastr';
import { MatDialog } from '@angular/material/dialog';
import { ShowPasswordComponent } from 'app/shared/show-password/show-password.component';

@Component({
  selector: 'user-cmp',
  moduleId: module.id,
  templateUrl: 'user.component.html',
  styleUrls: ['user.component.css']
})

export class UserComponent extends BaseComponent implements OnInit {

  roles = [{ value: ROLE.ADMIN }, { value: ROLE.USER }];
  public users: User[] = [];
  public usersFiltered: User[] = [];
  isChecked = true;
  emailValue = '';
  IDValue = 0;
  Rolevalue = '';
  refresh: any;

  constructor(public dialog: MatDialog, private activatedRoute: ActivatedRoute, private userServices: UserService, private router: Router, private toastr: ToastrService) {
    super();

  }

  ngOnInit() {
    this.refresh = this.activatedRoute.snapshot.paramMap.get('refresh');
    this.getAllUsers();

  }

  edit(user: User): any {
    this.router.navigate(['/user-managment', user.userNumber]);
  }

  deactivate(user: User): any {
    user.isActive = !user.isActive;

    this.userServices.update(user)
      .subscribe(arg => {
        this.getAllUsers();
        this.toastr.success(
          arg.message, "", {
          timeOut: 4000,
          enableHtml: false,
          closeButton: true,
          toastClass: "alert alert-success alert-with-icon",
          positionClass: "toast-" + 'top' + "-" + 'right'
        }
        );
      });
  }

  getAllUsers(): any {
    this.userServices.getAllUsers()
      .subscribe(arg => {
        this.users = arg.users;
        this.usersFiltered.push(...this.users);


      });

  }

  filter(): any {
    console.log(this.Rolevalue);

    this.usersFiltered = this.users.filter(user => user.userNumber == this.IDValue || user.role.search(this.Rolevalue.toString()) != -1 || user.email.search(this.emailValue) != -1)
    console.log(this.usersFiltered);

  }

  showPassword(user: User): any{
    const dialogRef = this.dialog.open(ShowPasswordComponent, {
      width: '400px',
      data: { object: user },
    });

    dialogRef.afterClosed().subscribe(result => {
      // this.baseService.view(feed).subscribe((res: any) => {
      //   if (res.modifiedCount) {
      //     this.loadData();
      //   }
      // })
    });
  }

  clear(): any {
    this.usersFiltered = this.users;
  }
}
