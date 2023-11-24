import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rivo_admin_app/core/models/device_info.dart';
import 'package:rivo_admin_app/features/index_resturants/presentation/screens/widget/add_resturant_dialog/dialog_button.dart';

class CustomDialogColorPicker extends StatefulWidget {
  final DeviceInfo deviceInfo;
  const CustomDialogColorPicker({super.key, required this.deviceInfo});

  @override
  State<CustomDialogColorPicker> createState() =>
      _CustomDialogColorPickerState();
}

class _CustomDialogColorPickerState extends State<CustomDialogColorPicker> {
  Color pickerColor = const Color.fromARGB(255, 164, 41, 226);
  Color currentColor = const Color(0xff443a49);
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        title: const Text("اللون"),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: currentColor,
          ),
          width: 30,
          height: 30,
        ),
        // isThreeLine: true,
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("اختر اللون"),
                  actions: [
                    CustomDialogButton(
                      text: "اختيار",
                      deviceInfo: widget.deviceInfo,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                  content: ColorPicker(
                    onColorChanged: changeColor,
                    pickerColor: pickerColor,
                  ),
                );
              });
        },
        subtitle: Text(currentColor.toString()),
      ),
    );
  }
}
