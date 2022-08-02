import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Item } from 'app/core/models/item';
import { VendorService } from 'app/services/vendor/vendor.service';
import { ToastrService } from 'ngx-toastr';
import { BaseComponent } from '../base.component';



@Component({
  selector: 'table-cmp',
  moduleId: module.id,
  templateUrl: 'vendor.component.html',
  styleUrls: ['vendor.component.css']
})

export class VendorComponent extends BaseComponent implements OnInit {
  public items: Item[] = [];

  public itemsFiltered: Item[] = [];

  nameValue = '';
  IDValue = 0;
  Rolevalue = '';

  constructor(private venderServices: VendorService, private router: Router, private toastr: ToastrService) {
    super()
  }

  ngOnInit() {
    this.loadData()
  }

  loadData() {
    this.venderServices.getAllItems().subscribe(res => {
      this.items = res.items;
      this.itemsFiltered = this.items;
    })
  }

  deactivate(item: Item): any {
    item.isActive = !item.isActive;
    this.venderServices.update(item)
    .subscribe(arg => {
      this.loadData();
      this.toastr.success(
        arg.message,"",{
          timeOut: 4000,
          enableHtml: false,
          closeButton: true,
        }
        );
    });
  }

  edit(item: Item): any {
    this.router.navigate(['/vendor-managment', item.itemNumber]);
  }

  filter(): any {
    this.itemsFiltered = this.items.filter(item => item.itemNumber==this.IDValue || item.name==this.nameValue);
  }

  clear(): any{
    this.itemsFiltered = this.items;
  }
}
