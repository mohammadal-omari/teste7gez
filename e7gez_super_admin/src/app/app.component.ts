import { ChangeDetectorRef, Component } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';
import { LoaderService } from './loader/loader.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent{
  constructor(public loadrServices: LoaderService,
    private spinner: NgxSpinnerService,private cdRef:ChangeDetectorRef) {

  }

  ngOnInit(): void {
    this.loadrServices.isLoading.subscribe(res => {
      if (res) {
        this.spinner.show();
        this.cdRef.detectChanges();
      } else {
        this.spinner.hide();
      }
    });
  }
}
