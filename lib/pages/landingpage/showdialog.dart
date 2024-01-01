import 'package:flutter/material.dart';

class showdialog extends StatelessWidget {
  final TextEditingController controller;
  Function addToList;
  showdialog({super.key, required this.controller, required this.addToList});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add to your list"),
      content: TextField(
        autofocus: true,
        controller: controller,
        decoration: const InputDecoration(
          hintText: "Enter your task",
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            addToList();
            Navigator.pop(context);
          },
          child: const Text("Add", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),)
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            controller.clear();
          },
          child: const Text("Cancel", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        ),
      ],
    );
  }
}