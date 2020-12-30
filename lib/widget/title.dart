import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleName extends StatelessWidget {
  const TitleName({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'hearT',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffff5e56),
          ),
          children: [
            TextSpan(
              text: 'heal',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'Ty',
              style: TextStyle(color: Color(0xffff5e56), fontSize: 30),
            ),
          ]),
    );
  }
}