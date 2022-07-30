import { environment } from "environments/environment";

export const Controllers = {
  createUser : environment.api+'/register',
  user : '/user/',
};
