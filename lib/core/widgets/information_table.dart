import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:rivo_admin_app/features/index_resturants/presentation/bloc/index_restaurant/index_restaurant_bloc.dart';
import '../constant/colors.dart';
import '../constant/images.dart';
import '../models/device_info.dart';
import 'text_title.dart';

class InformationTable extends StatefulWidget {
  final DeviceInfo deviceInfo;
  final void Function(bool) onToggle;
  final bool value;

  const InformationTable(
      {super.key,
      required this.deviceInfo,
      required this.onToggle,
      required this.value});

  @override
  State<InformationTable> createState() => _InformationTableState();
}

class _InformationTableState extends State<InformationTable> {
  late IndexRestaurantBloc indexRestaurantBloc;
  List<bool> switchValList = [];
  final List<String> titlesList = [
    'اسم المستخدم',
    'اسم المطعم',
    'تاريخ انتهاء الاشتراك',
    'الحدث',
  ];

  final List<String> imagesList = [
    AppImages.view,
    AppImages.edit,
    AppImages.profile,
  ];
  @override
  void initState() {
    indexRestaurantBloc = IndexRestaurantBloc()..add(GetIndexRestaurantEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexRestaurantBloc, IndexRestaurantState>(
      builder: (context, state) {
        print("State: ${state.indexRestaurantStatus}");
        if ((state.indexRestaurantStatus == IndexRestaurantStatus.loading ||
                state.indexRestaurantStatus == IndexRestaurantStatus.initial) &&
            state.indexRestaurantModelList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.indexRestaurantStatus ==
                IndexRestaurantStatus.failed &&
            state.indexRestaurantModelList.isEmpty) {
          return Center(
            child: Text(state.errorMsg),
          );
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Container(
                width: widget.deviceInfo.localWidth! * 1.55,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                )),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    ...List.generate(
                      titlesList.length,
                      (index) => SizedBox(
                        width: widget.deviceInfo.localWidth! / 2.59,
                        child: TextTitle(
                          title: titlesList[index],
                          fontSize: widget.deviceInfo.localHeight! / 60,
                          color: AppColors.textColorBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ...List.generate(state.indexRestaurantModelList.length,
                      (index) {
                    if (state.indexRestaurantModelList.length == index) {
                      indexRestaurantBloc.add(GetIndexRestaurantEvent());
                      return const CircularProgressIndicator();
                    }
                    switchValList
                        .add(state.activeRestaurantList[index].isActive);
                    // print("-=-=-=-=-=-=-=-=-=-=-=-=-=-");

                    // print(state.activeRestaurantList[index].isActive);
                    return Container(
                      height: widget.deviceInfo.localHeight! / 13.33,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 0.5,
                        ),
                      )),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          SizedBox(
                            width: widget.deviceInfo.localWidth! / 2.59,
                            child: Text(
                              state.indexRestaurantModelList[index]
                                  .adminResturant!.username!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(height: 2),
                            ),
                          ),
                          SizedBox(
                            width: widget.deviceInfo.localWidth! / 2.59,
                            child: Text(
                              state.indexRestaurantModelList[index].name!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(height: 2),
                            ),
                          ),
                          SizedBox(
                            width: widget.deviceInfo.localWidth! / 2.59,
                            child: Text(
                              "${state.indexRestaurantModelList[index].subscriptions!.endDate}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(height: 2),
                            ),
                          ),
                          SizedBox(
                            width: widget.deviceInfo.localWidth! / 2.59,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ...List.generate(
                                  imagesList.length,
                                  (index) => SvgPicture.asset(
                                    imagesList[index],
                                    color: AppColors.primaryColorGreenAcssent,
                                    height: widget.deviceInfo.localHeight! / 60,
                                  ),
                                ),
                                SizedBox(
                                  height: widget.deviceInfo.localHeight! / 25,
                                  child: FlutterSwitch(
                                      valueFontSize:
                                          widget.deviceInfo.localWidth! / 50,
                                      height:
                                          widget.deviceInfo.localHeight! / 26,
                                      width: widget.deviceInfo.localWidth! / 6,
                                      showOnOff: true,
                                      value: state
                                          .activeRestaurantList[index].isActive,
                                      activeText: "Off",
                                      inactiveText: "On",
                                      toggleSize: 20,
                                      padding:
                                          widget.deviceInfo.localWidth! / 80,
                                      activeTextColor: AppColors.textColorBlack,
                                      inactiveTextColor:
                                          AppColors.textColorBlack,
                                      inactiveColor: AppColors.greyShadeTwo,
                                      activeColor: AppColors.greyShadeTwo,
                                      activeTextFontWeight: FontWeight.normal,
                                      inactiveTextFontWeight: FontWeight.normal,
                                      activeToggleColor:
                                          AppColors.primaryColorGreenAcssent,
                                      inactiveToggleColor:
                                          AppColors.textColorWhite,
                                      onToggle: (bool val) {
                                        if (val) {
                                          BlocProvider.of<IndexRestaurantBloc>(
                                                  context)
                                              .add(GetActiveRestaurantEvent(
                                                  restaurantId: state
                                                      .indexRestaurantModelList[
                                                          index]
                                                      .id!,
                                                  val: val));
                                        } else {
                                          BlocProvider.of<IndexRestaurantBloc>(
                                                  context)
                                              .add(GetUnactiveRestaurantEvent(
                                                  restaurantId: state
                                                      .indexRestaurantModelList[
                                                          index]
                                                      .id!,
                                                  val: val));
                                        }
                                        switchValList[index] = val;
                                      }),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  })
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
