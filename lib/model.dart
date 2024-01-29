import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

List<String> program=[
  'Visual Basic',
  'Python',
  'C++',
  'Flutter',
  'Dart'

];




class MyProgram{
  late String title;
  late String image;
  late String details;

  MyProgram({required  this.title,required  this.image,required  this.details});
}


List<MyProgram> programList=[
  MyProgram(title: 'Visual Basic', image: 'visual.png', details: 'Visual Basic (VB) is defined as an object-oriented language and development environment developed by Microsoft in 1991'),
  MyProgram(title: 'Python', image: 'Python.png', details: 'Visual Basic (VB) is defined as an object-oriented language and development environment developed by Microsoft in 1991'),
  MyProgram(title: 'C++', image: 'c++.png', details: 'Visual Basic (VB) is defined as an object-oriented language and development environment developed by Microsoft in 1991'),
  MyProgram(title: 'Flutter', image: 'Flutter.png', details: 'Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications from a single codebase for any web browser,Fuchsia, Android, iOS, Linux, macOS, and Windows. First described in 2015, Flutter was released in May 2017.'),
  MyProgram(title: 'Dart', image: 'Dart.png', details: 'Visual Basic (VB) is defined as an object-oriented language and development environment developed by Microsoft in 1991')
];


class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}