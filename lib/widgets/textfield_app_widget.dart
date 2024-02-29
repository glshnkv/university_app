import 'package:flutter/material.dart';
import 'package:university_app/theme/colors.dart';

class TextFieldAppWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const TextFieldAppWidget(
      {super.key,
        required this.controller,
        required this.hintText,});

  @override
  State<TextFieldAppWidget> createState() => _TextFieldAppWidgetState();
}

class _TextFieldAppWidgetState extends State<TextFieldAppWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: TextStyle(color: Colors.white),
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkTurquoise, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkTurquoise),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Colors.white30,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}