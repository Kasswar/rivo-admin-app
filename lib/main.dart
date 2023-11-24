import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:rivo_admin_app/app_router.dart';
import 'package:rivo_admin_app/features/index_resturants/data/data_source/remote_create_restaurant_data_source.dart';
import 'package:rivo_admin_app/features/index_resturants/data/repository/create_restaurant_repository_implement.dart';
import 'package:rivo_admin_app/features/index_resturants/domain/usecases/create_restaurant_usecase.dart';
import 'package:rivo_admin_app/injection.dart';

import 'core/constant/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
  // RemoteCreateRestaurantDataSource remoteCreateRestaurantDataSource =
  //     RemoteCreateRestaurantDataSource();
  // var result = await remoteCreateRestaurantDataSource.createRestaurant({
  //   "name": "pizza",
  //   "color": "#fda000",
  //   "discount_precent": "20",
  //   "first_award": "1000",
  //   "templete_id": "1",
  //   "duration_months": "10",
  //   "logo": "1688904191-758092899.jpg",
  //   "background": "1688904191-758092899.jpg",
  //   "username": "wissamo",
  //   "password": "123123123",
  //   "password_confirmation": "123123123",
  //   "phone": "0987654321",
  //   "address": "aleppo",
  //   "facebook_url": "http://losfdsdf.com",
  //   "instagram_url": "http://losfdsdf.com",
  //   "banner": "1688904191-758092899.jpg",
  // });
  // print("-.-.-.-.-.-.-..-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.");
  // print(result.message);
  // print(result.data!.resturant!.phone);
  /* CreateRestaurantUsecase createRestaurantUsecase = CreateRestaurantUsecase(
      createRestaurantRepostory: CreateRestaurantRepositoryImplement());
  final result = await createRestaurantUsecase(CreateRestaurantParams(
      name: "pizza",
      color: "#fda000",
      discountPersent: "20",
      firstAward: "1000",
      templeteId: "1",
      durationMonth: "12",
      logo: "1688904191-758092899.jpg",
      background: "1688904191-758092899.jpg",
      userName: "rami",
      password: "rami1234",
      passwordConfirmation: "rami1234",
      phone: "0963852741",
      address: "aleppo",
      facebookUrl: "http://losfdsdf.com",
      instagramUrl: "http://losfdsdf.com",
      banner: "1688904191-758092899.jpg"));
  result.fold((l) => null, (r) {
    print("================================");
    print(r.message);
  });*/
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColorGreen,
        datePickerTheme: DatePickerThemeData(
            rangeSelectionBackgroundColor: AppColors.primaryColorGreen,
            rangeSelectionOverlayColor:
                const MaterialStatePropertyAll(AppColors.primaryColorGreen),
            rangePickerHeaderBackgroundColor: AppColors.primaryColorGreen,
            dividerColor: AppColors.primaryColorGreen,
            rangePickerBackgroundColor: AppColors.primaryColorGreen,
            dayOverlayColor: MaterialStatePropertyAll(
                AppColors.primaryColorGreenAcssent.withOpacity(0.5)),
            elevation: 0.2,
            surfaceTintColor: AppColors.primaryColorGreen,
            todayForegroundColor: const MaterialStatePropertyAll(
                AppColors.primaryColorGreenAcssent)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: BotToastInit(),
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      routerDelegate: goRouter.routerDelegate,
    );
  }
}
