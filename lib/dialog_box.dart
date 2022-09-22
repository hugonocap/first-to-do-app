import 'package:flutt/my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Colors.grey,
      content: Container(
        height: 120,
        child: Column(
          children: [
            //* get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Add a new task',
              ),
            ),
            const SizedBox(height: 10),
            //* buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //* save button
                MyButton(
                    text: 'Save',
                    onPressed: () {
                      onSave();
                    }),

                //* cancel button
                MyButton(
                    text: 'Cancel',
                    onPressed: () {
                      onCancel;
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
