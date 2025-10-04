import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({super.key, required this.onImageChange});
  final ValueChanged onImageChange;
  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? fileImage;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          final ImagePicker imagePicker = ImagePicker();

          final XFile? image = await imagePicker.pickImage(
            source: ImageSource.gallery,
          );
          setState(() {
            fileImage = image != null ? File(image.path) : null;
            isLoading = false;
            widget.onImageChange(fileImage);
          });
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: BoxBorder.all(color: Colors.grey, width: 2),
              ),
              child: fileImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(8),
                      child: Image.file(fileImage!, fit: BoxFit.fill),
                    )
                  : Icon(Icons.image_outlined, size: 180),
            ),
            Positioned(
              right: 0,
              child: Visibility(
                visible: fileImage != null,
                child: IconButton(
                  onPressed: () {
                    fileImage = null;
                    setState(() {});
                  },
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
