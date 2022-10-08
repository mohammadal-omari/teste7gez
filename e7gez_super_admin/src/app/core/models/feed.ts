import { User } from "./user";

export class Feed {
  _id?: string;
  message: string;
  isActive: boolean;
  dateCreated: Date;
  createdBy: User;
}
