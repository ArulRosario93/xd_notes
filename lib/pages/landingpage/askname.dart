import 'package:flutter/material.dart';

class askName extends StatelessWidget {
  Function handleClick;
  final TextEditingController controller;
  askName({super.key, required this.controller, required this.handleClick});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Enter Name",
      ),
      // onFieldSubmitted: handleClick(),
    );
  }
}
