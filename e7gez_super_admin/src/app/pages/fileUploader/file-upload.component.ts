import { HttpClient, HttpEventType, HttpResponse } from '@angular/common/http';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FileUploadService } from 'app/services/files/file-upload.service';
import { Controllers } from 'app/shared/api/api';
import { environment } from 'environments/environment';
import { finalize, Observable, Subscription } from 'rxjs';

declare var google: any;

@Component({
  moduleId: module.id,
  selector: 'file-upload',
  templateUrl: 'file-upload.component.html',
  styleUrls: ['file-upload.component.scss']
})

export class FileUploadComponent implements OnInit {

  private eventsSubscription: Subscription;

  @Input() fileNmae: Observable<any>;
  @Input() requiredFileType;
  @Output() fileId;
  @Output() saveFile = new EventEmitter<string>();

  selectedFiles?: FileList;
  selectedFileNames: string[] = [];

  progressInfos: any[] = [];
  message: string[] = [];

  previews: string[] = [];
  imageInfos?: Observable<any>;

  constructor(private uploadService: FileUploadService) { }

  ngOnInit(): void {
    this.eventsSubscription =
    this.fileNmae.subscribe(res => {
      this.previews.push(environment.api + Controllers.getFile + '/' + res);
    });
  }

  ngOnDestroy() {
    this.eventsSubscription.unsubscribe();
  }
  selectFiles(event: any): void {
    this.message = [];
    this.progressInfos = [];
    this.selectedFileNames = [];
    this.selectedFiles = event.target.files;

    this.previews = [];
    if (this.selectedFiles && this.selectedFiles[0]) {
      const numberOfFiles = this.selectedFiles.length;
      for (let i = 0; i < numberOfFiles; i++) {
        const reader = new FileReader();

        reader.onload = (e: any) => {
          this.previews.push(e.target.result);
        };

        reader.readAsDataURL(this.selectedFiles[i]);

        this.selectedFileNames.push(this.selectedFiles[i].name);
      }
    }
  }

  upload(idx: number, file: File): void {
    this.progressInfos[idx] = { value: 0, fileName: file.name };

    if (file) {
      this.uploadService.upload(file).subscribe(
        (event: any) => {
          if (event.type === HttpEventType.UploadProgress) {
            this.progressInfos[idx].value = Math.round(100 * event.loaded / event.total);
          } else if (event instanceof HttpResponse) {
            const msg = 'Uploaded the file successfully: ' + file.name;
            console.log(event.body.fileId);
            this.saveFile.emit(event.body.fileId)
            this.message.push(msg);
            //this.imageInfos = this.uploadService.getFiles();
          }
        },
        (err: any) => {
          this.progressInfos[idx].value = 0;
          const msg = 'Could not upload the file: ' + file.name;
          this.message.push(msg);
        });
    }
  }

  uploadFiles(): void {
    this.message = [];

    if (this.selectedFiles) {
      for (let i = 0; i < this.selectedFiles.length; i++) {
        this.upload(i, this.selectedFiles[i]);
      }
    }
  }
}
