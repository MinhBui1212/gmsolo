import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cuemate/configs/app_path.dart';
import 'package:cuemate/configs/theme/constants.dart';
import 'package:image_picker/image_picker.dart';

class EditAvatarComponent extends StatefulWidget {
  const EditAvatarComponent(
      {super.key, required this.imageFile, required this.onChooseImage});

  final File? imageFile;
  final Function onChooseImage;

  @override
  State<EditAvatarComponent> createState() => _EditAvatarComponent();
}

class _EditAvatarComponent extends State<EditAvatarComponent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey.shade200,
          child: CircleAvatar(
            radius: 55,
            backgroundImage: widget.imageFile != null
                ? FileImage(widget.imageFile!) as ImageProvider
                : const AssetImage(AppPath.defaultAvatar),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                _pickImage();
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 4,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  color: colorPrimary,
                ),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            )),
      ],
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      widget.onChooseImage(image.path);
    } catch (e) {
      //TODO: handle exception
    }
  }
}
