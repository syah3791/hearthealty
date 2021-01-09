import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/cupertino.dart';

import 'package:hearthealthy/bloc.navigation_bloc/navigation_bloc.dart';
import '../sidebar/menu_item.dart';
import 'package:hearthealthy/local_notify_manager.dart';
import 'package:hearthealthy/main.dart';
import 'package:hearthealthy/service/auth_service.dart';
import 'package:hearthealthy/pages/ppg/ppg_view.dart';

class SideBar extends StatefulWidget {
  var user;
  SideBar({Key key, this.user}) : super(key: key);
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
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
                        MyApp(),
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
            builder: (BuildContext context) => MyApp()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  Future<void> _checkPendingNotificationRequests() async {
    var pendingNotificationRequests =
    await localNotifyManager.flutterLocalNotificationsPlugin.pendingNotificationRequests();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content:
        Text('${pendingNotificationRequests.length} pending notification '
            'requests'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 37,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Color(0xffff5e56),
                  child: Column(
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
                      Divider(
                        height: 30,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "Beranda",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomeScreenClickedEvent);
                        },
                      ),
                      ExpansionTile(
                        title: Text("Pola Hidup Sehat", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 21, color: Colors.white),),
                        children: <Widget>[
                          MenuItem(
                            icon: Icons.person,
                            title: "Pola Makan",
                            onTap: () {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.PolaHidupClickedEvent);
                            },
                          ),
                          MenuItem(
                            icon: Icons.directions_run,
                            title: "Olahraga",
                            onTap: () async {
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.OlahragaClickedEvent);
                            },
                          ),
                        ],
                      ),
                      MenuItem(
                        icon: Icons.camera_alt,
                        title: "PPG",
                        onTap: () async {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.PPGClickedEvent);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) {
                          //   return PPGView();
                          // }));
                        },
                      ),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.settings,
                        title: "Data Pasien",
                        onTap: () async {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.SettingClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.exit_to_app,
                        title: "Logout",
                        onTap: () async {
                          onIconPressed();
                          _onLogOut();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color(0xffff5e56),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  _onLogOut() async {
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
}



class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
