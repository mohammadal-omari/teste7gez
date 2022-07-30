import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Item } from 'app/core/models/item';
import { BaseComponent } from 'app/pages/base.component';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-vendor-managment',
  templateUrl: './vendor-managment.component.html',
  styleUrls: ['./vendor-managment.component.css']
})
export class VendorManagmentComponent extends BaseComponent implements OnInit {

  vendorForm: FormGroup;
  mode: number;
  itemDto: Item;
  hasPage = false;
  toppings = new FormControl('');

  toppingList: string[] = ['Extra cheese', 'Mushroom', 'Onion', 'Pepperoni', 'Sausage', 'Tomato'];
  constructor(private fb: FormBuilder,private toastr: ToastrService) {
    super()
  }

  ngOnInit(): void {
    this.createvendorForm();
  }


  private createvendorForm() {
    this.vendorForm = this.fb.group({
      name: ['', Validators.required],
      country: ['', Validators.required],
      city: ['', [Validators.required]],
      menu: [''],
      categoryName: ['', Validators.required],
      point: [0, Validators.required],
      userNumber: [0, Validators.required],
      locationUrl: [''],

    });
  }

  public save(): any {
    if(this.vendorForm.invalid){
      Object.keys(this.vendorForm.controls).forEach(key => {
        if(this.vendorForm.controls[key].invalid){
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

    this.itemDto = this.vendorForm.getRawValue();
    console.log(this.itemDto);

  }

}
