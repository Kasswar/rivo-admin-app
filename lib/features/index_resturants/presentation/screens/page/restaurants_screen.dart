import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rivo_admin_app/core/constant/colors.dart';
import 'package:rivo_admin_app/core/constant/images.dart';
import 'package:rivo_admin_app/features/index_resturants/presentation/bloc/index_restaurant/index_restaurant_bloc.dart';
import 'package:rivo_admin_app/features/index_resturants/presentation/screens/widget/effective_button.dart';
import 'package:rivo_admin_app/features/index_resturants/presentation/screens/widget/search_add.dart';

import '../../../../../core/constant/info_widget.dart';
import '../../../../../core/widgets/information_table.dart';
import '../../../../../core/widgets/text_title.dart';

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({super.key});

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  late final TextEditingController searchController;
  bool isSwitched = true;

  @override
  void initState() {
    BlocProvider.of<IndexRestaurantBloc>(context)
        .add(GetIndexRestaurantEvent());
    searchController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColorGreenAcssent,
          title: const Text(
            'Rivo',
            style: TextStyle(
              color: AppColors.greyShadeTwo,
              fontFamily: "ArbFONTS-Almarai-ExtraBold",
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: SvgPicture.asset(AppImages.logoWhite),
          actions: [
            Icon(
              Icons.view_headline,
              color: AppColors.greyShadeTwo,
              size: deviceInfo.localHeight! / 20,
            )
          ],
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceInfo.localWidth! / 20,
              vertical: deviceInfo.localHeight! / 28,
            ),
            child: ListView(children: [
              TextTitle(
                title: "المطاعم",
                fontSize: deviceInfo.localWidth! / 20,
                color: AppColors.textColorBlack,
              ),
              SizedBox(
                height: deviceInfo.localHeight! / 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EffectiveButton(
                    deviceInfo: deviceInfo,
                    isPressed: true,
                    title: 'الفعالة',
                    effectiveFun: () {},
                  ),
                  SizedBox(
                    width: deviceInfo.localWidth! / 6,
                  ),
                  EffectiveButton(
                    deviceInfo: deviceInfo,
                    isPressed: false,
                    title: 'المنتهية',
                    effectiveFun: () {},
                  ),
                ],
              ),
              SizedBox(
                height: deviceInfo.localHeight! / 40,
              ),
              SearchAdd(
                  serachFun: () {},
                  searchController: searchController,
                  deviceInfo: deviceInfo),
              const SizedBox(
                height: 20,
              ),
              InformationTable(
                  deviceInfo: deviceInfo,
                  onToggle: (bool val) => setState(() {
                        isSwitched = val;
                      }),
                  value: isSwitched),
            ]),
          ),
        ),
      ),
    );
  }
}
