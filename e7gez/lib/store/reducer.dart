import 'package:e7gez/store/actions.dart';
import "package:redux/redux.dart";
import '../main.dart';

class AppState {
  // final bool isAuth;
  // final bool regLoading;
  // final bool logLoading;
  // final dynamic user;
  // final List<dynamic> allUsers;
  // final String errMsg;

  // // chat state vakues

  // final String activeUser;
  // final String activeRoom;
  
  final int clickCount;
  
  final int count;
  
  final String quote;

  AppState(
      {required this.count, required this.clickCount, required this.quote});

  AppState copyWith({count, clickCount, quote}) {
    return AppState(
        count: count ?? this.count,
        clickCount: clickCount ?? this.clickCount,
        quote: quote ?? this.quote);
  }
}

AppState counterReducer(AppState state, dynamic action) {
  if (action is UpdateIncerment) {
    return state.copyWith(count: action.num);
  }

  return state;
}

final reducers = combineReducers<AppState>([counterReducer]);
