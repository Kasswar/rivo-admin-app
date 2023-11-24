part of 'unactive_restaurant_bloc.dart';

sealed class UnactiveRestaurantState extends Equatable {
  const UnactiveRestaurantState();
  
  @override
  List<Object> get props => [];
}

final class UnactiveRestaurantInitial extends UnactiveRestaurantState {}
