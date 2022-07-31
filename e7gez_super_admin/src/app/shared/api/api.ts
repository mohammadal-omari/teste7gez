import { environment } from "environments/environment";

export const Controllers = {
  createUser : environment.api+'/register',
  getUser : environment.api+'/user/get',
  userUpdate : environment.api+'/user/update',
  user : '/user/',
};
