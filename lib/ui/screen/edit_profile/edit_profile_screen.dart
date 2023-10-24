import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cuemate/configs/theme/constants.dart';
import 'package:cuemate/configs/theme/text_style.dart';
import 'package:cuemate/configs/validations/validation.dart';
import 'package:cuemate/data/model/hobbies/hobbies.dart';
import 'package:cuemate/ui/screen/edit_profile/widget/edit_avatar_component.dart';
import 'package:cuemate/ui/screen/home/home_screen.dart';
import 'package:cuemate/ui/widget/custom_button.dart';
import 'package:cuemate/ui/widget/custom_multiselect_bottom_sheet.dart';
import 'package:cuemate/ui/widget/custom_text_field.dart';
import 'package:cuemate/ui/widget/label.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  static String id = 'edit_profile_screen';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<Hobbies> _selectedHobbies = [];
  final picker = ImagePicker();
  final List<Hobbies> _hobbies = [
    Hobbies(id: 1, name: 'Bóng đá Nam'),
    Hobbies(id: 2, name: 'Bóng đá Nữ'),
    Hobbies(id: 3, name: 'Bóng bàn'),
    Hobbies(id: 4, name: 'Cầu lông'),
    Hobbies(id: 5, name: 'Chạy'),
    Hobbies(id: 6, name: 'Bi-a 9 ball'),
    Hobbies(id: 7, name: 'Bi-a 10 ball'),
    Hobbies(id: 8, name: 'Bi-a 15 ball đồng đội nam'),
  ];
  File? _imageFile;
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Label(
          label: 'Edit Profile',
          textStyle: primaryHeaderTitleStyle,
        ),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: colorPrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultSmallPaddingWidth,
              vertical: kDefaultPaddingHeight),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Center(
                  child: EditAvatarComponent(
                      imageFile: _imageFile, onChooseImage: pickImage),
                ),
                SizedBox(height: 25.h),
                Label(
                  label: AppLocalizations.of(context)!.email,
                  textStyle: labelFieldTextStyle,
                ),
                CustomTextField(
                  labelText: AppLocalizations.of(context)!.email,
                  hintText: AppLocalizations.of(context)!.placeholder_email,
                  controller: _mailController,
                  validation: const [
                    ValidationType.required,
                    ValidationType.email
                  ],
                ),
                SizedBox(height: 15.h),
                Label(
                  label: AppLocalizations.of(context)!.password,
                  textStyle: labelFieldTextStyle,
                ),
                CustomTextField(
                  labelText: AppLocalizations.of(context)!.password,
                  hintText: AppLocalizations.of(context)!.placeholder_password,
                  controller: _passController,
                  isPassword: true,
                  validation: const [
                    ValidationType.required,
                    ValidationType.password
                  ],
                ),
                SizedBox(height: 15.h),
                Label(
                  label: AppLocalizations.of(context)!.fullname,
                  textStyle: labelFieldTextStyle,
                ),
                CustomTextField(
                  labelText: AppLocalizations.of(context)!.fullname,
                  hintText: AppLocalizations.of(context)!.placeholder_fullname,
                  controller: _fullNameController,
                  validation: const [
                    ValidationType.required,
                  ],
                ),
                SizedBox(height: 15.h),
                Label(
                  label: AppLocalizations.of(context)!.location,
                  textStyle: labelFieldTextStyle,
                ),
                CustomTextField(
                  labelText: AppLocalizations.of(context)!.location,
                  hintText: AppLocalizations.of(context)!.placeholder_location,
                  controller: _locationController,
                  validation: const [
                    ValidationType.required,
                  ],
                ),
                SizedBox(height: 15.h),
                Label(
                  label: 'Hobbies',
                  textStyle: labelFieldTextStyle,
                ),
                CustomMultiSelectSheet(
                  hintText: 'Choose your hobbies',
                  items: _hobbies,
                  selectedList: _selectedHobbies,
                  onConfirm: (value) {
                    setState(() {
                      _selectedHobbies = List<Hobbies>.from(value);
                    });
                  },
                ),
                SizedBox(height: 35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      width: 100,
                      isOutlined: true,
                      buttonText: AppLocalizations.of(context)!.btn_cancel,
                      onPressed: () {},
                    ),
                    CustomButton(
                      width: 100,
                      buttonText: AppLocalizations.of(context)!.btn_save,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, HomeScreen.id);
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  pickImage(imagePath) {
    if (imagePath == null) {
      return;
    }
    setState(() {
      _imageFile = File(imagePath);
    });
  }
}
