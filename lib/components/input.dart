import 'package:flutter/material.dart';
import 'package:app/common/colors.dart';

Widget buildInput(String hint, String label) {
  return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: TextFormField(
        cursorColor: primaryColor,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: lightGreyColor),
            labelText: label,
            labelStyle: const TextStyle(color: greyColor),
            alignLabelWithHint: true,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            )),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Preencha este campo';
          }
          return null;
        },
      ));
}
