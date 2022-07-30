import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'user-cmp',
    moduleId: module.id,
    templateUrl: 'user.component.html',
    styleUrls: ['user.component.css']
})

export class UserComponent implements OnInit{
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
