import 'package:flutter/material.dart';
import 'package:holi/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  
  Widget build(BuildContext context){
    
    return MaterialApp(
      title: 'Holi',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primaryColor: Colors.deepPurple),
    );
  }
}