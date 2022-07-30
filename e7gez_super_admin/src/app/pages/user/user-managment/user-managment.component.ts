import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { User } from 'app/core/models/user';
import { BaseComponent } from 'app/pages/base.component';
import { UserService } from 'app/services/user/user.service';
import { ROLE } from 'app/shared/enums/roles';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-user-managment',
  templateUrl: './user-managment.component.html',
  styleUrls: ['./user-managment.component.css']
})
export class UserManagmentComponent extends BaseComponent implements OnInit {

  userForm: FormGroup;
  mode: number = 0;
  userDto: User;
  roles = [{value: ROLE.ADMIN},{value: ROLE.USER}];
  constructor(private fb: FormBuilder,private toastr: ToastrService,private userServices: UserService) {
    super()
  }

  ngOnInit(): void {
    this.createUserForm();
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
        toastClass: "alert alert-danger alert-with-icon",

      }
      );
      this.keyErrors = [];
      return;
    }

    this.userDto = this.userForm.getRawValue();
    console.log(this.userDto);
    this.userServices.create(this.userDto)
      .subscribe(arg => {
        this.toastr.success(
          arg.message,"Succsess",{
            timeOut: 4000,
            enableHtml: false,
            closeButton: true,
          }
          );
      });


  }
}
