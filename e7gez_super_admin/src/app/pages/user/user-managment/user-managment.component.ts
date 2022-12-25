import { AfterViewInit, Component, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { User } from 'app/core/models/user';
import { BaseComponent } from 'app/pages/base.component';
import { UserService } from 'app/services/user/user.service';
import { ROLE } from 'app/shared/enums/roles';
import { ToastrService } from 'ngx-toastr';
import { Location, LocationStrategy, PathLocationStrategy } from '@angular/common';
import { ReplaySubject, Subject, take, takeUntil } from 'rxjs';
import { VendorService } from 'app/services/vendor/vendor.service';
import { Item } from 'app/core/models/item';
import { MatSelect } from '@angular/material/select';

@Component({
  selector: 'app-user-managment',
  templateUrl: './user-managment.component.html',
  providers: [Location, { provide: LocationStrategy, useClass: PathLocationStrategy }],
  styleUrls: ['./user-managment.component.css']
})
export class UserManagmentComponent extends BaseComponent implements OnInit, AfterViewInit, OnDestroy {

  eventsSubject: Subject<any> = new Subject<any>();
  @ViewChild('singleSelect', { static: true }) singleSelect: MatSelect;

  location: Location;
  userForm: FormGroup;
  mode: number = 0;
  userDto: User;
  roles = [{ value: ROLE.ADMIN }, { value: ROLE.USER }];
  fileName = ''
  file: any;
  venders: Item[];

  constructor(location: Location, private router: Router, private fb: FormBuilder, private toastr: ToastrService,
    private userServices: UserService,
    private activatedRoute: ActivatedRoute,
    private vendorService: VendorService) {
    super()
    this.location = location;

  }

  ngOnInit(): void {

    this.createUserForm();
    this.getUserById();
    this.getAllVendors();

    // this.keyFilterCtrl.valueChanges
    //   .pipe(takeUntil(this._onDestroy))
    //   .subscribe(() => {
    //     this.getAllVendors();
    //     this.userForm.get('vendorId').setValue(this.venders[0]._id);
    //     this.filterData();
    //   });
  }


  private getAllVendors() {
    this.vendorService.getAllItems().subscribe(items => {
      this.venders = items.items;
      console.log(this.venders);

    });
  }

  private getUserById() {
    const id = Number(this.activatedRoute.snapshot.paramMap.get('id'));
    console.log(id);
    if (id != 0) {
      this.mode = 1;
      this.userServices.getById(id)
        .subscribe(res => {
          this.userForm.patchValue(res.user);
          this.fileName = res.user.imagePath.filePath;
          this.emitEventToChild(this.fileName)
        });
    }
  }

  emitEventToChild(value: any) {
    this.eventsSubject.next(value);
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
      vendorId: ['']
    });
    this.userForm.get('userNumber').disable()
  }

  public save(): any {
    if (this.userForm.invalid) {
      Object.keys(this.userForm.controls).forEach(key => {
        if (this.userForm.controls[key].invalid) {
          this.keyErrors.push(key)
        }
      });

      this.toastr.error(
        this.keyErrors.join(' '), "Required", {
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
    this.userDto.imagePath = this.file;
    console.log(this.userDto);
    if (this.mode == 0) {
      this.userServices.create(this.userDto)
        .subscribe(arg => {
          this.toastr.success(
            arg.message, "", {
            timeOut: 4000,
            enableHtml: false,
            closeButton: true,
            positionClass: "toast-" + 'top' + "-" + 'right',
            toastClass: "alert alert-success alert-with-icon",

          });
          this.router.navigate(['/user', { refresh: true }]).then(() => {
            window.location.reload();
          });
        });
    } else {
      this.userServices.update(this.userDto)
        .subscribe(arg => {
          this.toastr.success(
            arg.message, "", {
            timeOut: 4000,
            enableHtml: false,
            closeButton: true,
          }
          );
          this.router.navigate(['/user', { refresh: true }]).then(() => {
            window.location.reload();
          });
        });
    }

  }

  handleFileId(e: any) {
    this.file = e;
  }

  goBack(): void {
    this.location.back();
  }

  ngAfterViewInit(): void {
    this.setInitialValue();
  }
  ngOnDestroy() {
    this._onDestroy.next();
    this._onDestroy.complete();
  }
  protected filterData() {
    if (!this.venders) {
      return;
    }
    // get the search keyword
    let search = this.keyFilterCtrl.value;
    if (!search) {
      this.filteredData.next(this.venders.slice());
      return;
    } else {
      search = search.toLowerCase();
    }
    // filter the banks
    this.filteredData.next(
      this.venders.filter(e => e.name.toLowerCase().indexOf(search) > -1)
    );
  }

  protected setInitialValue() {
    this.filteredData
      .pipe(take(1), takeUntil(this._onDestroy))
      .subscribe(() => {
        // setting the compareWith property to a comparison function
        // triggers initializing the selection according to the initial value of
        // the form control (i.e. _initializeSelection())
        // this needs to be done after the filteredBanks are loaded initially
        // and after the mat-option elements are available
        this.singleSelect.compareWith = (a: any, b: any) => a && b && a.id === b.id;
      });
  }
}
