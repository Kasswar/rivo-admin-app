import 'package:flutter/material.dart';
import 'package:rivo_admin_app/core/models/device_info.dart';

import '../../../../../../core/constant/colors.dart';
import 'dialog_actions.dart';
import 'dialog_page_one.dart';
import 'dialog_page_tow.dart';

class CustomAlertDialogShow extends StatefulWidget {
  final DeviceInfo deviceInfo;
  final int currentPage;
  final PageController pageController;
  final void Function(int)? onPageChanged;
  const CustomAlertDialogShow(
      {super.key,
      required this.deviceInfo,
      required this.currentPage,
      required this.pageController,
      this.onPageChanged});

  @override
  State<CustomAlertDialogShow> createState() => _CustomAlertDialogShowState();
}

class _CustomAlertDialogShowState extends State<CustomAlertDialogShow> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          CustomDialogActions(
            pageNumberText: "${widget.currentPage + 1}/2",
            deviceInfo: widget.deviceInfo,
            onPressedCancel: () {
              Navigator.of(context).pop();
            },
            onPressedNext: () {
              if (_formKey.currentState!.validate()) {
                print("validate");
                widget.pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOut);
              }
            },
          )
        ],
        backgroundColor: Colors.white,
        shadowColor: AppColors.greyShadeOne,
        title: const Text(
          "إضافة مطعم",
          textAlign: TextAlign.center,
        ),
        titleTextStyle:
            const TextStyle(fontSize: 25, color: AppColors.textColorBlack),
        alignment: Alignment.center,
        content: SizedBox(
          height: widget.deviceInfo.localHeight,
          width: widget.deviceInfo.localHeight! / 7,
          child: PageView(
              reverse: true,
              physics: const ScrollPhysics(),
              onPageChanged: widget.onPageChanged,
              scrollDirection: Axis.horizontal,
              controller: widget.pageController,
              children: [
                CustomDialogPageOne(
                  deviceInfo: widget.deviceInfo,
                ),
                CustomDialogPageTow(
                  deviceInfo: widget.deviceInfo,
                )
              ]),
        ),
      ),
    );
  }
}
