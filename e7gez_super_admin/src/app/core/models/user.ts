export class User {
  _id?: string;
  email: string;
  password: string;
  firstname?: string;
  lastname: string;
  token?: string;
  phoneNumber?: string;
  imagePath?: string;
  role?: string;
  point?: number;
  userNumber?: number;
  dateCreated: Date;
  isActive: boolean;

}
