import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/activate_model.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/index_resturants_model.dart';

abstract class IndexRestaurantRepoaitory {
  DataResponse<IndexRestaurantModel> getIndexRestaurant(QueryParams params);
  DataResponse<ActivateModel> getActiveRestaurant(int restaurantId);
  DataResponse<ActivateModel> getUnactiveRestaurant(int restaurantId);
}
