

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
