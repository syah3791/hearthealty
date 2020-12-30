import 'package:flutter/material.dart';
import 'package:hearthealthy/widget/constants.dart';
import 'package:hearthealthy/models/news.dart';
import 'package:hearthealthy/pages/education/read_news_view.dart';
import 'package:hearthealthy/widget/secondary_card.dart';
import 'package:hearthealthy/widget/primary_card.dart';
import 'package:hearthealthy/bloc.navigation_bloc/navigation_bloc.dart';

class OlahragaView extends StatefulWidget with NavigationStates{
  @override
  _OlahragaState createState() => _OlahragaState();
}

class _OlahragaState extends State<OlahragaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white54,
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
          child: Column(
            children: [
              SizedBox(height: 75.0),
              Center(
                child: Text(
                  "Olahraga",
                  style: kNonActiveTabStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        // body: ListView.builder(
        //   itemCount: recentList.length,
        //   scrollDirection: Axis.vertical,
        //   physics: BouncingScrollPhysics(),
        //   shrinkWrap: true,
        //   itemBuilder: (context, index) {
        //     var recent = recentList[index];
        //
        //     return InkWell(
        //       onTap: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => ReadNewsView(news: recent),
        //           ),
        //         );
        //       },
        //       child: Container(
        //         width: double.infinity,
        //         height: 135.0,
        //         margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        //         child: SecondaryCard(news: recent),
        //       ),
        //     );
        //   },
        // )
        body: ListView.builder(
          itemCount: olahragaList.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            var trending = olahragaList[index];

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReadNewsView(news: trending),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 300.0,
                margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                child: PrimaryCard(news: trending),
              ),
            );
          },
        )
    );
  }
}
