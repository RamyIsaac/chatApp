import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  CustomTextFormFieldWidget(
      {super.key,
      this.onChanged,
      required this.hintText,
      this.icon,
      required this.label});
  final String hintText;
  final String label;
  final Icon? icon;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
      },
      onChanged: onChanged,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.yellow),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        label: Text(
          '$label',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
