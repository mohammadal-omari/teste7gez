import { Component, OnInit } from '@angular/core';



@Component({
    selector: 'table-cmp',
    moduleId: module.id,
    templateUrl: 'vendor.component.html',
    styleUrls: ['vendor.component.css']
})

export class VendorComponent implements OnInit{
    public items: any;
    ngOnInit(){
        this.items = [
        {'Name':'Dakota Rice',  'City':'Curaçao', 'Country':'Netherlands', 'menu':'Malawi', 'categoryName':'Feldkirchen', 'itemNumber':'Overland Pa'},
        {'Name':'Dakota Rice',  'City':'Curaçao', 'Country':'Netherlands', 'menu':'Malawi', 'categoryName':'Feldkirchen', 'itemNumber':'Overland Pa'},
        {'Name':'Dakota Rice',  'City':'Curaçao', 'Country':'Netherlands', 'menu':'Malawi', 'categoryName':'Feldkirchen', 'itemNumber':'Overland Pa'},
        {'Name':'Dakota Rice',  'City':'Curaçao', 'Country':'Netherlands', 'menu':'Malawi', 'categoryName':'Feldkirchen', 'itemNumber':'Overland Pa'},
        {'Name':'Dakota Rice',  'City':'Curaçao', 'Country':'Netherlands', 'menu':'Malawi', 'categoryName':'Feldkirchen', 'itemNumber':'Overland Pa'},
        {'Name':'Dakota Rice',  'City':'Curaçao', 'Country':'Netherlands', 'menu':'Malawi', 'categoryName':'Feldkirchen', 'itemNumber':'Overland Pa'}
            ]
    }

    edit(item: any): any{

    }
}
