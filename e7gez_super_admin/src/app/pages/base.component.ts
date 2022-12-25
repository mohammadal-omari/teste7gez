import { AfterViewInit, Component, OnDestroy, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Injector } from "@angular/core";
import { ReplaySubject, Subject, take, takeUntil } from 'rxjs';
import { FormControl } from '@angular/forms';

@Component({
  template: ''
})
export class BaseComponent implements OnInit , AfterViewInit, OnDestroy{
  public _snackBar: MatSnackBar;
  public filteredData: ReplaySubject<any[]> = new ReplaySubject<any[]>(1);
  public keyFilterCtrl: FormControl = new FormControl();
  protected _onDestroy = new Subject<void>();

  public keyErrors: Array<any> = [];
  injector = Injector.create([
    { provide: MatSnackBar, deps: [] },
  ]);
  constructor() {
    this._snackBar = this.injector.get(MatSnackBar);
    this.keyErrors= new Array<any>();
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

  ngAfterViewInit() {
  }

  ngOnDestroy() {
    this._onDestroy.next();
    this._onDestroy.complete();
  }

  /**
   * Sets the initial value after the filteredBanks are loaded initially
   */

}
