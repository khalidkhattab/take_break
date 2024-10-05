import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/bloc/cubit.dart';
import 'package:first_app/model.dart';
import 'package:first_app/takeoff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'bloc/cubit_observer.dart';
import 'bloc/cubit_status.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCxyFbiW-Xcu_dB8QHHb9xSG8XFbHPiaGU",
        authDomain: "take-break-8b0b1.firebaseapp.com",
        projectId: "take-break-8b0b1",
        storageBucket: "take-break-8b0b1.appspot.com",
        messagingSenderId: "91082181665",
        appId: "1:91082181665:web:e12824f0170fbdc2076760",
        measurementId: "G-JJ66KFZVRP"),
  );
  Bloc.observer = MyBlocObserver();
  runApp(
    BlocProvider(
      create: (BuildContext context) => TeakBreakCubit()
        ..getTeacherData()
        ..getEmployeeData('283021205454'),
      child: const MyApp(),
    ),
  );
}

//MyApp()
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Take Break',
      theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.cairoPlayTextTheme(
        Theme.of(context).textTheme,
      )),
      home: BlocConsumer<TeakBreakCubit, TakeBreakStatus>(
          builder: (BuildContext context, state) {
        return (state is GetCurrentEmployeeDataLoadingState)
            ? const SizedBox(
                width: 100,
                child: LoadingIndicator(
                  indicatorType: Indicator.orbit,
                  colors: [Colors.deepOrange],
                  strokeWidth: 1,
                ),
              )
            : const TakeOff(); //const
      }, listener: (context, state) {
        if (state is GetTeacherDataLoadingState) {
          const CircularProgressIndicator();
        }
      }),
    );
    // currentWidth>900?const MyDeskTop():const MyMobile() ,
  }
}
