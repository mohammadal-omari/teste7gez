import { Pipe, PipeTransform } from '@angular/core';
import { environment } from 'environments/environment';

@Pipe({
  name: 'loadFile'
})
export class LoadFilePipe implements PipeTransform {

  transform(value: unknown, ...args: unknown[]): unknown {
    const headers = new Headers({ 'Content-Type': 'image/*' });
    console.log(value);

    return `${environment.api}readImage/${value}`;
  }

}
