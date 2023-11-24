import 'dart:async';


import 'package:bloc/bloc.dart';


import 'package:rivo_admin_app/features/index_resturants/data/model/activate_model.dart';


import 'package:rivo_admin_app/features/index_resturants/data/model/index_resturants_model.dart';


import 'package:rivo_admin_app/features/index_resturants/data/repository/index_resturants_repository_imp.dart';


import 'package:rivo_admin_app/features/index_resturants/domain/usecases/active_restaurant_usecase.dart';


import 'package:rivo_admin_app/features/index_resturants/domain/usecases/index_resturants_use_case.dart';


import 'package:bloc_concurrency/bloc_concurrency.dart';


import 'package:rivo_admin_app/features/index_resturants/domain/usecases/unactive_restaurant_usecase.dart';


part 'index_restaurant_event.dart';


part 'index_restaurant_state.dart';


class IndexRestaurantBloc

    extends Bloc<IndexRestaurantEvent, IndexRestaurantState> {

  final int _perPage = 20;


  final _indexRestaurantUsecase = IndexRestaurantUsecase(

      indexRestaurantRepoaitory: IndexRestaurantRepositoryImplement());


  final _activeRestaurantUsecase = ActiveRestaurantUseCase(

      indexRestaurantRepoaitory: IndexRestaurantRepositoryImplement());


  final _unactiveRestaurantUsecase = UnactiveRestaurantUseCase(

      indexRestaurantRepoaitory: IndexRestaurantRepositoryImplement());


  IndexRestaurantBloc() : super(IndexRestaurantState()) {

    on<GetIndexRestaurantEvent>(

      _mapGetIndexRestaurant,


      //transformer: sequential(),

    );


    on<GetActiveRestaurantEvent>(

      _mapGetActiveRestaurant,

    );


    on<GetUnactiveRestaurantEvent>(

      _mapGetUnactiveRestaurant,

    );

  }


  FutureOr<void> _mapGetIndexRestaurant(

      GetIndexRestaurantEvent event, Emitter<IndexRestaurantState> emit) async {

    if (event.isReloade ||

        state.indexRestaurantStatus == IndexRestaurantStatus.initial) {

      // print("-=-=-=-=-=-=-State 1=-=-=-=-=-=-=-");


      emit(

          state.copyWith(indexRestaurantStatus: IndexRestaurantStatus.loading));


      final result = await _indexRestaurantUsecase(

          IndexRestaurantParams(perPage: _perPage.toString(), page: "1"));


      result.fold(

          (failure) => emit(state.copyWith(

                indexRestaurantStatus: IndexRestaurantStatus.failed,

                errorMsg: failure.message,

              )), (indexRestaurantModel) {

        List<ActiveRestaurantState> activeStateList = [];


        for (var item in indexRestaurantModel.data!.resturants!) {

          activeStateList.add(ActiveRestaurantState(

            activeStatus: ActiveStatus.initial,

            isActive: item.status == 1 ? true : false,

            restaurantId: item.id!,

          ));

        }


        emit(state.copyWith(

          isEndPage: indexRestaurantModel.data!.resturants!.length < _perPage,

          indexRestaurantStatus: IndexRestaurantStatus.success,

          activeRestaurantList: activeStateList,

          indexRestaurantList: indexRestaurantModel.data!.resturants!,

        ));

      });

    } else if (!state.isEndPage) {

      // print("=========State 2");


      emit(

          state.copyWith(indexRestaurantStatus: IndexRestaurantStatus.loading));


      final result = await _indexRestaurantUsecase(IndexRestaurantParams(

          perPage: _perPage.toString(),

          page: "${(state.indexRestaurantModelList.length / _perPage) + 1}"));


      result.fold(

          (failure) => emit(state.copyWith(

                indexRestaurantStatus: IndexRestaurantStatus.failed,

                errorMsg: failure.message,

              )), (indexRestaurantModel) {

        List<ActiveRestaurantState> activeStateList = [];


        for (var item in indexRestaurantModel.data!.resturants!) {

          activeStateList.add(ActiveRestaurantState(

            activeStatus: ActiveStatus.initial,

            isActive: item.status == 1 ? true : false,

            restaurantId: item.id!,

          ));

        }


        // print("=========Result=${indexRestaurantModel.data!.resturants!}");


        emit(state.copyWith(

          isEndPage: indexRestaurantModel.data!.resturants!.length < _perPage,

          indexRestaurantStatus: IndexRestaurantStatus.success,

          activeRestaurantList: activeStateList,

          indexRestaurantList: List.of(state.indexRestaurantModelList)

            ..addAll(indexRestaurantModel.data!.resturants!),

        ));


        // print("=========Restaurant=${state.indexRestaurantModelList}");

      });

    }

  }


  FutureOr<void> _mapGetActiveRestaurant(GetActiveRestaurantEvent event,

      Emitter<IndexRestaurantState> emit) async {

    for (int i = 0; i < state.indexRestaurantModelList.length; i++) {

      if (event.restaurantId == state.indexRestaurantModelList[i].id) {

        var localList = List.of(state.activeRestaurantList);


        localList[i] =

            localList[i].copyWith(activeStatus: ActiveStatus.loading);


        emit(state.copyWith(activeRestaurantList: localList));


        final result = await _activeRestaurantUsecase(

            ActiveParams(restaurantId: event.restaurantId));


        result.fold((l) {

          var localList = List.of(state.activeRestaurantList);


          localList[i] =

              localList[i].copyWith(activeStatus: ActiveStatus.failed);


          emit(state.copyWith(activeRestaurantList: localList));

        }, (r) {

          var localList = List.of(state.activeRestaurantList);


          localList[i] = localList[i].copyWith(

              activeStatus: ActiveStatus.success, isActive: event.val);


          emit(state.copyWith(activeRestaurantList: localList));

        });

      }

    }

  }


  FutureOr<void> _mapGetUnactiveRestaurant(GetUnactiveRestaurantEvent event,

      Emitter<IndexRestaurantState> emit) async {

    for (int i = 0; i < state.indexRestaurantModelList.length; i++) {

      if (event.restaurantId == state.indexRestaurantModelList[i].id) {

        var localList = List.of(state.activeRestaurantList);


        localList[i] =

            localList[i].copyWith(activeStatus: ActiveStatus.loading);


        emit(state.copyWith(activeRestaurantList: localList));


        final result = await _unactiveRestaurantUsecase(

            UnactiveParams(restaurantId: event.restaurantId));


        result.fold((l) {

          var localList = List.of(state.activeRestaurantList);


          localList[i] =

              localList[i].copyWith(activeStatus: ActiveStatus.failed);


          emit(state.copyWith(activeRestaurantList: localList));

        }, (r) {

          print(r.message);


          var localList = List.of(state.activeRestaurantList);


          localList[i] = localList[i].copyWith(

              activeStatus: ActiveStatus.success, isActive: event.val);


          emit(state.copyWith(activeRestaurantList: localList));

        });

      }

    }

  }

}

