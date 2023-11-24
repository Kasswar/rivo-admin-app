import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/create_restaurant_model.dart';

abstract class CreateRestaurantRepostory {
  DataResponse<CreateRestaurantModel> createRestaurant(BodyMap body);
}
