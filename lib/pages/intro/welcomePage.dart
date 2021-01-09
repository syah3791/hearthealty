import 'package:flutter/material.dart';
import 'package:hearthealthy/pages/intro/loginPage.dart';
import 'package:hearthealthy/pages/intro/signupPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hearthealthy/widget/title.dart';
import 'package:hearthealthy/local_notify_manager.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(right: 4.0, left: 5.0),
        padding: EdgeInsets.symmetric(vertical: 13,),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(80)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withAlpha(90),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.blue),
        child: Text(
          'MASUK',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(right: 5.0, left: 4.0),
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(80)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withAlpha(50),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.lightGreen),
        child: Text(
          'DAFTAR',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _label() {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          children: <Widget>[
            Text(
              'Quick login with Touch ID',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(
              height: 20,
            ),
            Icon(Icons.fingerprint, size: 90, color: Colors.white),
            SizedBox(
              height: 20,
            ),
            Text(
              'Touch ID',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffff5),
      body:SingleChildScrollView(
        child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                TitleName(),
                SizedBox(
                  height: 70,
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  child: Image.asset("assets/images/heart_beating_1.gif", fit: BoxFit.cover,),//height:300, width:231),
                    margin: EdgeInsets.all(10),

                ),
                SizedBox(
                  height: 70,
                ),
                Table(
                  children: [
                    TableRow(
                      children: [
                        _submitButton(),
                        _signUpButton(),
                      ]
                    )
                  ]
                ),
                SizedBox(
                  height: 20,
                ),
                // _label()
              ],
            ),
      ),
    );
  }
}
