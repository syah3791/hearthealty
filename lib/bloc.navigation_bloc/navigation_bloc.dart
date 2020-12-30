import 'package:bloc/bloc.dart';
import 'package:hearthealthy/pages/education/home_view.dart';
import 'package:hearthealthy/pages/education/pola_hidup_view.dart';
import 'package:hearthealthy/pages/education/olahraga_view.dart';

enum NavigationEvents {
  HomeScreenClickedEvent,
  PolaHidupClickedEvent,
  OlahragaClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomeView();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomeScreenClickedEvent:
        yield HomeView();
        break;
      case NavigationEvents.PolaHidupClickedEvent:
        yield PolaHidupView();
        break;
      case NavigationEvents.OlahragaClickedEvent:
        yield OlahragaView();
        break;
    }
  }
}
