import 'package:e7gez/store/reducer.dart';
import "package:redux/redux.dart";
import 'package:redux_thunk/redux_thunk.dart';


class UpdateIncerment{

 late int num;
 int get _num => this.num;
 UpdateIncerment(this.num);

}

ThunkAction<AppState> getRandomNumber = (Store<AppState> store) async {
   store.dispatch(new UpdateIncerment(118));
};