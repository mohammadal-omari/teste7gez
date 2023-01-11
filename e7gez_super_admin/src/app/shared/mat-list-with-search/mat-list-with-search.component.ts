import { AfterViewInit, Component, Input, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { ControlContainer, FormControl, FormGroup, FormGroupDirective } from '@angular/forms';
import { MatSelect } from '@angular/material/select';
import { ReplaySubject, Subject, takeUntil, take } from 'rxjs';

@Component({
  selector: 'app-mat-list-with-search',
  templateUrl: './mat-list-with-search.component.html',
  styleUrls: ['./mat-list-with-search.component.css']
})
export class MatListWithSearchComponent implements OnInit, AfterViewInit, OnDestroy {

  @Input() data: any[] = [{id:12, name:'sdfdfdfdf'},{id:13, name:'sdfdfdfdf'},{id:15, name:'sdfdfdfdf'}];
  @Input() public controlName: string;
  @Input() public title: string = 'Pleses select an item';
  public form: FormGroup;
  @Input() formGroupName: string;
  /** control for the selected bank */
  public bankCtrl: FormControl = new FormControl();

  /** control for the MatSelect filter keyword */
  public bankFilterCtrl: FormControl = new FormControl();

  /** list of banks filtered by search keyword */
  public filteredBanks: ReplaySubject<any[]> = new ReplaySubject<any[]>(1);

  @ViewChild('singleSelect', { static: true }) singleSelect: MatSelect;

  /** Subject that emits when the component has been destroyed. */
  protected _onDestroy = new Subject<void>();


  constructor(private controlContainer: ControlContainer,private rootFormGroup: FormGroupDirective) { }

  ngOnInit() {
    // set initial selection
    this.form = this.rootFormGroup.control.get(this.formGroupName) as FormGroup;
    this.bankCtrl.setValue(this.data[10]);

    // load the initial bank list
    this.filteredBanks.next(this.data.slice());

    // listen for search field value changes
    this.bankFilterCtrl.valueChanges
      .pipe(takeUntil(this._onDestroy))
      .subscribe(() => {
        this.filterBanks();
      });
  }

  ngAfterViewInit() {
    this.setInitialValue();
  }

  ngOnDestroy() {
    this._onDestroy.next();
    this._onDestroy.complete();
  }

  /**
   * Sets the initial value after the filteredBanks are loaded initially
   */
  protected setInitialValue() {
    this.filteredBanks
      .pipe(take(1), takeUntil(this._onDestroy))
      .subscribe(() => {
        // setting the compareWith property to a comparison function
        // triggers initializing the selection according to the initial value of
        // the form control (i.e. _initializeSelection())
        // this needs to be done after the filteredBanks are loaded initially
        // and after the mat-option elements are available
        this.singleSelect.compareWith = (a: any, b: any) => a && b && a.id === b.id;
      });
  }

  protected filterBanks() {
    if (!this.data) {
      return;
    }
    // get the search keyword
    let search = this.bankFilterCtrl.value;
    if (!search) {
      this.filteredBanks.next(this.data.slice());
      return;
    } else {
      search = search.toLowerCase();
    }
    // filter the banks
    this.filteredBanks.next(
      this.data.filter(bank => bank.name.toLowerCase().indexOf(search) > -1)
    );
  }

}
