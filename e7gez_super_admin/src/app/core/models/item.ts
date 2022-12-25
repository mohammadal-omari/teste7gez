import { Category } from "./category";
import { User } from "./user";

export class Item {
  _id?: string;
  name: string;
  admins: Array<User>;
  image?: string;
  country: string;
  city?: string;
  menu?: string;
  category?:any;
  point?: number;
  itemNumber?: number;
  dateCreated: Date;
  location: string;
  isActive: boolean;

}
