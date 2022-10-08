import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Feed } from 'app/core/models/feed';
import { Controllers } from 'app/shared/api/api';

@Injectable({
  providedIn: 'root'
})
export class BaseService {

  constructor(private http: HttpClient) { }

  getAllChart() {
    return this.http.get(Controllers.getAllDashboard);
  }

  getAllFeed() {
    return this.http.get(Controllers.getFeed);
  }
  view(feed: Feed) {
    return this.http.put(Controllers.openFeed + '/' + feed._id, {});
  }
}
