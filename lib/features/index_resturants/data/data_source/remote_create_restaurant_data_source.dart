import 'package:rivo_admin_app/core/api/api_variabeles.dart';
import 'package:rivo_admin_app/core/api/post_api.dart';
import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/create_restaurant_model.dart';

class RemoteCreateRestaurantDataSource {
  Future<CreateRestaurantModel> createRestaurant(BodyMap body) async {
    PostApi postApi = PostApi(
      uri: ApiVariables.createRestaurant(),
      body: body,
      fromJson: createRestaurantModelFromJson,
    );
    final result = await postApi.callRequest();

    return result;
  }
}
