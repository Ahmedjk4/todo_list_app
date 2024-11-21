import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.type,
  });
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextFieldType type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type == TextFieldType.subtitle
          ? TextInputType.multiline
          : TextInputType.text,
      maxLines: type == TextFieldType.subtitle ? null : 1,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}

enum TextFieldType { title, subtitle }
