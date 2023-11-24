import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'unactive_restaurant_event.dart';
part 'unactive_restaurant_state.dart';

class UnactiveRestaurantBloc extends Bloc<UnactiveRestaurantEvent, UnactiveRestaurantState> {
  UnactiveRestaurantBloc() : super(UnactiveRestaurantInitial()) {
    on<UnactiveRestaurantEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
