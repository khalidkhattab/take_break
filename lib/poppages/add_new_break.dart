import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit.dart';
import '../bloc/cubit_status.dart';
import '../component.dart';
import '../takeoff.dart';

class AddNewBreak extends StatelessWidget {
  const AddNewBreak({super.key, required this.cid});

  final String cid;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    TextEditingController teacherNameController = TextEditingController();
    TextEditingController teacherTitleController = TextEditingController();
    late TextEditingController teacherCidController = TextEditingController();
    TextEditingController teacherFileNumberController = TextEditingController();
    TextEditingController teacherDepartController = TextEditingController();
    TextEditingController breakDateController = TextEditingController();
    TextEditingController leaveTimeController = TextEditingController();
    TextEditingController returnTimeController = TextEditingController();

    return BlocConsumer<TeakBreakCubit, TakeBreakStatus>(
        builder: (context, state) {
          final cubit = TeakBreakCubit.get(context);

          return AlertDialog.adaptive(
            title: const Center(child: Text('إضافة اذن جديد')),
            actions: [
              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    cubit
                        .addNewBreak(
                            cid: cid,
                            name: teacherNameController.text,
                            title: teacherTitleController.text,
                            fileNumber: teacherFileNumberController.text,
                            dep: teacherDepartController.text,
                            date: breakDateController.text,
                            leaveTime: leaveTimeController.text,
                            returnTime: returnTimeController.text)
                        .then((value) {
                      (state is AddTeacherBreakErrorState)
                          ? showDialog(
                              context: context,
                              builder: (context) =>  AlertDialog(
                                    title:const Text('Error'),
                                actions: [
                                  MaterialButton(onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child:const Text('Ok'),
                                  )
                                ],
                                  ))
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TakeOff()));
                    });
                  }
                },
                child: const Text(
                  'حفظ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
            actionsAlignment: MainAxisAlignment.center,
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormAlarm(
                      controller: teacherNameController
                        ..text = cubit.currentEmployee[0]?['name'],
                      label: 'الاسم',
                      password: false,
                      alert: 'يجب ادحال اسم المعلم'),
                  TextFormAlarm(
                      controller: teacherTitleController
                        ..text = cubit.currentEmployee[0]?['title'],
                      label: 'المسمي',
                      password: false,
                      alert: 'يجب ادخال المسمى الوظيفي'),
                  TextFormAlarm(
                      controller: teacherCidController
                        ..text = cubit.currentEmployee[0]?['cid'],
                      label: 'الرقم المدني',
                      password: false,
                      alert: 'يجب ادحال الرقم المدني'),
                  TextFormAlarm(
                      controller: teacherFileNumberController
                        ..text = cubit.currentEmployee[0]?['file_num'],
                      label: 'رقم الملف',
                      password: false,
                      alert: 'يجب ادحال رقم الملف '),
                  TextFormAlarm(
                      controller: teacherDepartController
                        ..text = cubit.currentEmployee[0]?['dep'],
                      label: 'القسم',
                      password: false,
                      alert: 'يجب ادحال القسم'),
                  TextFormAlarm(
                    controller: breakDateController,
                    label: 'تاريخ الاذن',
                    password: false,
                    alert: 'يجب ادحال تاريخ الاذن',
                  ),
                  TextFormAlarm(
                      controller: leaveTimeController,
                      label: 'وقت المغادرة ',
                      password: false,
                      alert: 'يجب ادحال وقت المغادرة'),
                  TextFormAlarm(
                      controller: returnTimeController,
                      label: 'وقت العودة',
                      password: false,
                      alert: 'يجب ادحال وقت العودة'),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
