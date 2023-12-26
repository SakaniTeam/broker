// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomPasswordTextFiled extends StatelessWidget {
  String? hintText;
  Function(String)? onChange;
  final TextEditingController myController;
  CustomPasswordTextFiled({super.key, this.hintText, this.onChange, required this.myController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'field is required';
          }
        },
        controller: myController,
        onChanged: onChange,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, color: Colors.black),
            contentPadding: EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 10,
            ),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: const Color.fromARGB(255, 235, 235, 235),
              ),
            )),
      ),
    );
  }
}
