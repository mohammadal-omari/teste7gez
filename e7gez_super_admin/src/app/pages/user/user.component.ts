import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { User } from 'app/core/models/user';
import { UserService } from 'app/services/user/user.service';
import { ROLE } from 'app/shared/enums/roles';
import { BaseComponent } from '../base.component';
import { ToastrService } from 'ngx-toastr';

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

  constructor(private userServices: UserService, private router: Router,private toastr: ToastrService) {
    super();

  }

  ngOnInit() {
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
        arg.message,"",{
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
        this.usersFiltered = this.users;
      });

  }

  filter(): any {
    console.log(this.emailValue);

    this.usersFiltered = this.users.filter(user => user.userNumber == this.IDValue || user.email.search(this.emailValue)!=-1 || user.role == this.Rolevalue)
  }

  clear(): any {
    this.usersFiltered = this.users;
  }
}
