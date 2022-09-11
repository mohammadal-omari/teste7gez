import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Login } from 'app/core/models/login';
import { first } from 'rxjs/operators';
import { AuthenticationServiceService } from '../../services/authentication-service.service';
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {


  loginForm: FormGroup;
  returnUrl: string;
  loggedIn: boolean;
  submitted = false;
  loading = false;

  constructor(private fb: FormBuilder, private route: ActivatedRoute,
              private router: Router,
              private authService: AuthenticationServiceService) {
    if (this.authService.currentUserValue) {
      this.router.navigate(['/']);
    }
  }

  ngOnInit(): void {
    this.loginForm = this.fb.group({
      email: ['', [Validators.email, Validators.required]],
      password: ['', Validators.required]
    });
    this.returnUrl = this.route.snapshot.queryParams.returnUrl || '/';
  }
  get loginInfo(): any { return this.loginForm.controls; }

  onSubmit(): void {
    this.submitted = true;
    if (this.loginForm.invalid) {
      return;
    }
    this.loading = true;

    const login = new Login();
    login.email = this.loginInfo.email.value;
    login.password = this.loginInfo.password.value;
    login.methodType = 1;
    login.phoneNumber = 'xxxxxxxxx';

    this.authService.login(login)
    .pipe(first())
      .subscribe(
        data => {
          location.reload();
          this.router.navigate([this.returnUrl]);
        },
        error => {
          this.loading = false;
        });
  }
}
