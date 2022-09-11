import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable, Subject } from 'rxjs';
import { User } from '../core/models/user';
import { map } from 'rxjs/operators';
import { MatSnackBar } from '@angular/material/snack-bar';
import { BaseService } from './base.service';
import { environment } from 'environments/environment';
import { Login } from 'app/core/models/login';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationServiceService {

  private currentUserSubject: BehaviorSubject<User>;
  public currentUser: Observable<User>;
  private isAuthenticated = false;
  private token: string;
  private tokenTimer: any;
  private userId: string;
  public firstname: string;


  private authStatusListener = new Subject<boolean>();
  constructor(private http: HttpClient, private _snackBar: MatSnackBar) {
    this.currentUserSubject = new BehaviorSubject<any>(sessionStorage.getItem('currentTeacher'));
    this.currentUser = this.currentUserSubject.asObservable();
  }

  public get currentUserValue(): User {
    return this.currentUserSubject.value;
  }

  login(login: Login): any {

    return this.http.post<{ user: User }>(`${environment.api}/auth`,
      { login })
      .pipe(map(user => {
        if (user && user['token']) {
          const token = user['token'];
          this.token = token;
          if (token) {
            const expiresInDuration = user['expiresIn'];
            sessionStorage.setItem('duration', expiresInDuration);
            this.isAuthenticated = true;
            // this.userId = user['id'];
            this.firstname = user['firstname'];
            this.authStatusListener.next(true);
            const now = new Date();
            const expirationDate = new Date(now.getTime() + expiresInDuration * 1000);
            this.saveAuthData(token, expirationDate, this.userId, this.firstname);
            this.currentUserSubject.next(user.user);

          }

        }

        return user;
      }));
  }
  getToken(): any {
    const token = sessionStorage.getItem('token');
    return token;
  }

  getIsAuth(): any {
    return this.isAuthenticated;
  }

  getUserId(): any {
    return sessionStorage.getItem('currentTeacher');
  }
  getAuthStatusListener(): any {
    return this.authStatusListener.asObservable();
  }

  register(data: FormData): any {
    return this.http.post<{ Teacher: User }>(`${environment.api}register`, data);
  }

  private saveAuthData(token: string, expirationDate: Date, userId: string, firstname: string): void {
    sessionStorage.setItem('token', token);
    sessionStorage.setItem('expiration', expirationDate.toISOString());
    sessionStorage.setItem('currentTeacher', "ewfwegf5u3grewserIwegd646165496464ad65r4g65dfg");
    sessionStorage.setItem('firstname', firstname);
  }

  public getAuthData() {
    const token = sessionStorage.getItem('token');
    const expirationDate = sessionStorage.getItem('expiration');
    const userId = sessionStorage.getItem('currentTeacher');
    if (!token || !expirationDate) {
      return;
    }
    return {
      token: token,
      expirationDate: new Date(expirationDate),
      userId: userId
    }
  }

  public setAuthTimer(duration: number) {
    console.log(duration)
    this.tokenTimer = setTimeout(() => {
      this.logout();
    }, duration * 4000);
  }


  logout(): void {
    this.http.get<{ isLoggedOut: boolean }>(`${environment.api}logout`).subscribe(res => {
      sessionStorage.removeItem('currentTeacher');
      sessionStorage.removeItem('token');
      sessionStorage.removeItem('expiration');
      sessionStorage.removeItem('firstname');
      sessionStorage.removeItem('duration');
      this.currentUserSubject.next(null);
      location.reload();
    });
    this.openSnackBar('انتهت الجلسة', 'err-snackbar');
  }

  openSnackBar(message: string, syle: string): void {
    this._snackBar.open(message, '', {
      duration: 800,
      panelClass: [syle]
    });
  }
}
