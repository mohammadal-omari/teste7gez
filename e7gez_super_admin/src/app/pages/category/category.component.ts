import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Category } from 'app/core/models/category';
import { CategoryService } from 'app/services/category/category.service';
import { ToastrService } from 'ngx-toastr';
import { BaseComponent } from '../base.component';

@Component({
  selector: 'app-category',
  templateUrl: './category.component.html',
  styleUrls: ['./category.component.css']
})
export class CategoryComponent extends BaseComponent implements OnInit {

  //roles = [{ value: ROLE.ADMIN }, { value: ROLE.USER }];
  public categories: Category[] = [];
  public categoriesFiltered: Category[] = [];
  isChecked = true;
  public emailValue = '';
  public IDValue = 0;
  public Rolevalue = '';

  constructor(private categoryServices: CategoryService, private router: Router, private toastr: ToastrService) {
    super();

  }

  ngOnInit() {
    this.getAllCategories();
  }

  edit(user: Category): any {
    this.router.navigate(['/category-managment', user.categoryNumber]);
  }

  deactivate(category: Category): any {
    category.isActive = !category.isActive;

    this.categoryServices.update(category)
      .subscribe(arg => {
        this.getAllCategories();
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

  getAllCategories(): any {
    this.categoryServices.getAllCategories()
      .subscribe(arg => {
        this.categories = arg.categories;
        this.categoriesFiltered = this.categories;
      });

  }

  filter(): any {
    this.categoriesFiltered = this.categories.filter(category => category.categoryNumber == this.IDValue || category.categoryName.search(this.emailValue) != -1);
  }

  clear(): any {
    this.categoriesFiltered = this.categories;
  }

}
