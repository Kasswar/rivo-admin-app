part of 'create_restaurant_bloc.dart';

sealed class CreateRestaurantState extends Equatable {
  const CreateRestaurantState();
  
  @override
  List<Object> get props => [];
}

final class CreateRestaurantInitial extends CreateRestaurantState {}
