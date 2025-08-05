import 'package:devsnap/Constants/Colors.dart';
import 'package:flutter/material.dart';

class EnterNewHabitBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const EnterNewHabitBox({super.key, this.controller, required this.onSave, required this.onCancel, });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: DevColors.primaryColors,
      content: Container(

          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.electric_bolt_outlined,
                color: Colors.deepOrange,
                size: 60,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller,
                style: TextStyle(color: Colors.white,fontFamily: 'Poppins',),
                cursorColor: Colors.deepOrange, // Set the cursor color
                decoration: InputDecoration(
                  hintText: 'Enter text here',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    // Rounded corners
                    borderSide: BorderSide(
                        color: Colors.deepOrange), // Enabled border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    // Keep the same radius
                    borderSide: BorderSide(
                        color: Colors.deepOrange), // Focused border color
                  ),
                  filled: true,
                  // Optional: fill the background
                  fillColor: DevColors.secondaryColors, // Background color
                ),
              ),
              
            ],
          )),
      actions: [
        Row(
          children: [
            Expanded(child: OutlinedButton(onPressed: onCancel, child: Text('Cancel',style: TextStyle(color: Colors.deepOrange,fontFamily: 'Poppins',),))),
           SizedBox(width: 10,),
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange,foregroundColor: Colors.white),
                  onPressed: onSave, child: Text('Save',style: TextStyle(fontFamily: 'Poppins',),)),
            )
          ],
        ),

      ],
    );
  }
}
