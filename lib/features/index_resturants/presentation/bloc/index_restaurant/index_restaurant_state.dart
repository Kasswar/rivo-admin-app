part of 'index_restaurant_bloc.dart';


enum IndexRestaurantStatus { initial, loading, failed, success }


class IndexRestaurantState {

  final bool isEndPage;


  final IndexRestaurantStatus indexRestaurantStatus;


  final String errorMsg;


  final List<ActiveRestaurantState> activeRestaurantList;


  final List<Resturant> indexRestaurantModelList;


  IndexRestaurantState(

      {this.isEndPage = false,

      this.indexRestaurantStatus = IndexRestaurantStatus.initial,

      this.errorMsg = '',

      this.activeRestaurantList = const [],

      this.indexRestaurantModelList = const []});


  IndexRestaurantState copyWith({

    bool? isEndPage,

    IndexRestaurantStatus? indexRestaurantStatus,

    String? errorMsg,

    List<ActiveRestaurantState>? activeRestaurantList,

    List<Resturant>? indexRestaurantList,

  }) {

    return IndexRestaurantState(

      isEndPage: isEndPage ?? this.isEndPage,

      indexRestaurantStatus:

          indexRestaurantStatus ?? this.indexRestaurantStatus,

      errorMsg: errorMsg ?? this.errorMsg,

      activeRestaurantList: activeRestaurantList ?? this.activeRestaurantList,

      indexRestaurantModelList: indexRestaurantList ?? indexRestaurantModelList,

    );

  }

}


enum ActiveStatus { initial, loading, failed, success }


class ActiveRestaurantState {

  final ActiveStatus activeStatus;


  final int restaurantId;


  final bool isActive;


  ActiveRestaurantState(

      {this.activeStatus = ActiveStatus.initial,

      this.restaurantId = 0,

      this.isActive = false});


  ActiveRestaurantState copyWith(

      {ActiveStatus? activeStatus, int? restaurantId, bool? isActive}) {

    return ActiveRestaurantState(

      activeStatus: activeStatus ?? this.activeStatus,

      restaurantId: restaurantId ?? this.restaurantId,

      isActive: isActive ?? this.isActive,

    );

  }

}

