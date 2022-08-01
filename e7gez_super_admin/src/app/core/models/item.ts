export class Item {
  _id?: string;
  name: string;
  admins: Array<string>;
  image?: string;
  country: string;
  city?: string;
  menu?: string;
  categoryName?: string;
  point?: number;
  itemNumber?: number;
  dateCreated: Date;
  location: string;
}
