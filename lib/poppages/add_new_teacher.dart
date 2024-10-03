import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit.dart';
import '../bloc/cubit_status.dart';
import '../component.dart';

class NewTeacherWidget extends StatelessWidget {
  const NewTeacherWidget({super.key});






  @override
  Widget build(BuildContext context) {

    TextEditingController teacherNameController = TextEditingController();
    TextEditingController teacherTitleController = TextEditingController();
    late TextEditingController teacherCidController = TextEditingController();
    TextEditingController teacherFileNumberController = TextEditingController();
    TextEditingController teacherDepartController = TextEditingController();
    TextEditingController teacherNesabController = TextEditingController();

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
                  hairDate: "${cubit.selectedDate.day}-${cubit.selectedDate.month}-${cubit.selectedDate.year}",
                  nesab: teacherNesabController.text)
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
            // TextFormAlarm(
            //     controller: teacherHairDateController,
            //     label: 'تاريخ التعيين',
            //     password: false,
            //     alert: 'يجب ادحال تاريخ التعيين'),
            Center(
              child: Container(
                height: 65,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.green, spreadRadius: 1),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text("${cubit.selectedDate.day}-${cubit.selectedDate.month}-${cubit.selectedDate.year}", style: TextStyle(fontSize: 18),),
                  Column(
                    children: [
                      Text("تاريخ التعيين")
                      ,
                      IconButton(onPressed: (){

                          showDatePicker(

                            context: context,
                            firstDate: DateTime(1990),
                            lastDate: DateTime(2040),
                          ).then((value){
                            print(value);
                            cubit.selectedDate=value!;
                            cubit.screenRefresh();
                          });
                      }, icon:const Icon(Icons.date_range_outlined, color: Colors.deepOrange,size: 25,)),
                    ],
                  ),
                ],),
              ),
            ),
            TextFormAlarm(
                controller: teacherNesabController,
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
