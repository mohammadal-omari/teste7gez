import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Category } from 'app/core/models/category';
import { Controllers } from 'app/shared/api/api';
import { environment } from 'environments/environment';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  constructor(private http: HttpClient) { }

  craete(categoryDto: Category): any {
    return this.http.post<{message: any}>(`${environment.api}`+Controllers.createCategory, {categoryDto })
  }

  getAllCategories(): any {
    return this.http.get<{categories: Category[]}>(`${environment.api}`+Controllers.getCategory)
  }

  getById(id: any): any {
    return this.http.get<{category: Category}>(`${environment.api}`+Controllers.getCategory + '/' + id)
  }

  update(categoryDto: Category): any {
    return this.http.post<{message: any}>(`${environment.api}`+Controllers.categoryUpdate,{categoryDto});
  }
}
