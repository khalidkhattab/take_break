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
                            leaveTime: cubit.leaveTime.toString(),
                            returnTime: cubit.returnTime.toString())
                        .then((value) {
                      (state is AddTeacherBreakErrorState)
                          ? showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text('Error'),
                                    actions: [
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Ok'),
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
                      icon: const Icon(Icons.person),
                      controller: teacherNameController
                        ..text = cubit.currentEmployee[0]?['name'],
                      label: 'الاسم',
                      password: false,
                      alert: 'يجب ادحال اسم المعلم'),
                  TextFormAlarm(
                      icon: const Icon(Icons.important_devices),
                      controller: teacherTitleController
                        ..text = cubit.currentEmployee[0]?['title'],
                      label: 'المسمي',
                      password: false,
                      alert: 'يجب ادخال المسمى الوظيفي'),
                  TextFormAlarm(
                      icon: const Icon(Icons.confirmation_num),
                      controller: teacherCidController
                        ..text = cubit.currentEmployee[0]?['cid'],
                      label: 'الرقم المدني',
                      password: false,
                      alert: 'يجب ادحال الرقم المدني'),
                  TextFormAlarm(
                      icon: const Icon(Icons.confirmation_num),
                      controller: teacherFileNumberController
                        ..text = cubit.currentEmployee[0]?['file_num'],
                      label: 'رقم الملف',
                      password: false,
                      alert: 'يجب ادحال رقم الملف '),
                  TextFormAlarm(
                      icon: const Icon(Icons.perm_contact_calendar),
                      controller: teacherDepartController
                        ..text = cubit.currentEmployee[0]?['dep'],
                      label: 'القسم',
                      password: false,
                      alert: 'يجب ادحال القسم'),
                  TextFormAlarm(
                    icon:IconButton(onPressed: ()async{
                      final  DateTime?  leaveDate= await showDatePicker(
                          context: context,
                          firstDate: DateTime(1990),
                      lastDate: DateTime(2040),);
                      if( leaveDate != null){
                        cubit.selectedDate=leaveDate;
                        cubit.screenRefresh();
                      }
                    }, icon: const Icon(Icons.date_range_outlined)),
                    controller: breakDateController..text="${cubit.selectedDate.day}-${cubit.selectedDate.month}-${cubit.selectedDate.year}",
                    label: 'تاريخ الاذن',
                    password: false,
                    alert: 'يجب ادحال تاريخ الاذن',
                  ),
                  TextFormAlarm(
                      icon: IconButton(
                          onPressed: () async {
                            final TimeOfDay? leaveTime = await showTimePicker(
                              context: context,
                              initialTime: cubit.leaveTime,
                              initialEntryMode: TimePickerEntryMode.dial,
                            );
                            if (leaveTime != null) {
                              cubit.leaveTime = leaveTime;
                              cubit.screenRefresh();
                            }
                          },
                          icon: Icon(Icons.timer)),
                      controller: leaveTimeController..text="${cubit.leaveTime.hour}:${cubit.leaveTime.minute}",
                      label: 'وقت المغادرة ',
                      password: false,
                      alert: 'يجب ادحال وقت المغادرة'),
                  TextFormAlarm(
                      icon: IconButton(
                          onPressed: () async {
                            final TimeOfDay? returnTime = await showTimePicker(
                              context: context,
                              initialTime: cubit.returnTime,
                              initialEntryMode: TimePickerEntryMode.dial,
                            );
                            if (returnTime != null) {
                              cubit.returnTime = returnTime;
                              cubit.screenRefresh();
                            }
                          },
                          icon: Icon(Icons.timer)),
                      controller: returnTimeController
                        ..text =
                            "${cubit.returnTime.hour}:${cubit.returnTime.minute}",
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
