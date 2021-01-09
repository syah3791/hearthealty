import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hearthealthy/pages/intro/signupPage.dart';
import 'package:hearthealthy/main.dart';
import 'package:hearthealthy/service/auth_service.dart';
import 'package:hearthealthy/widget/title.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  TextEditingController _emailController;
  TextEditingController _passwordController;
  var _input;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
    _input = [_emailController,_passwordController];
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, int counter, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              obscureText: isPassword,
              controller: _input[counter],
              decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(),
                  labelText: title,
                  hintText: title,
              ))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
        onTap: () async {
          if (_input[0].text.isEmpty ||
              _input[1].text.isEmpty) {
            _scaffoldState.currentState.showSnackBar(SnackBar(
              content: Text("Email and password cannot be empty"),
            ));
            return;
          }
          try {
            final user = await AuthHelper.signInWithEmail(
                email: _input[0].text,
                password: _input[1].text);
            if (user == 'Signed in') {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            }
            else {
              _scaffoldState.currentState.showSnackBar(SnackBar(
                content: Text(user),
              ));
            }
          } catch (e) {
            print(e);
          }
        },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
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
            color: Colors.blue),
        child: Text(
          'MASUK',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      )
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _googleButton() {
    return InkWell(
        onTap: () async {
      try {
        await AuthHelper.signInWithGoogle();
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
      } catch (e) {
        print(e);
      }
    },
      child: Container(
        margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
        child: new RaisedButton(
            padding: EdgeInsets.all(1.0),
            color: const Color(0xff4285F4),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/google-icon.svg',
                    height: 18.0,
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: new Text(
                      "Masuk menggunakan Google",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ],
            )),
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xffff5e56),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email id", 0),
        _entryField("Password", 1, isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldState,
        backgroundColor: Color(0xfffffff5),
        body: Container(
      height: height,
            child: Stack(
              children: <Widget>[
                // Positioned(
                //     top: -height * .15,
                //     right: -MediaQuery.of(context).size.width * .4,
                //     child: BezierContainer()),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 50),
                        TitleName(),
                        SizedBox(height: 30),
                        Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Image.asset("assets/images/login.jpg", fit: BoxFit.cover,),
                          margin: EdgeInsets.all(10),

                        ),
                        _emailPasswordWidget(),
                        SizedBox(height: 20),
                        _submitButton(),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.centerRight,
                          child: Text('Forgot Password ?',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                        ),
                        _divider(),
                        _googleButton(),
                        _createAccountLabel(),
                      ],
                    ),
                  ),
                ),
                Positioned(top: 40, left: 0, child: _backButton()),
              ],
            ),
    ));
  }
}
