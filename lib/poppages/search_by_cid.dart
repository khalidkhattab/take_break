import 'package:first_app/poppages/add_new_break.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit.dart';
import '../bloc/cubit_status.dart';
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
    return BlocConsumer<TeakBreakCubit, TakeBreakStatus>(builder: (context, state){
     return AlertDialog(
        actions: [
          MaterialButton(
            onPressed: () {
              cubit.getEmployeeData(
                  teacherCidController.text).then((value){
                print(cubit.currentEmployee[0]?['cid']);
                (state is GetCurrentEmployeeDataSuccessState)?
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewBreak(cid:cubit.currentEmployee[0]?['cid']))):null;
                // showDialog(context: context, builder: (context)=>AddNewBreak(cid:cubit.currentEmployee[0]?['cid']));
              });

            },
            child:const Center(child:  Text('بحث', style: TextStyle(fontSize: 20),)),
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
    }, listener: (context, state){});


  }
}



