import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';


part 'create_restaurant_event.dart';

part 'create_restaurant_state.dart';


class CreateRestaurantBloc
    extends Bloc<CreateRestaurantEvent, CreateRestaurantState> {

  CreateRestaurantBloc() : super(CreateRestaurantInitial()) {

    on<CreateRestaurantEvent>((event, emit) {

      // TODO: implement event handler

    });

  }

}

