import { environment } from "environments/environment";

export const Controllers = {
  createUser : environment.api+'/register',
  getUser : environment.api+'/user/get',
  userUpdate : environment.api+'/user/update',
  createItem : environment.api+'/item/create',
  getItem : environment.api+'/item/get',
  itemUpdate : environment.api+'/item/update',
  categoryUpdate : environment.api+'/category/update',
  createCategory : environment.api+'/category/create',
  getCategory : environment.api+'/category/get',
  user : '/user/',
};
