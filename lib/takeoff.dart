import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/component.dart';
import 'package:first_app/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'bloc/cubit.dart';
import 'bloc/cubit_status.dart';

class TakeOff extends StatelessWidget {
  const TakeOff({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeakBreakCubit, TakeBreakStatus>(
        builder: (BuildContext context, state) {
          final cubit = TeakBreakCubit.get(context);

          //Text Form for Adding Teacher
          TextEditingController teacherNameController = TextEditingController();
          TextEditingController teacherTitleController = TextEditingController();
          late TextEditingController teacherCidController = TextEditingController();
          TextEditingController teacherFileNumberController = TextEditingController();
          TextEditingController teacherDepartController = TextEditingController();
          TextEditingController teacherHairDateController = TextEditingController();
          TextEditingController teacherNesabController = TextEditingController();


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
                            style: GoogleFonts.lora(
                                fontSize: 35, color: Colors.orange),
                          ),
                          Text(
                            ':Hasob',
                            style: GoogleFonts.lora(
                                fontSize: 20, color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                (state is GetTeacherDataLoadingState)
                    ?
                    // const CircularProgressIndicator(
                    //
                    //   color: Colors.deepOrange,
                    //
                    // )
                    const LoadingIndicator(
                        indicatorType: Indicator.orbit,
                        colors: [Colors.deepOrange],

                        /// Optional, The color collections
                        strokeWidth: 1,

                        /// Optional, The stroke of the line, only applicable to widget which contains line
                        // backgroundColor: Colors.black,      /// Optional, Background of the widget
                        // pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
                      )
                    : const Text(''),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      //new
                      FirebaseFirestore.instance
                          .collection('dep')
                          .doc('1000')
                          .collection('teachers')
                          .get()
                          .then((value) {
                        all_teacher = [];
                        for (var action in value.docs) {
                          // print(action.data());
                          all_teacher.add(action.data());
                          //print(all_teacher);
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      'test2',
                      style:
                          GoogleFonts.lora(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        // cubit.addNewTeacher(
                        //     cid: '212222882',
                        //     fileNum: '8888',
                        //     name: 'Haytham',
                        //     nesab: 4);
                      },
                      icon: const Icon(
                        Icons.timer,
                        color: Colors.red,
                      )),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      height: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'نظام مراقبة الدوام',
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
                                    'الاستئذان',
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
                                'ادخال وتنظيم ومراقبة الاستئذان للموظفين ',
                                style: GoogleFonts.cairo(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ' خلال اوقات العمل  ',
                                style: GoogleFonts.cairo(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              // const SizedBox(
                              //   height: 15,
                              // ),
                              // Row(
                              //   children: [
                              //     ElevatedButton(
                              //       onPressed: () {
                              //         launchUrl(
                              //             Uri.parse(
                              //                 'https://wa.me/+96599245950?text=Hi'),
                              //             mode: LaunchMode.externalApplication);
                              //       },
                              //       style: ElevatedButton.styleFrom(
                              //         shape: const StadiumBorder(),
                              //         backgroundColor: Colors.green.shade300,
                              //       ),
                              //       child: Text(
                              //         'WhatsApp',
                              //         style: GoogleFonts.lora(
                              //             fontSize: 15, color: Colors.white),
                              //       ),
                              //     ),
                              //     const SizedBox(
                              //       width: 20,
                              //     ),
                              //     SizedBox(
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //         children: [
                              //           IconButton(
                              //             icon: const Icon(
                              //               Icons.play_circle,
                              //               color: Colors.red,
                              //               size: 35,
                              //             ),
                              //             onPressed: () {
                              //               launchUrl(Uri.parse(
                              //                   'https://www.youtube.com/channel/UChA_rMzP10iZg5kSizEM8Rg'));
                              //             },
                              //           ),
                              //           Text('See My Channel',
                              //               style: GoogleFonts.lobster(
                              //                   color: Colors.grey.shade600))
                              //         ],
                              //       ),
                              //     )
                              //   ],
                              // ),
                            ],
                          ),
                          Container(
                            height: 250,
                            width: 250,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'images/time.png',
                                    ),
                                    fit: BoxFit.contain)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      color: Colors.blueGrey.shade100,
                      child: ListView.builder(
                          itemCount: program.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 10,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                AlertDialog.adaptive(
                                                  title: const Center(
                                                      child:
                                                          Text('إضافة معلم')),
                                                  actions: [
                                                    MaterialButton(
                                                      color: Colors.green,
                                                      onPressed: (){
                                                        cubit.addNewTeacher(
                                                            cid: teacherCidController.text,
                                                            name:teacherNameController.text,
                                                            title: teacherTitleController.text,
                                                            fileNumber: teacherFileNumberController.text,
                                                            dep: teacherDepartController.text,
                                                            hairDate: teacherHairDateController.text,
                                                            nesab: teacherNesabController.text).then((value){
                                                              Navigator.pop(context);
                                                        });

                                                    },
                                                    child:const Text('حفظ', style: TextStyle( color: Colors.white, fontWeight:FontWeight.bold ),),
                                                    )
                                                  ],
                                                  actionsAlignment:
                                                      MainAxisAlignment.center,
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      TextFormAlarm(
                                                          controller:
                                                              teacherNameController,
                                                          label: 'الاسم',
                                                          password: false,
                                                          alert:
                                                              'يجب ادحال اسم المعلم'),
                                                      TextFormAlarm(
                                                          controller:
                                                          teacherTitleController,
                                                          label: 'المسمي',
                                                          password: false,
                                                          alert:
                                                          'يجب ادخال المسمى الوظيفي'),
                                                      TextFormAlarm(
                                                          controller:
                                                          teacherCidController,
                                                          label: 'الرقم المدني',
                                                          password: false,
                                                          alert:
                                                          'يجب ادحال الرقم المدني'),
                                                      TextFormAlarm(
                                                          controller:
                                                          teacherFileNumberController,
                                                          label: 'رقم الملف',
                                                          password: false,
                                                          alert:
                                                          'يجب ادحال رقم الملف '),
                                                      TextFormAlarm(
                                                          controller:
                                                          teacherDepartController,
                                                          label: 'القسم',
                                                          password: false,
                                                          alert:
                                                          'يجب ادحال القسم'),
                                                      TextFormAlarm(
                                                          controller:
                                                          teacherHairDateController,
                                                          label: 'تاريخ التعيين',
                                                          password: false,
                                                          alert:
                                                          'يجب ادحال تاريخ التعيين'),
                                                      TextFormAlarm(
                                                          controller:
                                                          teacherNesabController,
                                                          label: 'النصاب',
                                                          password: false,
                                                          alert:
                                                          'يجب ادحال النصاب'),
                                                    ],
                                                  ),
                                                ));
                                      },
                                      child: Container(
                                        width: 150,
                                        alignment: AlignmentDirectional.center,
                                        child: Text(
                                          program[index],
                                          style: const TextStyle(fontSize: 22),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                    ),
                    const Center(
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text('بيانات المعلمين',
                                  style: TextStyle(fontSize: 30)))
                        ],
                      ),
                    ),
                    if (cubit.allTeacher.isNotEmpty)
                      Container(
                        alignment: Alignment.center,
                        height: 350,
                        child: ListView.builder(
                            itemCount: cubit.allTeacher.length, //program.length
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 30),
                                  child: Card(
                                    elevation: 15,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            width: 250,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Image(
                                                    image: AssetImage(
                                                        'images/c++.png'),
                                                    width: 80),
                                                Text(
                                                  cubit.allTeacher[index]
                                                      ['name'],
                                                  style: GoogleFonts.lobster(
                                                    fontSize: 22,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15),
                                                  child: Wrap(children: [
                                                    Text(
                                                      cubit.allTeacher[index]
                                                          ['cid'],
                                                      maxLines:
                                                          2, //2 or more line you want
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                                        builder:
                                                            (context) =>
                                                                AlertDialog(
                                                                  // titlePadding: const EdgeInsets.symmetric(horizontal: 0),
                                                                  elevation: 10,

                                                                  content:
                                                                      Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      const Padding(
                                                                        padding:
                                                                            EdgeInsets.all(30.0),
                                                                        child: Image(
                                                                            image:
                                                                                AssetImage('images/c++.png'),
                                                                            width: 160),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            vertical:
                                                                                20),
                                                                        child:
                                                                            Text(
                                                                          cubit.allTeacher[index]
                                                                              [
                                                                              'name'],
                                                                          style:
                                                                              GoogleFonts.lobster(
                                                                            fontSize:
                                                                                30,
                                                                            color:
                                                                                Colors.grey,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                15),
                                                                        child: Wrap(
                                                                            children: [
                                                                              Text(
                                                                                cubit.allTeacher[index]['cid'],
                                                                                maxLines: 2, //2 or more line you want
                                                                                overflow: TextOverflow.ellipsis,
                                                                              )
                                                                            ]),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  actions: [
                                                                    MaterialButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      color: Colors
                                                                          .green,
                                                                      child: const Text(
                                                                          'Ok'),
                                                                    )
                                                                  ],
                                                                ));
                                                  },
                                                  child: const Text(
                                                    'Read more',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 1, horizontal: 5),
                                            child: IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (context) =>
                                                              AlertDialog(
                                                                elevation: 10,
                                                                actions: [
                                                                  Center(
                                                                    child:
                                                                        MaterialButton(
                                                                      onPressed:
                                                                          () {
                                                                        cubit
                                                                            .deleteTeacher(cubit.allTeacher[index]['cid'])
                                                                            .then((val) {
                                                                          Navigator.pop(
                                                                              context);
                                                                        });
                                                                      },
                                                                      child: const Text(
                                                                          "موافق"),
                                                                    ),
                                                                  )
                                                                ],
                                                                title:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomCenter,
                                                                  height: 150,
                                                                  child:
                                                                      const Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'انت على وشك حذف معلم',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                25),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      Text(
                                                                        ' هل تريد الاستمرار؟',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                25,
                                                                            color:
                                                                                Colors.red),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ));
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                      )
                    else
                      Column(
                        children: [
                          const SizedBox(
                            height: 150,
                            child: LoadingIndicator(
                              indicatorType: Indicator.orbit,
                              colors: [Colors.deepOrange],

                              /// Optional, The color collections
                              strokeWidth: 1,

                              /// Optional, The stroke of the line, only applicable to widget which contains line
                              // backgroundColor: Colors.black,      /// Optional, Background of the widget
                              // pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'لا يوجد بيانات للعرض',
                                style: GoogleFonts.cairo(
                                    color: Colors.orange,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
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
                                    horizontal: 30, vertical: 30),
                                child: Card(
                                  color: projectList[index].color,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: SizedBox(
                                      width: 250,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                maxLines:
                                                    2, //2 or more line you want
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
                                                  builder: (context) =>
                                                      AlertDialog(
                                                        // titlePadding: const EdgeInsets.symmetric(horizontal: 0),
                                                        elevation: 10,

                                                        content: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      30.0),
                                                              child: Image(
                                                                  image: AssetImage(
                                                                      'images/${projectList[index].image}'),
                                                                  width: 160),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          20),
                                                              child: Text(
                                                                projectList[
                                                                        index]
                                                                    .title,
                                                                style:
                                                                    GoogleFonts
                                                                        .lobster(
                                                                  fontSize: 30,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          15),
                                                              child: Wrap(
                                                                  children: [
                                                                    Text(
                                                                      projectList[
                                                                              index]
                                                                          .details,
                                                                      maxLines:
                                                                          2, //2 or more line you want
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    )
                                                                  ]),
                                                            ),
                                                          ],
                                                        ),
                                                        actions: [
                                                          MaterialButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            color: Colors.green,
                                                            child: const Text(
                                                                'Ok'),
                                                          )
                                                        ],
                                                      ));
                                            },
                                            child: const Text(
                                              'Read more',
                                              style: TextStyle(
                                                  color: Colors.white),
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
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: SizedBox(
                        height: 400,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 50,
                              right: 50,
                              child: Container(
                                width: MediaQuery.of(context).size.width - 200,
                                height: 250,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                  color: Colors.grey.shade200,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold)),
                                      Row(
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
                            ),
                            const Positioned(
                                right: 50,
                                bottom: -15,
                                child: Image(
                                  image: AssetImage('images/idie.png'),
                                  width: 450,
                                ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text(
                        'design by: Khaled Khattab 2024',
                        style: GoogleFonts.lobster(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, states) {});
  }
}
