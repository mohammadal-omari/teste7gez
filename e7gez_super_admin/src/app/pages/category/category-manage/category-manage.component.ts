import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Category } from 'app/core/models/category';
import { BaseComponent } from 'app/pages/base.component';
import { CategoryService } from 'app/services/category/category.service';
import { ToastrService } from 'ngx-toastr';
import {Location, LocationStrategy, PathLocationStrategy} from '@angular/common';
import { CategoryCode } from 'app/shared/enums/catogey.code';

@Component({
  selector: 'app-category-manage',
  templateUrl: './category-manage.component.html',
  providers: [Location, {provide: LocationStrategy, useClass: PathLocationStrategy}],
  styleUrls: ['./category-manage.component.css']
})
export class CategoryManageComponent extends BaseComponent implements OnInit {

  location: Location;
  categoryForm: FormGroup;
  mode: number = 0;
  categoryDto: Category;

  CategoryCodes = [{value: CategoryCode.RES},{value: CategoryCode.COFF}];

  constructor(location: Location,private router: Router,private fb: FormBuilder,private toastr: ToastrService,private categoryService: CategoryService, private activatedRoute: ActivatedRoute) {
    super()
    this.location = location;

  }

  ngOnInit(): void {
    this.createCatogryForm();
    this.getCateogryById();
  }


  private getCateogryById() {
    const id = Number(this.activatedRoute.snapshot.paramMap.get('id'));
    console.log(id);
    if (id != 0) {
      this.mode = 1;
      this.categoryService.getById(id)
        .subscribe(res => { this.categoryForm.patchValue(res.category); });
    }
  }

  private createCatogryForm() {
    this.categoryForm = this.fb.group({
      categoryName: ['', Validators.required],
      categoryCode: ['', Validators.required],
      categoryNumber: [0, Validators.required],
    });
    this.categoryForm.get('categoryNumber').disable()
  }

  public save(): any {
    if(this.categoryForm.invalid){
      Object.keys(this.categoryForm.controls).forEach(key => {
        if(this.categoryForm.controls[key].invalid){
          this.keyErrors.push(key)
        }
     });

     this.toastr.error(
      this.keyErrors.join(' '),"Required",{
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

    this.categoryDto = this.categoryForm.getRawValue();
    this.categoryDto.categoryCode = this.categoryDto.categoryCode[0];
    console.log(this.categoryDto);
    if(this.mode == 0) {
      this.categoryService.craete(this.categoryDto)
      .subscribe(arg => {
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
    } else {
      this.categoryService.update(this.categoryDto)
      .subscribe(arg => {
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
    this.router.navigate(['/categories']);
  }

  public selectedCode(data: any) {
    // console.log(this.user.value);
  }

  goBack(): void {
    this.location.back();
  }

}
