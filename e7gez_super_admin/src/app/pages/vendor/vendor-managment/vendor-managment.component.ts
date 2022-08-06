import {Location, LocationStrategy, PathLocationStrategy} from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Category } from 'app/core/models/category';
import { Item } from 'app/core/models/item';
import { User } from 'app/core/models/user';
import { BaseComponent } from 'app/pages/base.component';
import { CategoryService } from 'app/services/category/category.service';
import { UserService } from 'app/services/user/user.service';
import { VendorService } from 'app/services/vendor/vendor.service';
import { ROLE } from 'app/shared/enums/roles';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-vendor-managment',
  templateUrl: './vendor-managment.component.html',
  providers: [Location, {provide: LocationStrategy, useClass: PathLocationStrategy}],

  styleUrls: ['./vendor-managment.component.css']
})
export class VendorManagmentComponent extends BaseComponent implements OnInit {
  location: Location;
  vendorForm: FormGroup;
  mode: number = 0;
  itemDto: Item;
  hasPage = false;
  itemUsers: User[] = [];
  // user = new FormControl('');

  users: User[] = [];
  categories: Category[] = [];

  constructor(private categoryService: CategoryService, location: Location,private activatedRoute: ActivatedRoute,private userServices: UserService,private vendorServices: VendorService, private fb: FormBuilder, private toastr: ToastrService, private router: Router) {
    super()
    this.location = location;
  }

  ngOnInit(): void {
    this.createvendorForm();
    this.getAllAdmin();
    this.getUserById();
    this.getCategroies();
  }

  getCategroies() {
    this.categoryService.getAllCategories().subscribe(res => {
      this.categories = res.categories;
    })
  }

  getAllAdmin() {
    this.userServices.getAllUsers().subscribe(res => {
      this.users = res.users.filter(u => u.role.toLowerCase()==ROLE.ADMIN.toString().toLowerCase());
    })
  }

  private getUserById() {
    const id = Number(this.activatedRoute.snapshot.paramMap.get('id'));
    console.log(id);
    if (id != 0) {
      this.mode = 1;
      this.vendorServices.getById(id)
        .subscribe(res => {
          this.itemUsers = this.users.filter(u => res.item.admins.includes(u._id))
          console.log(this.itemUsers);

          this.vendorForm.patchValue(res.item);
        });
    }
  }

  private createvendorForm() {
    this.vendorForm = this.fb.group({
      name: ['', Validators.required],
      country: ['', Validators.required],
      city: ['', [Validators.required]],
      menu: [''],
      categoryName: ['', Validators.required],
      point: [0, Validators.required],
      itemNumber: [0, Validators.required],
      locationUrl: [''],
      admins : ['']

    });
  }

  public selectedAdmins(data: any) {
    // console.log(this.user.value);
  }

  public save(): any {
    if (this.vendorForm.invalid) {
      Object.keys(this.vendorForm.controls).forEach(key => {
        if (this.vendorForm.controls[key].invalid) {
          this.keyErrors.push(key)
        }
      });

      this.toastr.error(
        this.keyErrors.join(' '), "Required", {
        timeOut: 4000,
        enableHtml: false,
        closeButton: true,
        toastClass: "alert alert-danger alert-with-icon",
        positionClass: "toast-" + 'top' + "-" + 'right'

      }
      );
      this.keyErrors = [];
      return;
    }

    this.itemDto = this.vendorForm.getRawValue();
    console.log(this.itemDto);
    if(this.mode == 0) {
      this.vendorServices.craete(this.itemDto).subscribe(res => {
        this.toastr.success(
          res.message, "", {
          timeOut: 4000,
          enableHtml: false,
          closeButton: true,
          toastClass: "alert alert-info alert-with-icon",
          positionClass: "toast-" + 'top' + "-" + 'right'
        }
        );
      })
    } else {
      this.vendorServices.update(this.itemDto).subscribe(res => {
        this.toastr.success(
          res.message, "", {
          timeOut: 4000,
          enableHtml: false,
          closeButton: true,
          toastClass: "alert alert-success alert-with-icon",
          positionClass: "toast-" + 'top' + "-" + 'right'
        }
        );
      })
    }
    this.router.navigate(['/vendor']);
  }

  goBack(): void {
    this.location.back();
  }
}
