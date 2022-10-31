import { HttpClient, HttpEvent, HttpRequest } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Controllers } from 'app/shared/api/api';
import { environment } from 'environments/environment';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class FileUploadService {

  private baseUrl = 'http://localhost:8080';

  constructor(private http: HttpClient) { }

  upload(file: File): Observable<HttpEvent<any>> {
    const formData: FormData = new FormData();

    formData.append('thumbnail', file);

    const req = new HttpRequest('POST', `${environment.api}`+`${Controllers.thumbnailUpload}`, formData, {
      reportProgress: true,
      responseType: 'json'
    });

    return this.http.request(req);
  }

  getFiles(fileNmae: string): any {
    return this.http.get(`${environment.api}`+`${Controllers.getFile}/${fileNmae}`);
  }
}
