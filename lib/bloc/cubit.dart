import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubit_status.dart';

class TeakBreakCubit extends Cubit<TakeBreakStatus> {
  TeakBreakCubit() : super(TakeBreakInitStatus());

  static TeakBreakCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> allTeacher = [];

  getTeacherData() {
    allTeacher = [];
    emit(GetTeacherDataLoadingState());
    FirebaseFirestore.instance
        .collection('dep')
        .doc('1000')
        .collection('teachers')
        .get()
        .then((value) {
      for (var action in value.docs) {
        // print(action.data());
        allTeacher.add(action.data());
        print(allTeacher);
        emit(GetTeacherDataSuccessState());
      }
    }).catchError((error) {
      emit(GetTeacherDataErrorState());
    });
  }

  Future<void> addNewTeacher({
    required String cid,
    required String name,
    required String title,
    required String fileNumber,
    required String dep,
    required String hairDate,
    required String nesab,
  }) async {
    emit(GetTeacherDataLoadingState());
  await  FirebaseFirestore.instance
        .collection('dep')
        .doc('1000')
        .collection('teachers')
        .doc(cid)
        .set({
      'cid': cid,
      'file_num': fileNumber,
      'name': name,
      'nesab': nesab,
      'title': title,
      'hairDate':hairDate,
      'dep':dep
    }).then((val) {
      getTeacherData();
      emit(AddTeacherDataSuccessState());
    }).catchError((error) {
      emit(AddTeacherDataErrorState());
    });
  }

  Future<void> deleteTeacher(String cid) async {
    emit(DeleteTeacherDataLoadingState());
    await FirebaseFirestore.instance
        .collection('dep')
        .doc('1000')
        .collection('teachers')
        .doc(cid)
        .delete()
        .then((val) {
      emit(DeleteTeacherDataSuccessState());
      getTeacherData();
    }).catchError((error) {
      emit(DeleteTeacherDataErrorState());
    });
  }


  Future<void> addBreak(String cid) async{

  }
}
