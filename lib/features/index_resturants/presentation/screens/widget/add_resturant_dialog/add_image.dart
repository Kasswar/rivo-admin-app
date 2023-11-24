import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rivo_admin_app/core/constant/colors.dart';

class AddImage extends StatefulWidget {
  final void Function()? onTap;
  final double height;
  final double width;
  final String label;
  PickedFile? image;
  AddImage({
    super.key,
    required this.onTap,
    required this.height,
    required this.width,
    required this.label,
    this.image,
  });

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: InkWell(
        onTap: widget.onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.label,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                  color: AppColors.secoundColorOne.withOpacity(0.7),
                ),
                child: widget.image == null
                    ? const Center(
                        child: Icon(
                          Icons.add,
                        ),
                      )
                    : Image.file(
                        File(widget.image!.path),
                        fit: BoxFit.fill,
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
