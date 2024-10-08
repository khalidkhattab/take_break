import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cubit_status.dart';

class TeakBreakCubit extends Cubit<TakeBreakStatus> {
  TeakBreakCubit() : super(TakeBreakInitStatus());

  static TeakBreakCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> allTeacher = [];

  DateTime selectedDate = DateTime.now();

  //to store current employee cid to return his data and break time
  late String currentCid = '283021205454';

  getTeacherData() {
    allTeacher = [];
    emit(GetTeacherDataLoadingState());
    FirebaseFirestore.instance.collection('employee').get().then((value) {
      for (var action in value.docs) {
        print(action.data());
        allTeacher.add(action.data());
        print(allTeacher);
        emit(GetTeacherDataSuccessState());
      }
    }).catchError((error) {
      emit(GetTeacherDataErrorState());
    });
  }

  List<Map<String, dynamic>?> currentEmployee = [];
  Future getEmployeeData(String cid) async {
    // currentEmployee = [];
    emit(GetCurrentEmployeeDataLoadingState());
    await FirebaseFirestore.instance
        .collection('employee')
        .doc(cid)
        .get()
        .then((value) {
      currentEmployee.add(value.data());
      print(currentEmployee);
      emit(GetCurrentEmployeeDataSuccessState());
    }).catchError((error) {
      emit(GetCurrentEmployeeDataErrorState());
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
    await FirebaseFirestore.instance.collection('employee').doc(cid).set({
      'cid': cid,
      'file_num': fileNumber,
      'name': name,
      'nesab': nesab,
      'title': title,
      'hairDate': hairDate,
      'dep': dep
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
        .collection('employee')
        .doc(cid)
        .delete()
        .then((val) {
      emit(DeleteTeacherDataSuccessState());
      getTeacherData();
    }).catchError((error) {
      emit(DeleteTeacherDataErrorState());
    });
  }

  getDepart() {
    FirebaseFirestore.instance.collection('dep').get().then((value) {
      for (var val in value.docs) {
        print(val.data());
      }
    });
  }
//we can store department in list of map
//   {title: computer}
//   {title: Math}

  Future<void> addNewBreak({
    required String cid,
    required String name,
    required String title,
    required String fileNumber,
    required String dep,
    required String date,
    required String leaveTime,
    required String returnTime,
  }) async {
    await getEmployeeBreak(cid).then((value){
      emit(AddTeacherBreakLoadingState());
      FirebaseFirestore.instance
          .collection('employee')
          .doc(cid)
          .collection('ezn')
          .doc((employeeBreak.length+1).toString())
          .set({
        'cid': cid,
        'file_num': fileNumber,
        'name': name,
        'date': date,
        'title': title,
        'leaveTime': leaveTime,
        'returnTime': returnTime,
        'dep': dep,
        'doc':(employeeBreak.length+1).toString()
      }).then((val) {
        getTeacherData();
        emit(AddTeacherBreakSuccessState());
      }).catchError((error) {
        emit(AddTeacherBreakErrorState());
      });
    });

  }

  screenRefresh() {
    emit(RefreshState());
  }

  // Get all Break For one Employee
  // first define a List to store employee break
  List<Map<String, dynamic>> employeeBreak = [];
  Future<void> getEmployeeBreak(String cid) async {
    emit(GetTeacherBreakLoadingState());
    employeeBreak = [];
    await FirebaseFirestore.instance
        .collection('employee')
        .doc(cid)
        .collection('ezn')
        .get()
        .then((value) {
      for (var ezn in value.docs){
        employeeBreak.add(ezn.data());
      }
      // print list for test only
      print(employeeBreak);
      emit(GetTeacherBreakSuccessState());
    })
        .catchError((error) {
      emit(GetTeacherBreakErrorState());
    });
  }


  Future<void> deleteEmployeeBreak(String cid, String docs) async {
    emit(DeleteTeacherBreakErrorState());
    employeeBreak = [];
    await FirebaseFirestore.instance
        .collection('employee')
        .doc(cid)
        .collection('ezn')
        .doc(docs).delete()
        .then((value) {
      // print list for test only
      getEmployeeBreak(cid);
      emit(DeleteTeacherBreakSuccessState());
    })
        .catchError((error) {
      emit(DeleteTeacherBreakErrorState());
    });
  }
}