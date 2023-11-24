import 'package:flutter/material.dart';

import '../../../../../../core/constant/colors.dart';

class CustomTextFormFaildDialog extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  final bool? obscureText;
  final String? Function(String?)? validator;
  const CustomTextFormFaildDialog(
      {super.key,
      required this.label,
      required this.textEditingController,
      required this.validator,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        // padding: const EdgeInsets.symmetric(vertical: 3),
        child: TextFormField(
          obscureText: obscureText ?? false,
          validator: validator,
          maxLines: 1,
          
          cursorColor: AppColors.primaryColorGreen,
          controller: textEditingController,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              filled: true,
              label:Container(margin: EdgeInsets.only(bottom: 30),child: Text(label,style: TextStyle(fontSize: 20),)) ,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelBehavior: FloatingLabelBehavior.always,
    
    alignLabelWithHint:true ,
              fillColor: AppColors.secoundColorOne.withOpacity(0.7),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
