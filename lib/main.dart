import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                // Container(
                //   color: Colors.black12,
                //   padding: const EdgeInsets.all(0.0),
                //   margin: EdgeInsets.zero,
                //
                //   child: Icon(
                //     Icons.computer, color: Colors.deepOrange.shade300,size: 40,),
                // ),
                Text(
                  'Mr',
                  style:
                      GoogleFonts.lora(fontSize: 35, color: Colors.deepOrange),
                ),
                Text(
                  ':Hasob',
                  style: GoogleFonts.lora(fontSize: 20, color: Colors.black),
                )
              ],
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Home',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'About Us',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Program',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.orange,
                  ),
                  child: Text(
                    'Contact Us',
                    style: GoogleFonts.lora(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children:  [
          Container(
            width:double.infinity ,
            color: Colors.grey.shade200,
            height: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('مرحبا بكم ', style: GoogleFonts.cairo(color: Colors.deepOrange, fontSize: 45),)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
