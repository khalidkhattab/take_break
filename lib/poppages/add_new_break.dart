import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit.dart';
import '../bloc/cubit_status.dart';
import '../component.dart';

class AddNewBreak extends StatelessWidget {
  const AddNewBreak({super.key});






  @override
  Widget build(BuildContext context) {

    TextEditingController teacherNameController = TextEditingController();
    TextEditingController teacherTitleController = TextEditingController();
    late TextEditingController teacherCidController = TextEditingController();
    TextEditingController teacherFileNumberController = TextEditingController();
    TextEditingController teacherDepartController = TextEditingController();
    TextEditingController leaveTimeController = TextEditingController();
    TextEditingController returnTimeController = TextEditingController();


    return BlocConsumer<TeakBreakCubit, TakeBreakStatus>(builder: (context, state){
       final cubit=TeakBreakCubit.get(context);

      return AlertDialog.adaptive(
        title: const Center(child: Text('إضافة معلم')),
        actions: [
          MaterialButton(
            color: Colors.green,
            onPressed: () {
              cubit
                  .addNewTeacher(
                  cid: teacherCidController.text,
                  name: teacherNameController.text,
                  title: teacherTitleController.text,
                  fileNumber: teacherFileNumberController.text,
                  dep: teacherDepartController.text,
                  hairDate: leaveTimeController.text,
                  nesab: returnTimeController.text)
                  .then((value) {

                Navigator.of(context).pop();
              });
            },
            child: const Text(
              'حفظ',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
        actionsAlignment: MainAxisAlignment.center,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormAlarm(
                controller: teacherNameController,
                label: 'الاسم',
                password: false,
                alert: 'يجب ادحال اسم المعلم'),
            TextFormAlarm(
                controller: teacherTitleController,
                label: 'المسمي',
                password: false,
                alert: 'يجب ادخال المسمى الوظيفي'),
            TextFormAlarm(
                controller: teacherCidController,
                label: 'الرقم المدني',
                password: false,
                alert: 'يجب ادحال الرقم المدني'),
            TextFormAlarm(
                controller: teacherFileNumberController,
                label: 'رقم الملف',
                password: false,
                alert: 'يجب ادحال رقم الملف '),
            TextFormAlarm(
                controller: teacherDepartController,
                label: 'القسم',
                password: false,
                alert: 'يجب ادحال القسم'),
            TextFormAlarm(
                controller: returnTimeController,
                label: 'تاريخ التعيين',
                password: false,
                alert: 'يجب ادحال تاريخ التعيين'),
            TextFormAlarm(
                controller: returnTimeController,
                label: 'النصاب',
                password: false,
                alert: 'يجب ادحال النصاب'),
          ],
        ),
      );
    }, listener: (context, state){

    });
  }
}
