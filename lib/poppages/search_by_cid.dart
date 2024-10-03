import 'package:flutter/material.dart';

import '../bloc/cubit.dart';
import '../component.dart';

class SearchByCid extends StatelessWidget {
  const SearchByCid({
    super.key,
    required this.cubit,
  });

  final TeakBreakCubit cubit;


  @override
  Widget build(BuildContext context) {
    TextEditingController teacherCidController = TextEditingController();
    return AlertDialog(
      actions: [
        MaterialButton(
          onPressed: () {
            cubit.getEmployeeData(
                teacherCidController.text).then((value){
                  // Navigator.push(context, ())
            });
            // showDatePicker(
            //     context: context,
            //     firstDate: DateTime(2000),
            //     lastDate: DateTime(2040),
            // ).then((value){
            //   print(value);
            //   print("${value?.day}-${value?.month}-${value?.year}");
            // });
          },
          child: const Text('حفط'),
        )
      ],
      title:
      const Center(child: Text("ادخل الرقم المدني")),
      content: TextFormAlarm(
        alert: 'ادخل الرقم المدني',
        controller: teacherCidController,
        label: 'الرقم المدتي',
        password: false,
      ),
    );
  }
}

