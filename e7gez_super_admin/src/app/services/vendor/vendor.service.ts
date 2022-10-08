import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Item } from 'app/core/models/item';
import { Controllers } from 'app/shared/api/api';

@Injectable({
  providedIn: 'root'
})
export class VendorService {

  constructor(private http: HttpClient) { }

  craete(itemDto: Item): any {
    return this.http.post<{message: any}>(Controllers.createItem, {itemDto })
  }

  getAllItems(): any {
    return this.http.get<{items: Item[]}>(Controllers.getItem)
  }

  getById(id: any): any {
    return this.http.get<{item: Item}>(Controllers.getItem + '/' + id)
  }

  update(itemDto: Item): any {
    return this.http.post<{message: any}>(Controllers.itemUpdate,{itemDto});
  }
}
