import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/core/constant/usecases.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/create_restaurant_model.dart';
import 'package:rivo_admin_app/features/index_resturants/domain/repository/create_restaurant_repository.dart';

class CreateRestaurantUsecase
    extends UseCase<CreateRestaurantModel, CreateRestaurantParams> {
  final CreateRestaurantRepostory createRestaurantRepostory;

  CreateRestaurantUsecase({required this.createRestaurantRepostory});
  @override
  DataResponse<CreateRestaurantModel> call(
      CreateRestaurantParams params) async {
    return await createRestaurantRepostory.createRestaurant(params.getBody());
  }
}

class CreateRestaurantParams with Params {
  final String name;
  final String color;
  final String discountPersent;
  final String firstAward;
  final String templeteId;
  final String durationMonth;
  final String logo;
  final String background;
  final String userName;
  final String password;
  final String passwordConfirmation;
  final String phone;
  final String address;
  final String facebookUrl;
  final String instagramUrl;
  final String banner;

  CreateRestaurantParams({
    required this.name,
    required this.color,
    required this.discountPersent,
    required this.firstAward,
    required this.templeteId,
    required this.durationMonth,
    required this.logo,
    required this.background,
    required this.userName,
    required this.password,
    required this.passwordConfirmation,
    required this.phone,
    required this.address,
    required this.facebookUrl,
    required this.instagramUrl,
    required this.banner,
  });

  @override
  BodyMap getBody() => {
        "name": name,
        "color": color,
        "discount_precent": discountPersent,
        "first_award": firstAward,
        "templete_id": templeteId,
        "duration_months": durationMonth,
        "logo": logo,
        "background": background,
        "username": userName,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "phone": phone,
        "address": address,
        "facebook_url": facebookUrl,
        "instagram_url": instagramUrl,
        "banner": banner,
      };
}
