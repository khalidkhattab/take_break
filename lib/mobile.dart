import 'package:first_app/component.dart';
import 'package:first_app/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MyMobile extends StatelessWidget {
  const MyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.of(context).size.width;
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
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {},
              // style: ElevatedButton.styleFrom(
              //   shape: const StadiumBorder(),
              //   backgroundColor: Colors.green,
              // ),
              icon:const Icon(Icons.phone, size: 20,color:Colors.orange ,)
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.grey.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hi! i Am ',
                        style: GoogleFonts.cairo(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            'Khalid Khattab',
                            style: GoogleFonts.cairo(
                                color: Colors.orange,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '.',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.black,
                                fontSize: 45,
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
                        maxLines: 2,
                        'More than 14 years of experience in teaching computer science. ',
                        style: GoogleFonts.cairo(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('images/me2.png'),
                    )),
                  ),
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
                            fontSize: 25,
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
                    'Educational and programming services.',
                    style: GoogleFonts.cairo(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
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
                            horizontal: 15, vertical: 30),
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
                                                      padding:
                                                          const EdgeInsets.all(
                                                              30.0),
                                                      child: Image(
                                                          image: AssetImage(
                                                              'images/${programList[index].image}'),
                                                          width: 160),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 20),
                                                      child: Text(
                                                        programList[index]
                                                            .title,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Card(
                    elevation: 10,
                    child: Image(
                      image: AssetImage(
                        'images/me.png',
                      ),
                      width: 300,
                    ),
                  ),
                 const  SizedBox(height: 40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'About Me',
                        style: GoogleFonts.cairo(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            'Abo Alhaytham',
                            style: GoogleFonts.cairo(
                                color: Colors.orange,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '.',
                            style: GoogleFonts.aBeeZee(
                                color: Colors.black,
                                fontSize: 40,
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
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Column(
                        children: [
                          InfoRow(
                              icon: Icons.person,
                              title: 'Name',
                              info: 'Khaled Khattab'),
                          InfoRow(
                              icon: Icons.phone,
                              title: 'Phone',
                              info: '+965 99245950'),
                          InfoRow(
                              icon: Icons.email,
                              title: 'Email',
                              info: 'Mrhasob@gmail.com'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Recent Projects',
                      style: GoogleFonts.cairo(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),

                    Text(

                      'My latest projects by Flutter ',
                      style: GoogleFonts.cairo(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 350,
              child: ListView.builder(
                  itemCount: projectList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 30),
                        child: Card(
                          color: projectList[index].color,
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
                                          'images/${projectList[index].image}'),
                                      width: 80),
                                  Text(
                                    projectList[index].title,
                                    style: GoogleFonts.lobster(
                                      fontSize: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Wrap(children: [
                                      Text(
                                        projectList[index].details,
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
                                                      padding:
                                                          const EdgeInsets.all(
                                                              30.0),
                                                      child: Image(
                                                          image: AssetImage(
                                                              'images/${projectList[index].image}'),
                                                          width: 160),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 20),
                                                      child: Text(
                                                        projectList[index]
                                                            .title,
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
                                                          projectList[index]
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                height: 370,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 10,
                      right: 10,
                      child: Container(
                        width: currentWidth - 50,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          color: Colors.grey.shade200,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'contact Me',
                              style: GoogleFonts.cairo(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('Got an idea? Lets Talk!',
                                style: GoogleFonts.cairo(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.email,
                                  size: 30,
                                  color: Colors.orange,
                                ),
                                Text('Mrhasob@gmail.com',
                                    style: GoogleFonts.cairo(
                                        color: Colors.orange,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                   const Positioned(
                        top: -15,
                        child: Image(
                          image: AssetImage('images/idie.png'),
                          width: 200,
                        ))
                  ],
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  'design by: Khaled Khattab 2024',
                  style: GoogleFonts.lobster(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
