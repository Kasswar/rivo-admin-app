import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/core/constant/usecases.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/activate_model.dart';
import 'package:rivo_admin_app/features/index_resturants/domain/repository/index_resturants_repository.dart';

class ActiveRestaurantUseCase extends UseCase<ActivateModel, ActiveParams> {
  final IndexRestaurantRepoaitory indexRestaurantRepoaitory;

  ActiveRestaurantUseCase({required this.indexRestaurantRepoaitory});
  @override
  DataResponse<ActivateModel> call(ActiveParams params) {
    return indexRestaurantRepoaitory.getActiveRestaurant(params.restaurantId);
  }
}

class ActiveParams with Params {
  final int restaurantId;

  ActiveParams({required this.restaurantId});
}
