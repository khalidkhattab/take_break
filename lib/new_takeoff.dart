import 'package:first_app/model.dart';
import 'package:first_app/pdf_generate.dart';
import 'package:first_app/pdf_test.dart';
import 'package:first_app/poppages/add_new_break.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'bloc/cubit.dart';
import 'bloc/cubit_status.dart';

class NewTeakOff extends StatelessWidget {
  const NewTeakOff({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeakBreakCubit, TakeBreakStatus>(
        builder: (BuildContext context, state) {
          final cubit = TeakBreakCubit.get(context);

          //Text Form for Adding Teacher

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
                      ? const LoadingIndicator(
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
                        cubit.getDepart();
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
                          //cubit.pickImage();
                          // PdfServices().printMyPdf(cubit);
                          generateInvoice();
                        },
                        icon: const Icon(
                          Icons.camera,
                          color: Colors.green,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          cubit
                              .getEmployeeBreak('283021205454')
                              .then((value) {});
                        },
                        icon: const Icon(
                          Icons.timer,
                          color: Colors.red,
                        )),
                  )
                ]),
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
                                                menuBar[index]['screen']);
                                      },
                                      child: Container(
                                        width: 150,
                                        alignment: AlignmentDirectional.center,
                                        child: Text(
                                          menuBar[index]['title'],
                                          style: const TextStyle(fontSize: 22),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'بيانات المعلمين',
                                style: GoogleFonts.cairo(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )),
                          DropdownMenu<String>(
                            width: 250,
                            hintText: 'ادخل القسم',
                            dropdownMenuEntries: cubit.department
                                .map<DropdownMenuEntry<String>>((String dep) {
                              return DropdownMenuEntry<String>(
                                  value: dep,
                                  label: dep,
                                  leadingIcon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.deepOrange,
                                  ));
                            }).toList(),
                            onSelected: (val) {
                              cubit.getDepartmentTeacher(val!);
                            },
                          )
                        ],
                      ),
                    ),
                    if (cubit.departmentTeacher.isNotEmpty)
                      Container(
                        alignment: Alignment.center,
                        height: 350,
                        child: ListView.builder(
                            itemCount:
                                cubit.departmentTeacher.length, //program.length
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
                                                (state
                                                        is GetTeacherDataLoadingState)
                                                    ? const CircularProgressIndicator(
                                                        color:
                                                            Colors.deepOrange,
                                                      )
                                                    : (cubit.departmentTeacher[
                                                                    index]
                                                                ['image'] ==
                                                            null)
                                                        ? const Text(
                                                            'لايوجد صورة للموظف')
                                                        : Image.network(
                                                            cubit.departmentTeacher[
                                                                index]['image'],
                                                            width: 120,
                                                            scale: 1,
                                                          ),

                                                Text(
                                                  cubit.departmentTeacher[index]
                                                      ['name'],
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                // Padding(
                                                //   padding: const EdgeInsets
                                                //       .symmetric(
                                                //       horizontal: 15),
                                                //   child: Wrap(children: [
                                                //     Text(
                                                //       cubit.departmentTeacher[index]
                                                //           ['dep'],
                                                //       maxLines:
                                                //           2, //2 or more line you want
                                                //       overflow:
                                                //           TextOverflow.ellipsis,
                                                //     )
                                                //   ]),
                                                // ),
                                                Container(
                                                  color:
                                                      Colors.blueGrey.shade200,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            showDialog(
                                                                context:
                                                                    (context),
                                                                builder:
                                                                    (context) =>
                                                                        Directionality(
                                                                          textDirection:
                                                                              TextDirection.rtl,
                                                                          child:
                                                                              AlertDialog(
                                                                            // titlePadding: const EdgeInsets.symmetric(horizontal: 0),
                                                                            elevation:
                                                                                10,

                                                                            content:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.all(30.0),
                                                                                  child: Image.network(cubit.departmentTeacher[index]['image'], width: 200,),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                                                                  child: Text(
                                                                                    cubit.departmentTeacher[index]['name'],
                                                                                    style: const TextStyle(
                                                                                      fontSize: 25,
                                                                                      color: Colors.grey,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                                                                  child: Row(children: [
                                                                                    const Text('القسم : '),
                                                                                    Text(
                                                                                      cubit.departmentTeacher[index]['dep'],
                                                                                      maxLines: 2, //2 or more line you want
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                    )
                                                                                  ]),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                                                                  child: Row(children: [
                                                                                    const Text('الرقم المدني : '),
                                                                                    Text(
                                                                                      cubit.departmentTeacher[index]['cid'],
                                                                                      maxLines: 2, //2 or more line you want
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                    )
                                                                                  ]),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                                                                  child: Row(children: [
                                                                                    const Text('رقم الملف : '),
                                                                                    Text(
                                                                                      cubit.departmentTeacher[index]['file_num'],
                                                                                      maxLines: 2, //2 or more line you want
                                                                                      overflow: TextOverflow.ellipsis,
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
                                                                                child: const Text('اغلاق'),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ));
                                                          },
                                                          icon: const Icon(
                                                              Icons
                                                                  .info_outline,
                                                              color:
                                                                  Colors.yellow,
                                                              size: 30)),
                                                      IconButton(
                                                          onPressed: () {
                                                            PdfService()
                                                                .printCustomersPdf(
                                                                    cubit);
                                                          },
                                                          icon: const Icon(
                                                              Icons.print,
                                                              color:
                                                                  Colors.white,
                                                              size: 30)),
                                                      IconButton(
                                                          onPressed: () {
                                                            cubit.getEmployeeBreak(
                                                                cubit.departmentTeacher[
                                                                        index]
                                                                    ['cid']);
                                                          },
                                                          icon: const Icon(
                                                            Icons
                                                                .search_rounded,
                                                            color: Colors
                                                                .deepOrange,
                                                            size: 30,
                                                          )),
                                                      IconButton(
                                                          onPressed: () {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) =>
                                                                        AddNewBreak(
                                                                          cid: cubit.departmentTeacher[index]
                                                                              [
                                                                              'cid'],
                                                                          index:
                                                                              index,
                                                                        ));
                                                          },
                                                          icon: const Icon(
                                                              Icons.add,
                                                              color: Colors
                                                                  .indigoAccent,
                                                              size: 30))
                                                    ],
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
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              ' اذونات موظف',
                              style: GoogleFonts.cairo(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            (state is GetTeacherBreakLoadingState)
                                ? const SizedBox(
                                    height: 50,
                                    child: LoadingIndicator(
                                      indicatorType: Indicator.lineScale,
                                      colors: [Colors.white],

                                      /// Optional, The color collections
                                      strokeWidth: 2,

                                      /// Optional, The stroke of the line, only applicable to widget which contains line
                                    ),
                                  )
                                : const Text(''),
                          ],
                        ),
                      ),
                    ),
                    (cubit.employeeBreak.isNotEmpty)
                        ? Center(
                            child: SizedBox(
                              height: 360,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.center,
                                      height: 350,
                                      child: ListView.builder(
                                          itemCount: cubit.employeeBreak.length,
                                          physics: const ScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) =>
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30,
                                                        vertical: 30),
                                                child: Card(
                                                  elevation: 10,
                                                  // color: projectList[index].color,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 15),
                                                    child: Stack(
                                                      children: [
                                                        SizedBox(
                                                          width: 250,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              const Image(
                                                                  image: AssetImage(
                                                                      'images/me2.png'),
                                                                  width: 80),
                                                              Text(
                                                                cubit.employeeBreak[
                                                                        index]
                                                                    ['date'],
                                                                style:
                                                                    GoogleFonts
                                                                        .lobster(
                                                                  fontSize: 30,
                                                                  color: Colors
                                                                      .black,
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
                                                                        cubit.employeeBreak[index]
                                                                            [
                                                                            'leaveTime'],
                                                                        maxLines:
                                                                            2, //2 or more line you want
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      )
                                                                    ]),
                                                              ),
                                                              MaterialButton(
                                                                minWidth: 120,
                                                                color: Colors
                                                                    .orange,
                                                                onPressed: () {
                                                                  //

                                                                  //
                                                                  showDialog(
                                                                      context:
                                                                          (context),
                                                                      builder:
                                                                          (context) =>
                                                                              AlertDialog(
                                                                                // titlePadding: const EdgeInsets.symmetric(horizontal: 0),
                                                                                elevation: 10,

                                                                                content: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    const Padding(
                                                                                      padding: EdgeInsets.all(30.0),
                                                                                      child: Image(image: AssetImage('images/python.png'), width: 160),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                                                                      child: Text(
                                                                                        cubit.employeeBreak[index]['name'],
                                                                                        style: GoogleFonts.lobster(
                                                                                          fontSize: 30,
                                                                                          color: Colors.grey,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                                                                      child: Wrap(children: [
                                                                                        Text(
                                                                                          cubit.employeeBreak[index]['dep'],
                                                                                          maxLines: 2, //2 or more line you want
                                                                                          overflow: TextOverflow.ellipsis,
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
                                                                child:
                                                                    const Text(
                                                                  'Read more',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              cubit.deleteEmployeeBreak(
                                                                  cubit.employeeBreak[
                                                                          index]
                                                                      ['cid'],
                                                                  cubit.employeeBreak[
                                                                          index]
                                                                      ['doc']);
                                                            },
                                                            icon: (state
                                                                    is DeleteTeacherBreakLoadingState)
                                                                ? const CircularProgressIndicator()
                                                                : const Icon(
                                                                    Icons
                                                                        .delete,
                                                                    color: Colors
                                                                        .red,
                                                                  ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ))),
                                  Padding(
                                    //الاذونات
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 30),
                                    child: Card(
                                      elevation: 10,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 250,
                                        height: 200,
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddNewBreak(
                                                            cid: cubit
                                                                    .employeeBreak[
                                                                0]['cid'],
                                                            index: 0,
                                                          ))).then((val) {
                                                cubit.getEmployeeBreak(cubit
                                                    .employeeBreak[0]['cid']);
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              size: 40,
                                              color: Colors.orange,
                                            )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : const Text(
                            'لايوجد بيانات للعرض',
                            style: TextStyle(fontSize: 30),
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
