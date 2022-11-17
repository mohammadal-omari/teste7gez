import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
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

export class VendorComponent extends BaseComponent implements OnInit ,AfterViewInit{
  public items: Item[] = [];

  public itemsFiltered: Item[] = [];

  nameValue = '';
  IDValue = 0;
  Rolevalue = '';
  displayedColumns: string[] = ['Name', 'Country', 'City', 'Menu', 'LocationUrl', 'Point' ,'CategoryName', 'ItemNumber', 'dateCreated', 'deactivate',  'edit'];
  dataSource: MatTableDataSource<any>;

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;
  constructor(private venderServices: VendorService, private router: Router, private toastr: ToastrService) {
    super()
    this.dataSource = new MatTableDataSource(this.items);

  }

  ngOnInit() {
    this.loadData()
  }

  loadData() {
    this.venderServices.getAllItems().subscribe(res => {
      console.log(res);

      this.items = res.items;
      this.dataSource.data = this.items;
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
          toastClass: "alert alert-success alert-with-icon",
          positionClass: "toast-" + 'top' + "-" + 'right'
        }
        );
    });
  }

  edit(item: Item): any {
    this.router.navigate(['/vendor-managment', item.itemNumber]);
  }

  filter(): any {
    this.itemsFiltered = this.items.filter(item => item.itemNumber==this.IDValue || item.name.search(this.nameValue)!=-1);
  }

  clear(): any{
    this.itemsFiltered = this.items;
  }

  ngAfterViewInit() {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;
  }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }
}
