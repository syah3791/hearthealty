import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hearthealthy/bloc.navigation_bloc/navigation_bloc.dart';
import 'sidebar.dart';

class SideBarLayout extends StatefulWidget {
  var user;
  SideBarLayout({Key key, this.user}) : super(key: key);

  @override
  _SideBarLayoutState createState() => _SideBarLayoutState();
}

class _SideBarLayoutState extends State<SideBarLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("hearthealthy"),
      // ),
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar(user:widget.user),
          ],
        ),
      ),
    );
  }
}
