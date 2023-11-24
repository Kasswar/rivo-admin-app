import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/core/constant/usecases.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/activate_model.dart';
import 'package:rivo_admin_app/features/index_resturants/domain/repository/index_resturants_repository.dart';

class UnactiveRestaurantUseCase extends UseCase<ActivateModel, UnactiveParams> {
  final IndexRestaurantRepoaitory indexRestaurantRepoaitory;

  UnactiveRestaurantUseCase({required this.indexRestaurantRepoaitory});
  @override
  DataResponse<ActivateModel> call(UnactiveParams params) {
    return indexRestaurantRepoaitory.getUnactiveRestaurant(params.restaurantId);
  }
}

class UnactiveParams with Params {
  final int restaurantId;

  UnactiveParams({required this.restaurantId});
}
