import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { User } from 'app/core/models/user';
import { Controllers } from 'app/shared/api/api';
import { environment } from 'environments/environment';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }

  create(userDto: User): any {
    return this.http.post<{ message: any }>(`${environment.api}` + Controllers.createUser, { userDto });
  }

  update(userDto: User): any {
    return this.http.post<{ message: any }>(`${environment.api}` + Controllers.userUpdate, { userDto });
  }

  getAllUsers(): any {
    return this.http.get<{ users: User[] }>(`${environment.api}` + Controllers.getUser);
  }

  getById(id: any): any {
    return this.http.get<{ users: User }>(`${environment.api}` + Controllers.getUser + '/' + id);
  }
}
