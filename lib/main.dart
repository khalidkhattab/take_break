import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/bloc/cubit.dart';
import 'package:first_app/model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'bloc/cubit_observer.dart';
import 'bloc/cubit_status.dart';
import 'new_takeoff.dart';

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
  if (defaultTargetPlatform != TargetPlatform.windows) {
    // window currently don't support storage emulator
    final emulatorHost =
    (!kIsWeb && defaultTargetPlatform == TargetPlatform.android)
        ? '10.0.2.2'
        : 'localhost';

    await FirebaseStorage.instance.useStorageEmulator(emulatorHost, 9199);
  }

  runApp(
    BlocProvider(
      create: (BuildContext context) => TeakBreakCubit()
        ..getTeacherData()
        ..getDepart(),
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
            : const NewTeakOff(); //const TakeOff()
      }, listener: (context, state) {
        if (state is GetTeacherDataLoadingState) {
          const CircularProgressIndicator();
        }
      }),
    );
    // currentWidth>900?const MyDeskTop():const MyMobile() ,
  }
}
