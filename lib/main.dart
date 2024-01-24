import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
        children: [
          Container(
            width: double.infinity,
            color: Colors.grey.shade200,
            height: 370,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hi! i Am ',
                      style: GoogleFonts.cairo(
                          color: Colors.black,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Khalid Khattab ',
                      style: GoogleFonts.cairo(
                          color: Colors.orange,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Computer teacher and Flutter dev . ',
                      style: GoogleFonts.cairo(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'More than 14 years of experience in teaching computer science. ',
                      style: GoogleFonts.cairo(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {

                            launchUrl(Uri.parse('https://wa.me/+96599245950?text=Hi'),
                                mode: LaunchMode.externalApplication);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.orange,
                          ),
                          child: Text(
                            'Contact Us',
                            style: GoogleFonts.lora(fontSize: 15, color: Colors.white),
                          ),
                        ),
                         const SizedBox(width: 20,),
                         SizedBox(

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(

                                icon:const Icon(Icons.play_circle, color: Colors.orange,size: 35,), onPressed: () {  } ,
                              ),
                               Text('See My Channel', style: const TextTheme().bodySmall)
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const Image(
                  image: AssetImage(
                    'images/me.png',
                  ),
                  width: 280,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
