import 'package:devsnap/Constants/Colors.dart';
import 'package:devsnap/components/Custom_CheckBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatefulWidget {
  final String habitName;
  final bool habitCompleted;
  final ValueChanged<bool?> onChanged;
  final Function(BuildContext)? settingsTapped;
  final Function(BuildContext)? deleteTapped;

  const HabitTile(
      {super.key,
      required this.habitName,
      required this.habitCompleted,
      required this.onChanged, this.settingsTapped, this.deleteTapped});

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        ///Settings Option
        SlidableAction(onPressed:widget.settingsTapped,
        backgroundColor: Colors.deepOrange,
          icon: Icons.edit,

          borderRadius: BorderRadius.circular(10),
        ),
SizedBox(width: 5,),
        ///For delete
        SlidableAction(onPressed: widget.deleteTapped,
        backgroundColor: Colors.red,
          icon: Icons.delete,
          borderRadius: BorderRadius.circular(10),
        )
      ]),

      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: DevColors.lightSecondary,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                ///CheckBox
                 CustomCheckbox(
                  value: widget.habitCompleted,
                  onChanged: widget.onChanged,
                  activeIcon: Icons.electric_bolt,
                  inactiveIcon: Icons.electric_bolt_outlined,
                ),
                 SizedBox(
                  width: 20,
                ),
        
                ///Title
                Text(
                  widget.habitName,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
