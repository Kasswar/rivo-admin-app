import 'package:rivo_admin_app/core/api/api_variabeles.dart';
import 'package:rivo_admin_app/core/api/get_api.dart';
import 'package:rivo_admin_app/core/api/post_api.dart';
import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/activate_model.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/index_resturants_model.dart';

class RemoteIndexRestaurantDataSource {
  Future<IndexRestaurantModel> getIndexRestaurant(QueryParams params) async {
    GetApi getApi = GetApi(
        uri: ApiVariables.indexResturants(queryParam: params),
        fromJson: indexRestaurantModelFromJson);
    final result = await getApi.callRequest();
    return result;
  }

  Future<ActivateModel> activeRestaurant(int restaurantId) async {
    PostApi postApi = PostApi(
        uri: ApiVariables.activate(restaurantId),
        body: {},
        fromJson: activateModelFromJson);
    final result = await postApi.callRequest();
    return result;
  }

  Future<ActivateModel> unactiveRestaurant(int restaurantId) async {
    PostApi postApi = PostApi(
        uri: ApiVariables.unActivate(restaurantId),
        body: {},
        fromJson: activateModelFromJson);
    final result = await postApi.callRequest();
    return result;
  }
}
