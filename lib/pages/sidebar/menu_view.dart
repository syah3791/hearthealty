import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/cupertino.dart';

import 'package:hearthealthy/pages/education/home_view.dart';
import 'package:hearthealthy/pages/education/pola_hidup_view.dart';
import 'package:hearthealthy/pages/education/olahraga_view.dart';
import 'package:hearthealthy/pages/ppg/ppg_view.dart';
import 'package:hearthealthy/pages/ppg/setting_view.dart';
import 'package:hearthealthy/pages/ppg/lab_view.dart';
import 'package:hearthealthy/pages/ppg/periksa_view.dart';
import 'package:hearthealthy/main.dart';

import 'package:hearthealthy/service/auth_service.dart';
import 'package:hearthealthy/local_notify_manager.dart';


class MenuView extends StatefulWidget {
  bool isLogin;
  var user;
  MenuView({this.isLogin, this.user});
  @override
  _MenuViewState createState() => _MenuViewState();
}



class _MenuViewState extends State<MenuView> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _configureDidReceiveLocalNotificationSubject();
    _configureSelectNotificationSubject();
    localNotifyManager.scheduleDailyNotificationOf06();
    localNotifyManager.scheduleDailyNotificationOf12();
    localNotifyManager.scheduleDailyNotificationOf18();
    localNotifyManager.scheduleWeeklyMondayNotification();
  }

  void _configureDidReceiveLocalNotificationSubject() async {
    await localNotifyManager.configureLocalTimeZone();
    localNotifyManager.didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body)
              : null,
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                await Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        PolaHidupView(),
                  ),
                );
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
    });
  }

  void _configureSelectNotificationSubject() {
    localNotifyManager.selectNotificationSubject.stream.listen((String payload) async {
      await Navigator.push(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => PolaHidupView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _bottomNavView = [
      HomeView(),
      PolaHidupView(),
      OlahragaView(),
      LabView(parent:this),
      PeriksaView(parent:this),
      PPGView(parent:this),
      SettingView()
    ];
    return Scaffold(
      appBar: new AppBar(title: Text('Heart Healty')),
      body:  SafeArea(
        child: _bottomNavView.elementAt(_selectedIndex),
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(widget.user.displayName == null ? widget.user.email.split('@')[0]:widget.user.displayName),
                accountEmail: Text(widget.user.email, style: TextStyle(fontWeight: FontWeight.bold),),
                decoration: BoxDecoration(
                  color: Color(0xffff5e56),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                  Theme.of(context).platform == TargetPlatform.iOS
                      ? Colors.blue
                      : Colors.white,
                  child: Text('${widget.user.email[0].toUpperCase()}',style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Beranda'),
                onTap: () {
                  setState(() {_selectedIndex = 0;});
                  Navigator.pop(context);
                },
              ),
              ExpansionTile(
                title: Text("Pola Hidup Sehat",),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Pola Makan'),
                    onTap: () {
                      setState(() {_selectedIndex = 1;});
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.directions_run),
                    title: Text('Olahraga'),
                    onTap: () {
                      setState(() {_selectedIndex = 2;});
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Hasil Lab",),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.class__rounded),
                    title: Text('Hasil Lab'),
                    onTap: () {
                      setState(() {_selectedIndex = 3;});
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person_search),
                    title: Text('Pemeriksaan Hasil Lab'),
                    onTap: () {
                      setState(() {_selectedIndex = 4;});
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.thermostat_outlined),
                title: Text('Check Jantung'),
                onTap: () {
                  setState(() {_selectedIndex = 5;});
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Data Pasien'),
                onTap: () {
                  setState(() {_selectedIndex = 6;});
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Keluar'),
                onTap: () {
                  _onLogOut(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  _onLogOut(context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Peringatan"),
            content: Text("Apakah yakin mau keluar?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  localNotifyManager.cancelAllNotifications();
                  AuthHelper.logOut();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        }
    );
  }
  changeView(index) => setState(()=> _selectedIndex = index);
}