import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
//firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//page
import 'package:hearthealthy/pages/intro/splashscreenPage.dart';
//service
import 'package:hearthealthy/service/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData && snapshot.data != null) {
            return SplashScreenPage(isLogin:true, user:snapshot.data);
          }
          return SplashScreenPage(isLogin:false);
        }
    )
    );
    // return MultiProvider(
    //     providers: [
    //       Provider<AuthenticationService>(
    //         create: (_) => AuthenticationService(FirebaseAuth.instance),
    //       ),
    //       StreamProvider(
    //         create: (context) => context.read<AuthenticationService>().authStateChanges,
    //       )
    //     ],
    //     child: MaterialApp(
    //       title: 'HeartHealthy',
    //       theme: ThemeData(
    //          primarySwatch: Colors.blue,
    //          textTheme:GoogleFonts.latoTextTheme(textTheme).copyWith(
    //            bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
    //          ),
    //       ),
    //       debugShowCheckedModeBanner: false,
    //       home: SplashScreenPage(),
    //     )
    // );
  }
}
