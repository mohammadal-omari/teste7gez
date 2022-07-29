import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Item } from 'app/core/models/item';
import { BaseComponent } from 'app/pages/base.component';

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
  constructor(private fb: FormBuilder) {
    super()
  }

  ngOnInit(): void {
    this.createvendor();
  }


  private createvendor() {
    this.vendorForm = this.fb.group({
      name: ['', Validators.required],
      country: ['', Validators.required],
      city: ['', [Validators.email, Validators.required]],
      menu: ['', Validators.required],
      categoryName: ['', Validators.required],
      point: ['', Validators.required],
      userNumber: ['', Validators.required],
      location: ['', Validators.required],

    });

  }

}
