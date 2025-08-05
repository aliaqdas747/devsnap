import 'package:hive/hive.dart';

final _myBox = Hive.box("Habit_DataBase");

class HabitDatabase {

  List  todaysHabitList = [];

  ///create initial default data
void createDefaultData(){
  todaysHabitList = [
  ["Run",false],
  ["Read",false],


];
}

///Load data if already exists
void loadData(){

}
///update databse
  void updateDataBase(){

  }

}