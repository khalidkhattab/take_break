import 'package:first_app/poppages/add_new_break.dart';
import 'package:first_app/poppages/add_new_teacher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'bloc/cubit.dart';

List<String> program = [
  'اضافة موظف',
  'تسجيل اذن',
  'استعراض اذن',
  'احصائيات',
  'من نحن'
];


List<Map<String, dynamic>> menuBar = [
  {'title': 'اضافة موظف', 'screen': const NewTeacherWidget()},
  {'title': 'تسجيل الاذن', 'screen': AddNewBreak(cid:TeakBreakCubit().currentCid)},
  {'title': 'استعراض اذن', 'screen': const Text('null')},
  {'title': 'إحصائيات', 'screen': const Text('null')},
  {'title': 'من نحن', 'screen': const Text('null')},
];

class MyProgram {
  late String title;
  late String image;
  late String details;

  MyProgram({required this.title, required this.image, required this.details});
}

List<MyProgram> programList = [
  MyProgram(
      title: 'Visual Basic',
      image: 'visual.png',
      details:
          'Visual Basic (VB) is defined as an object-oriented language and development environment developed by Microsoft in 1991'),
  MyProgram(
      title: 'Python',
      image: 'Python.png',
      details:
          'Visual Basic (VB) is defined as an object-oriented language and development environment developed by Microsoft in 1991'),
  MyProgram(
      title: 'C++',
      image: 'c++.png',
      details:
          'Visual Basic (VB) is defined as an object-oriented language and development environment developed by Microsoft in 1991'),
  MyProgram(
      title: 'Flutter',
      image: 'Flutter.png',
      details:
          'Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications from a single codebase for any web browser,Fuchsia, Android, iOS, Linux, macOS, and Windows. First described in 2015, Flutter was released in May 2017.'),
  MyProgram(
      title: 'Dart',
      image: 'Dart.png',
      details:
          'Visual Basic (VB) is defined as an object-oriented language and development environment developed by Microsoft in 1991')
];

class MyProject {
  late String title;
  late String image;
  late String details;
  late Color color;

  MyProject(
      {required this.title,
      required this.image,
      required this.details,
      required this.color});
}

List<MyProject> projectList = [
  MyProject(
      title: 'School Alarm',
      image: 'Flutter.png',
      details: 'Not available now',
      color: Colors.orange.shade100),
  MyProject(
      title: 'Student File',
      image: 'Flutter.png',
      details: 'Not available now',
      color: Colors.blueGrey.shade100),
  MyProject(
      title: 'Mr Hasob Site',
      image: 'Flutter.png',
      details: 'Not available now',
      color: Colors.teal.shade100),
];

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

List<Map<String, dynamic>> all_teacher = [];

class TeacherBreak {
  late String tName;
  late String tDepartment;
  late String tCid;
  late DateTime date;
  late DateTime exitTime;
  late DateTime returnTime;
  late String notes;
  late int count;

  TeacherBreak.name(this.tName, this.tDepartment, this.tCid, this.date,
      this.exitTime, this.returnTime, this.notes, this.count);

  TeacherBreak.fromJson(Map<String, dynamic> json) {
    tName = json['tName'];
    tDepartment = json['tDepartment'];
    tCid = json['tCid'];
    date = json['date'];
    exitTime = json['exitTime'];
    returnTime = json['returnTime'];
    notes = json['notes'];
    count = json['count'];
  }
}

