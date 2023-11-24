import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/core/errors/handling_exception_manager.dart';
import 'package:rivo_admin_app/features/index_resturants/data/data_source/remote_create_restaurant_data_source.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/create_restaurant_model.dart';
import 'package:rivo_admin_app/features/index_resturants/domain/repository/create_restaurant_repository.dart';

class CreateRestaurantRepositoryImplement
    with HandlingExceptionManager
    implements CreateRestaurantRepostory {
  @override
  DataResponse<CreateRestaurantModel> createRestaurant(BodyMap body) async {
    RemoteCreateRestaurantDataSource remoteCreateRestaurantDataSource =
        RemoteCreateRestaurantDataSource();
    return await wrapHandling(tryCall: () async {
      final result =
          await remoteCreateRestaurantDataSource.createRestaurant(body);
      return result;
    });
  }
}
