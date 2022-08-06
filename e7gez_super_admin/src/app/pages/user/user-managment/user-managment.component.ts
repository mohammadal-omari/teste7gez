import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { User } from 'app/core/models/user';
import { BaseComponent } from 'app/pages/base.component';
import { UserService } from 'app/services/user/user.service';
import { ROLE } from 'app/shared/enums/roles';
import { ToastrService } from 'ngx-toastr';
import {Location, LocationStrategy, PathLocationStrategy} from '@angular/common';

@Component({
  selector: 'app-user-managment',
  templateUrl: './user-managment.component.html',
  providers: [Location, {provide: LocationStrategy, useClass: PathLocationStrategy}],
  styleUrls: ['./user-managment.component.css']
})
export class UserManagmentComponent extends BaseComponent implements OnInit {
  location: Location;
  userForm: FormGroup;
  mode: number = 0;
  userDto: User;
  roles = [{value: ROLE.ADMIN},{value: ROLE.USER}];

  constructor(location: Location,private router: Router,private fb: FormBuilder,private toastr: ToastrService,private userServices: UserService, private activatedRoute: ActivatedRoute) {
    super()
    this.location = location;

  }

  ngOnInit(): void {
    this.createUserForm();
    this.getUserById();
  }


  private getUserById() {
    const id = Number(this.activatedRoute.snapshot.paramMap.get('id'));
    console.log(id);
    if (id != 0) {
      this.mode = 1;
      this.userServices.getById(id)
        .subscribe(res => { this.userForm.patchValue(res.user); });
    }
  }

  private createUserForm() {
    this.userForm = this.fb.group({
      email: ['', [Validators.email, Validators.required]],
      password: ['xxxxx', Validators.required],
      firstname: ['', Validators.required],
      lastname: ['', Validators.required],
      phoneNumber: ['', Validators.required],
      role: ['', Validators.required],
      userNumber: ['', Validators.required],
      point: [0],
    });
    this.userForm.get('userNumber').disable()
  }

  public save(): any {
    if(this.userForm.invalid){
      Object.keys(this.userForm.controls).forEach(key => {
        if(this.userForm.controls[key].invalid){
          this.keyErrors.push(key)
        }
     });

     this.toastr.error(
      this.keyErrors.join(' '),"Required",{
        timeOut: 4000,
        enableHtml: false,
        closeButton: true,
        positionClass: "toast-" + 'top' + "-" + 'right',
        toastClass: "alert alert-danger alert-with-icon",

      }
      );
      this.keyErrors = [];
      return;
    }

    this.userDto = this.userForm.getRawValue();
    console.log(this.userDto);
    if(this.mode == 0) {
      this.userServices.create(this.userDto)
      .subscribe(arg => {
        this.toastr.success(
          arg.message,"",{
            timeOut: 4000,
            enableHtml: false,
            closeButton: true,
            positionClass: "toast-" + 'top' + "-" + 'right',
            toastClass: "alert alert-success alert-with-icon",

          }
          );
      });
    } else {
      this.userServices.update(this.userDto)
      .subscribe(arg => {
        this.toastr.success(
          arg.message,"",{
            timeOut: 4000,
            enableHtml: false,
            closeButton: true,
          }
          );
      });
    }
    this.router.navigate(['/user']);
  }

  goBack(): void {
    this.location.back();
  }
}
