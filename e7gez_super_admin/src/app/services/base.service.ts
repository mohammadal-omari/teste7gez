import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Feed } from 'app/core/models/feed';
import { Controllers } from 'app/shared/api/api';
import { environment } from 'environments/environment';

@Injectable({
  providedIn: 'root'
})
export class BaseService {

  constructor(private http: HttpClient) { }

  getAllChart() {
    return this.http.get(`${environment.api}` + Controllers.getAllDashboard);
  }

  getAllFeed() {
    return this.http.get(`${environment.api}` + Controllers.getFeed);
  }
  view(feed: Feed) {
    return this.http.put(`${environment.api}` + Controllers.openFeed + '/' + feed._id, {});
  }
}
