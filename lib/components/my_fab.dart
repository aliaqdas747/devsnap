import 'package:flutter/material.dart';

class MyFlotingActionButton extends StatelessWidget {
  final Function()? onPressed;

  const MyFlotingActionButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return    FloatingActionButton(
    backgroundColor: Colors.deepOrange,
    child: Icon(Icons.electric_bolt_outlined,color: Colors.white,),
    onPressed: onPressed
    );
  }
}
