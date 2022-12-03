import "package:redux/redux.dart";
import '../main.dart';


class AppState {
  final int count;
  final int clickCount;
  final String quote;

  AppState({required this.count, required this.clickCount, required this.quote});

  AppState  copyWith({count, clickCount, quote}) {
    return AppState(
      count:  count ?? this.count,
      clickCount: clickCount ?? this.clickCount,
      quote: quote ?? this.quote
    );
  }

}

AppState counterReducer( AppState state, dynamic action) {

 switch (action) {
   case Types.Increment:
     return state.copyWith(count: state.count +1);
 }
 return state;
}

final reducers = combineReducers<AppState>([counterReducer]);