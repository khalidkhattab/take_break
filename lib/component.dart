

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/cubit.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key, required this.title, required this.info, required this.icon
  });
  final String title;
  final String info;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        SizedBox(
          width:150,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(icon),
              ),
              Text(title,

                  style: GoogleFonts.cairo(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  )),
            ],
          ),
        ),
        SizedBox(
          width:40,
          child: Text(':',

              style: GoogleFonts.cairo(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              )),
        ),
        SizedBox(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Text(info,
                  style: GoogleFonts.cairo(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  )),

            ],
          ),
        ),
      ],
    );
  }
}

class NewAlertDialog extends StatelessWidget {
  const NewAlertDialog({
    super.key,
    required this.cubit,
    required this.index,
  });

  final TeakBreakCubit cubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // titlePadding: const EdgeInsets.symmetric(horizontal: 0),
      elevation: 10,

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Image(image: AssetImage('images/c++.png'), width: 160),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              cubit.allTeacher[index]['name'],
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
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.green,
          child: const Text('Ok'),
        )
      ],
    );
  }
}




// const  String department="قسم الحاسوب";


class TextFormAlarm extends StatelessWidget {
  const TextFormAlarm({
    Key? key,
    required this.controller,
    required this.label,
    required this.password,
    required this.alert,
   required this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool password;
  final String alert;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Container(
          height: 60,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.teal)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return alert;
                  }
                  return null;
                },
                obscureText: password,
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon: icon,
                  label: Text(label),
                  labelStyle:const TextStyle(color: Colors.deepOrange),
                  alignLabelWithHint: true,
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  border: InputBorder.none,
                ),
              ),
            ),
          )),
    );
  }}