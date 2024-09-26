import 'package:first_app/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MyMobile extends StatelessWidget {
  const MyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Image(
                  image: AssetImage('images/logo.png'),
                  width: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      'Mr',
                      style:
                      GoogleFonts.lora(fontSize: 35, color: Colors.orange),
                    ),
                    Text(
                      ':Hasob',
                      style:
                      GoogleFonts.lora(fontSize: 20, color: Colors.black),
                    )
                  ],
                ),
              ],
            ),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    'WhatsApp',
                    style: GoogleFonts.lora(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      drawer: Drawer(
        child:    Column(
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
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            'Khalid Khattab',
                            style: GoogleFonts.cairo(
                                color: Colors.orange,
                                fontSize: 45,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '.',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.black,
                                fontSize: 60,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        'Computer teacher and Flutter developer. ',
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
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              launchUrl(
                                  Uri.parse(
                                      'https://wa.me/+96599245950?text=Hi'),
                                  mode: LaunchMode.externalApplication);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.green.shade300,
                            ),
                            child: Text(
                              'WhatsApp',
                              style: GoogleFonts.lora(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.play_circle,
                                    color: Colors.red,
                                    size: 35,
                                  ),
                                  onPressed: () {
                                    launchUrl(Uri.parse(
                                        'https://www.youtube.com/channel/UChA_rMzP10iZg5kSizEM8Rg'));
                                  },
                                ),
                                Text('See My Channel',
                                    style: GoogleFonts.lobster(
                                        color: Colors.grey.shade600))
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 370,
                    width: 370,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/me2.png'),
                        )),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 120,
              child: ListView.builder(
                  itemCount: program.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    child: Text(
                      program[index],
                      style: GoogleFonts.lobster(
                        fontSize: 35,
                        color: Colors.grey,
                      ),
                    ),
                  )),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'My Awesome Services',
                    style: GoogleFonts.cairo(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Computer teacher and Flutter dev . ',
                    style: GoogleFonts.cairo(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'More than 14 years of experience in teaching computer science. ',
                    style: GoogleFonts.cairo(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 350,
              child: ListView.builder(
                  itemCount: program.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: SizedBox(
                          width: 250,
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                  image: AssetImage(
                                      'images/${programList[index].image}'),
                                  width: 80),
                              Text(
                                programList[index].title,
                                style: GoogleFonts.lobster(
                                  fontSize: 30,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15),
                                child: Wrap(children: [
                                  Text(
                                    programList[index].details,
                                    maxLines: 2, //2 or more line you want
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ]),
                              ),
                              MaterialButton(
                                minWidth: 120,
                                color: Colors.orange,
                                onPressed: () {
                                  //

                                  //
                                  showDialog(
                                      context: (context),
                                      builder: (context) => AlertDialog(
                                        // titlePadding: const EdgeInsets.symmetric(horizontal: 0),
                                        elevation: 10,

                                        content: Column(
                                          mainAxisSize:
                                          MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(30.0),
                                              child: Image(
                                                  image: AssetImage(
                                                      'images/${programList[index].image}'),
                                                  width: 160),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 20),
                                              child: Text(
                                                programList[index].title,
                                                style:
                                                GoogleFonts.lobster(
                                                  fontSize: 30,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 15),
                                              child: Wrap(children: [
                                                Text(
                                                  programList[index]
                                                      .details,
                                                  maxLines:
                                                  2, //2 or more line you want
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                )
                                              ]),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            color: Colors.green,
                                            child: const Text('Ok'),
                                          )
                                        ],
                                      ));
                                },
                                child: const Text(
                                  'Read more',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
            //about me
            Container(
              width: double.infinity,
              color: Colors.grey.shade200,
              height: 370,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Card(
                    elevation: 10,
                    child: Image(
                      image: AssetImage(
                        'images/me.png',
                      ),
                      width: 280,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'About Me',
                        style: GoogleFonts.cairo(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            'Abo Alhaytham',
                            style: GoogleFonts.cairo(
                                color: Colors.orange,
                                fontSize: 45,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '.',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.black,
                                fontSize: 60,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
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
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              launchUrl(
                                  Uri.parse(
                                      'https://wa.me/+96599245950?text=Hi'),
                                  mode: LaunchMode.externalApplication);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.green.shade200,
                            ),
                            child: Text(
                              'WhatsApp',
                              style: GoogleFonts.lora(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.play_circle,
                                    color: Colors.orange,
                                    size: 35,
                                  ),
                                  onPressed: () {
                                    launchUrl(Uri.parse(
                                        'https://www.youtube.com/channel/UChA_rMzP10iZg5kSizEM8Rg'));
                                  },
                                ),
                                Text('See My Channel',
                                    style: GoogleFonts.lobster(
                                        color: Colors.grey.shade600))
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
