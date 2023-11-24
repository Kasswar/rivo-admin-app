import 'package:flutter/material.dart';
import 'package:rivo_admin_app/core/models/device_info.dart';
import 'package:rivo_admin_app/features/index_resturants/presentation/screens/widget/add_resturant_dialog/dialog_button.dart';

class CustomDialogActions extends StatefulWidget {
  final DeviceInfo deviceInfo;
  final void Function() onPressedCancel;
  final void Function() onPressedNext;
  final String pageNumberText;
  const CustomDialogActions(
      {super.key,
      required this.deviceInfo,
      required this.onPressedCancel,
      required this.onPressedNext,
      required this.pageNumberText});

  @override
  State<CustomDialogActions> createState() => _CustomDialodActionsState();
}

class _CustomDialodActionsState extends State<CustomDialogActions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.pageNumberText,
          style: const TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomDialogButton(
                text: widget.pageNumberText == "2/2" ? "إضافة" : "التالي",
                deviceInfo: widget.deviceInfo,
                onPressed: widget.onPressedNext),
            const SizedBox(
              width: 10,
            ),
            CustomDialogButton(
              text: "إلغاء",
              deviceInfo: widget.deviceInfo,
              isCancel: true,
              onPressed: widget.onPressedCancel,
            )
          ],
        )
      ],
    );
  }
}
