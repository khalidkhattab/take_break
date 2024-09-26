

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubit_status.dart';

class TeakBreakCubit extends Cubit<TakeBreakStatus>{

  TeakBreakCubit(): super(TakeBreakInitStatus());


  static TeakBreakCubit get(context)=>BlocProvider.of(context);

 List<Map<String, dynamic>> allTeacher=[];

  getTeacherData(){
    emit(GetTeacherDataLoadingState());
    FirebaseFirestore.instance.collection('dep').doc('1000').collection('teachers').get().then((value){
      allTeacher=[];
      for (var action in value.docs) {
        // print(action.data());
        allTeacher.add(action.data());
        print(allTeacher);
        emit(GetTeacherDataSuccessState());
      }
    }).catchError((error){
      emit(GetTeacherDataErrorState());
    });
  }


}