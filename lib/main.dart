 import 'package:devsnap/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

 void main() async {
   WidgetsFlutterBinding.ensureInitialized(); // Ensure that Flutter is initialized

   // Get the application documents directory
   final directory = await getApplicationDocumentsDirectory();

   // Initialize Hive with the directory
   Hive.init(directory.path);

   // Open a box (optional, you can do this later as well)
   await Hive.openBox('Habit_DataBase');

   runApp(MyApp());
 }
 class MyApp extends StatelessWidget {
   const MyApp({super.key});
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(

       debugShowCheckedModeBanner: false,
       home: MyHomePage(),
       theme: ThemeData(primarySwatch: Colors.deepOrange, primaryColor: Colors.deepOrange),
     );
   }
 }
