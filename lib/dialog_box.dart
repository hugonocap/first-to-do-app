import 'package:flutt/my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  const DialogBox({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow.shade300,
      content: Container(
        height: 120,
        child: Column(
          children: [
            //* get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
            ),
            const SizedBox(height: 10),
            //* buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //* save button
                MyButton(text: 'Save button', onPressed: () {}),

                //* cancel button
                MyButton(text: 'Save button', onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
