import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Item } from 'app/core/models/item';
import { Controllers } from 'app/shared/api/api';
import { environment } from 'environments/environment';

@Injectable({
  providedIn: 'root'
})
export class VendorService {

  constructor(private http: HttpClient) { }

  craete(itemDto: Item): any {
    return this.http.post<{ message: any }>(`${environment.api}` + Controllers.createItem, { itemDto })
  }

  getAllItems(): any {
    return this.http.get<{ items: Item[] }>(`${environment.api}` + Controllers.getItem)
  }

  getById(id: any): any {
    return this.http.get<{ item: Item }>(`${environment.api}` + Controllers.getItem + '/' + id)
  }

  update(itemDto: Item): any {
    return this.http.post<{ message: any }>(`${environment.api}` + Controllers.itemUpdate, { itemDto });
  }
}
