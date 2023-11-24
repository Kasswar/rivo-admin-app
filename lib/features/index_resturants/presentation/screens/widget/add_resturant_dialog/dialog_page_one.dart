import 'package:flutter/material.dart';
import 'package:rivo_admin_app/core/functions/validat.dart';
import 'package:rivo_admin_app/core/models/device_info.dart';
import 'package:rivo_admin_app/features/index_resturants/presentation/screens/widget/add_resturant_dialog/dropdown_menu.dart';

import 'text_form_faild_dialog.dart';

class CustomDialogPageOne extends StatefulWidget {
  final DeviceInfo deviceInfo;
  const CustomDialogPageOne({super.key, required this.deviceInfo});

  @override
  State<CustomDialogPageOne> createState() => _CustomDialogPageOneState();
}

class _CustomDialogPageOneState extends State<CustomDialogPageOne> {
  late TextEditingController userNameController;
  late TextEditingController resturantNameController;
  late TextEditingController passwordController;
  late TextEditingController repasswordController;
  late TextEditingController supscriptionTimeController;
  late TextEditingController cityController;
  late TextEditingController addressController;
  late String typeMenu;
  @override
  void initState() {
    // TODO: implement initState
    userNameController = TextEditingController();
    resturantNameController = TextEditingController();
    passwordController = TextEditingController();
    repasswordController = TextEditingController();
    supscriptionTimeController = TextEditingController();
    cityController = TextEditingController();
    addressController = TextEditingController();
    typeMenu = "دمشق";

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
              label: "اسم المستخدم",
              textEditingController: userNameController,
              validator: (val) {
                return validator(val!, 3, 20, "User Name");
              },
            ),
            CustomTextFormFaildDialog(
              label: "اسم المطعم",
              textEditingController: resturantNameController,
              validator: (val) {
                return validator(val!, 3, 25, "Restaurant Name");
              },
            ),
            CustomTextFormFaildDialog(
              label: "كلمة المرور",
              textEditingController: passwordController,
              validator: (val) {
                return validator(val!, 8, 20, "Password");
              },
            ),
            CustomTextFormFaildDialog(
              label: "تأكيد كلمة المرور",
              textEditingController: repasswordController,
              validator: (val) {
                return validator(val!, 3, 20, "Password Confirmation");
              },
            ),
            CustomTextFormFaildDialog(
              label: "مدة الاشتراك",
              textEditingController: supscriptionTimeController,
              validator: (val) {
                return validator(val!, 1, 5, "Duration");
              },
            ),
            CustomTypeMenu(
              onChanged: (val) {},
              typeMenu: typeMenu,
              titleList: const [
                "دمشق",
                "حلب",
                "حماه",
                "طرطوس",
                "حمص",
                "اللاذقية",
              ],
            ),
            CustomTextFormFaildDialog(
              label: "العنوان",
              textEditingController: addressController,
              validator: (val) {
                return validator(val!, 3, 50, "Address");
              },
            ),
          ],
        ),
      ),
    );
  }
}
