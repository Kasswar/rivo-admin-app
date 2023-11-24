import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/core/errors/handling_exception_manager.dart';
import 'package:rivo_admin_app/features/index_resturants/data/data_source/remote_get_index_resturants_data_source.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/activate_model.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/index_resturants_model.dart';
import 'package:rivo_admin_app/features/index_resturants/domain/repository/index_resturants_repository.dart';

class IndexRestaurantRepositoryImplement
    with HandlingExceptionManager
    implements IndexRestaurantRepoaitory {
  @override
  DataResponse<IndexRestaurantModel> getIndexRestaurant(
      QueryParams params) async {
    RemoteIndexRestaurantDataSource remoteIndexRestaurantDataSource =
        RemoteIndexRestaurantDataSource();
    return await wrapHandling(tryCall: () async {
      final result =
          await remoteIndexRestaurantDataSource.getIndexRestaurant(params);
      return result;
    });
  }

  @override
  DataResponse<ActivateModel> getActiveRestaurant(int restaurantId) async {
    RemoteIndexRestaurantDataSource remoteIndexRestaurantDataSource =
        RemoteIndexRestaurantDataSource();
    return wrapHandling(tryCall: () async {
      final result =
          await remoteIndexRestaurantDataSource.activeRestaurant(restaurantId);
      return result;
    });
  }

  @override
  DataResponse<ActivateModel> getUnactiveRestaurant(int restaurantId) {
    RemoteIndexRestaurantDataSource remoteIndexRestaurantDataSource =
        RemoteIndexRestaurantDataSource();
    return wrapHandling(tryCall: () async {
      final result = await remoteIndexRestaurantDataSource
          .unactiveRestaurant(restaurantId);
      return result;
    });
  }
}
