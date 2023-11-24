part of 'create_restaurant_bloc.dart';


sealed class CreateRestaurantEvent {

  const CreateRestaurantEvent();

}


class GetCreateRestaurantEvent extends CreateRestaurantEvent {

  final TextEditingController userNameController;

  final TextEditingController resturantNameController;

  final TextEditingController passwordController;

  final TextEditingController repasswordController;

  final TextEditingController supscriptionTimeController;

  final TextEditingController cityController;

  final TextEditingController addressController;


  GetCreateRestaurantEvent({
    this.userNameController,
    this.resturantNameController,
    this.passwordController,
    this.repasswordController,
    this.supscriptionTimeController,
    this.cityController,
    this.addressController,
  });

}

