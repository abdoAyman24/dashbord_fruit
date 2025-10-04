import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('[Bloc Event] ${bloc.runtimeType}: $event');
  }

   @override
  void onChange(BlocBase bloc, Change change) async {
    super.onChange(bloc, change);
    print('[Bloc State Change] ${bloc.runtimeType}: $change');
    
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('[Bloc Transition] ${bloc.runtimeType}: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('[Bloc Error] ${bloc.runtimeType}: $error');
  }
}