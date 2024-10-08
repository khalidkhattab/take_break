import 'dart:convert';
import 'dart:html';
import 'dart:ui';

import 'package:first_app/bloc/cubit.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart';



class PdfService {
  Future<void> printCustomersPdf(TeakBreakCubit cubit) async {


    //Create a new PDF document
    PdfDocument document = PdfDocument();
    // PdfFont arFont =  (GoogleFonts.cairo()) as PdfFont;
    PdfGrid grid = PdfGrid();
    //Define number of columns in table
    grid.columns.add(count: 5);
    //Add header to the grid
    grid.headers.add(1);
    //Add the rows to the grid
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = "date";
    header.cells[1].value = "leave time";
    header.cells[2].value = "back time";
    header.cells[3].value = "dep";
    header.cells[4].value = "note";
    //Add header style
    header.style = PdfGridCellStyle(
      backgroundBrush: PdfBrushes.lightGray,
      textBrush: PdfBrushes.black,
      font: PdfStandardFont(PdfFontFamily.timesRoman, 12),
    );

    //Add rows to grid
    for (final currentBreak in cubit.employeeBreak) {
      PdfGridRow row = grid.rows.add();
      row.cells[0].value = currentBreak['date'];
      row.cells[1].value = currentBreak['cid'];
      row.cells[2].value = currentBreak['returnTime'];
      row.cells[3].value = currentBreak['leaveTime'];
      row.cells[4].value = "";
    }
    //Add rows style
    grid.style = PdfGridStyle(
      cellPadding: PdfPaddings(left: 10, right: 3, top: 4, bottom: 5),
      backgroundBrush: PdfBrushes.white,
      textBrush: PdfBrushes.black,
      font: PdfStandardFont(PdfFontFamily.helvetica, 12)
    );

    //PdfStandardFont(PdfFontFamily.helvetica, 12)
    //File('Arial.ttf').readAsBytesSync(), 14

    //Draw the grid
    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));
    List<int> bytes = await document.save();

    //Download document
    AnchorElement(
        href:
        "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", "${cubit.employeeBreak[0]['cid']}.pdf")
      ..click();

    //Dispose the document
    document.dispose();
  }
}

