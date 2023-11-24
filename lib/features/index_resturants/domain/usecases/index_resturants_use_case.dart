import 'package:rivo_admin_app/core/constant/type_def.dart';
import 'package:rivo_admin_app/core/constant/usecases.dart';
import 'package:rivo_admin_app/features/index_resturants/data/model/index_resturants_model.dart';
import 'package:rivo_admin_app/features/index_resturants/domain/repository/index_resturants_repository.dart';

class IndexRestaurantUsecase
    extends UseCase<IndexRestaurantModel, IndexRestaurantParams> {
  final IndexRestaurantRepoaitory indexRestaurantRepoaitory;

  IndexRestaurantUsecase({required this.indexRestaurantRepoaitory});
  @override
  DataResponse<IndexRestaurantModel> call(IndexRestaurantParams params) {
    return indexRestaurantRepoaitory.getIndexRestaurant(params.getParams());
  }
}

class IndexRestaurantParams with Params {
  final String perPage;
  final String page;
  IndexRestaurantParams({required this.perPage, required this.page});

  @override
  QueryParams getParams() => {
        "perpage": perPage,
        "page": page,
      };
}
