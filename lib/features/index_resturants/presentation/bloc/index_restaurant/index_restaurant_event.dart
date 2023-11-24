part of 'index_restaurant_bloc.dart';


sealed class IndexRestaurantEvent {

  const IndexRestaurantEvent();

}


class GetIndexRestaurantEvent extends IndexRestaurantEvent {

  final bool isReloade;


  GetIndexRestaurantEvent({this.isReloade = false});

}


class GetUnactiveRestaurantEvent extends IndexRestaurantEvent {

  final int restaurantId;
  final bool val;

  GetUnactiveRestaurantEvent({required this.restaurantId, required this.val});

}


class GetActiveRestaurantEvent extends IndexRestaurantEvent {

  final int restaurantId;


  final bool val;


  GetActiveRestaurantEvent({required this.restaurantId, required this.val});

}

