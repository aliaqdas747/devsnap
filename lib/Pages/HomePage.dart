import 'package:devsnap/Constants/Colors.dart';
import 'package:devsnap/components/HabitBox.dart';
import 'package:devsnap/components/HabitEditBox.dart';
import 'package:devsnap/components/my_fab.dart';
import 'package:devsnap/data/habit_database.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../components/habit_Tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 //Instance of database class
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box('Habit_DataBase');


  @override
  @override
  void initState() {
    ///  If  there is is no current habit list , then it is first time ever
    ///Then create default data
    if(_myBox.get("CURRENT_HABIT_LIST") == null){
      db.createDefaultData();

      ///there already exists data , this is not  the first time
    }else{
      db.loadData();


    }
    db.updateDataBase();

    super.initState();
  }

  TextEditingController habitController = TextEditingController();

  void creatNewHabit() {
    showDialog(
        context: context,
        builder: (context) {
          return EnterNewHabitBox(
            onSave: () {
              ///Adding a new habit on list

              setState(() {
                db.todaysHabitList.add([habitController.text, false]);
              });

              ///For clear  the text and remove the dialogbox
              Navigator.of(context).pop();
              habitController.clear();
            },
            onCancel: () {
              Navigator.of(context).pop();
              habitController.clear();
            },
            controller: habitController,
          );
        });
  }

  ///to control habit completed
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
  }

  ///Open Habit Settings to edit
  void openHabitSettings(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return HabitEditBox(
            controller: habitController,
            onSave: () => SaveExistingHabit(index),
            onCancel: () {
              Navigator.of(context).pop();
              habitController.clear();
            }, hintText: db.todaysHabitList[index][0],
          );
        });
  }


///Update
  void SaveExistingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = habitController.text;
    });
    habitController.clear();
    Navigator.of(context).pop();
  }


  ///For delete
  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: MyFlotingActionButton(
          onPressed: creatNewHabit,
        ),
        backgroundColor: DevColors.primaryColors,
        body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: db.todaysHabitList.length,
            itemBuilder: (context, index) {
              return HabitTile(
                habitName: db.todaysHabitList[index][0],
                habitCompleted: db.todaysHabitList[index][1],
                onChanged: (value) => checkBoxTapped(value, index),
                settingsTapped: (context) => openHabitSettings(index),
                deleteTapped: (context) => deleteHabit(index),
              );
            }));
  }
}
