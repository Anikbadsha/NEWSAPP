import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

myStyle(
  double fs,
  Color clr, [
  FontWeight? fw,
  FontStyle? fst,
  double? ls,
]) {
  return GoogleFonts.roboto(
    fontSize: fs,
    fontWeight: fw,
    color: clr,
    fontStyle: fst,
    letterSpacing: ls,
  );
}
