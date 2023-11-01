import 'package:flutter/material.dart';

Widget customTextField({String? title, TextEditingController? controller, bool? isHidden}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title!,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: TextField(
          controller: controller,
          obscureText: isHidden!,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    ],
  );
}
