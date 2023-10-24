import 'package:flutter/material.dart';
import 'package:cuemate/configs/theme/constants.dart';
import 'package:cuemate/configs/theme/text_style.dart';
import 'package:cuemate/data/model/hobbies/hobbies.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class CustomMultiSelectSheet extends StatefulWidget {
  const CustomMultiSelectSheet(
      {super.key,
      required this.hintText,
      required this.items,
      required this.selectedList,
      required this.onConfirm});

  final String hintText;
  final List<Hobbies> items;
  final List<Hobbies> selectedList;
  final Function onConfirm;

  @override
  State<CustomMultiSelectSheet> createState() => _CustomMultiSelectSheetState();
}

class _CustomMultiSelectSheetState extends State<CustomMultiSelectSheet> {
  @override
  Widget build(BuildContext context) {
    final mapItems = widget.items
        .map((item) => MultiSelectItem<Hobbies>(item, item.name))
        .toList();
    final selectedList = widget.selectedList;
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: selectedList.isEmpty ? 15 : 5,
            horizontal: selectedList.isEmpty ? 10 : 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 1,
            color: colorPrimary,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (ctx) {
                  return MultiSelectBottomSheet(
                    items: mapItems,
                    initialValue: selectedList,
                    onConfirm: (values) {
                      widget.onConfirm(values);
                    },
                    maxChildSize: 0.8,
                  );
                });
          },
          child: selectedList.isEmpty
              ? Text(
                  widget.hintText,
                  style: placeholderTextStyle,
                )
              : Wrap(
                  spacing: 4,
                  runSpacing: 0,
                  children: selectedList.map((e) {
                    return Chip(label: Text(e.name));
                  }).toList(),
                ),
        ));
  }
}
