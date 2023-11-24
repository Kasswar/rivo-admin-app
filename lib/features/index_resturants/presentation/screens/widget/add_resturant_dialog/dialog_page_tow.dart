import 'package:flutter/material.dart';
import 'package:rivo_admin_app/core/functions/validat.dart';
import 'package:rivo_admin_app/core/models/device_info.dart';
import 'package:rivo_admin_app/features/index_resturants/presentation/screens/widget/add_resturant_dialog/add_image.dart';
import 'package:image_picker/image_picker.dart';
import 'dropdown_menu.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'text_form_faild_dialog.dart';

class CustomDialogPageTow extends StatefulWidget {
  final DeviceInfo deviceInfo;
  const CustomDialogPageTow({super.key, required this.deviceInfo});

  @override
  State<CustomDialogPageTow> createState() => _CustomDialogPageTowState();
}

class _CustomDialogPageTowState extends State<CustomDialogPageTow> {
  late TextEditingController faceBookLinkController;
  late TextEditingController firstPrizeController;
  late TextEditingController instagarmLinkController;
  late TextEditingController discountRateController;
  late String typeMenu;
  late Color selectedColor;
  PickedFile? mainImage;
  PickedFile? coverImage;
  PickedFile? logo;
  @override
  void initState() {
    faceBookLinkController = TextEditingController();
    firstPrizeController = TextEditingController();
    instagarmLinkController = TextEditingController();
    discountRateController = TextEditingController();
    typeMenu = "النموذج الأول";
    selectedColor = Colors.purple;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.deviceInfo.localHeight!,
      width: widget.deviceInfo.localWidth! / 7,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormFaildDialog(
              label: "رابط الفيسبوك",
              textEditingController: faceBookLinkController,
              validator: (val) {
                return validator(val!, 12, 100, "Face Book Url");
              },
            ),
            CustomTextFormFaildDialog(
              label: "رابط الانستغرام",
              textEditingController: instagarmLinkController,
              validator: (val) {
                return validator(val!, 12, 100, "Instagram Url");
              },
            ),
            CustomTextFormFaildDialog(
              label: "رقم الهاتف",
              textEditingController: instagarmLinkController,
              validator: (val) {
                return validator(val!, 4, 14, "Phone Number");
              },
            ),
            CustomTypeMenu(
              onChanged: (val) {},
              typeMenu: typeMenu,
              titleList: const [
                "النموذج الأول",
                "النموذج الثاني",
                "النموذج الثالث"
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Select a color'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: selectedColor,
                            onColorChanged: (color) {
                              setState(() {
                                selectedColor = color;
                              });
                            },
                            // showLabel: true,
                            pickerAreaHeightPercent: 0.8,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                height: widget.deviceInfo.localHeight! / 15,
                minWidth: widget.deviceInfo.localWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: widget.deviceInfo.localHeight! / 25,
                      width: widget.deviceInfo.localWidth! / 12,
                      color: selectedColor,
                    ),
                    Text(colorToHex(selectedColor).replaceRange(0, 2, "#")),
                  ],
                ),
              ),
            ),
            CustomTextFormFaildDialog(
              label: "الجائزة الأولى",
              textEditingController: firstPrizeController,
              validator: (val) {
                return validator(val!, 1, 20, "First Award");
              },
            ),
            CustomTextFormFaildDialog(
              label: "نسبة الحسم",
              textEditingController: discountRateController,
              validator: (val) {
                return validator(val!, 3, 20, "Discount Persent");
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AddImage(
                  onTap: () async {
                    final imagePicker = ImagePicker();
                    final pickedImage = await imagePicker.pickImage(
                        source: ImageSource.gallery);

                    setState(() {
                      mainImage = PickedFile(pickedImage!.path);
                    });
                  },
                  height: widget.deviceInfo.localHeight! / 10,
                  width: widget.deviceInfo.localWidth! / 3,
                  label: "الصورة الرئيسية",
                  image: mainImage,
                ),
                AddImage(
                  onTap: () async {
                    final imagePicker = ImagePicker();
                    final pickedImage = await imagePicker.pickImage(
                        source: ImageSource.gallery);

                    setState(() {
                      logo = PickedFile(pickedImage!.path);
                    });
                  },
                  height: widget.deviceInfo.localHeight! / 10,
                  width: widget.deviceInfo.localWidth! / 4.5,
                  label: "الشعار",
                  image: logo,
                ),
              ],
            ),
            AddImage(
              onTap: () {},
              height: widget.deviceInfo.localHeight! / 10,
              width: widget.deviceInfo.localWidth!,
              label: "صورة الغلاف",
            ),
          ],
        ),
      ),
    );
  }
}
