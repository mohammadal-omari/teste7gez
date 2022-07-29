import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Injector } from "@angular/core";

@Component({
  template: ''
})
export class BaseComponent implements OnInit {
  private _snackBar: MatSnackBar;
  injector = Injector.create([
    { provide: MatSnackBar, deps: [] },
  ]);
  constructor() {
    this._snackBar = this.injector.get(MatSnackBar);
  }

  ngOnInit(): void {
  }

  success(message: string): void {
    this._snackBar.open(message, '', {
      duration: 500,
      panelClass: ['suc-snackbar']
    });
  }

  error(message: string): void {
    this._snackBar.open(message, '', {
      duration: 500,
      panelClass: ['err-snackbar']
    });
  }
}
