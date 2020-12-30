import 'package:flutter/material.dart';
import 'package:hearthealthy/widget/constants.dart';
import 'package:hearthealthy/models/news.dart';
import 'package:hearthealthy/pages/education/read_news_view.dart';
import 'package:hearthealthy/widget/primary_card.dart';
import 'package:hearthealthy/bloc.navigation_bloc/navigation_bloc.dart';

class PolaHidupView extends StatefulWidget with NavigationStates{
  @override
  _PolaHidupState createState() => _PolaHidupState();
}

class _PolaHidupState extends State<PolaHidupView> {
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
                    "POLA HIDUP SEHAT",
                    // textAlign: TextAlign.end,
                    style: kNonActiveTabStyle.copyWith(color: Color(0xffff5e56), fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
        ),
        body: Container(
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 19.0),
                  child: Text("MAKANAN BAIK",
                      style: kNonActiveTabStyle.copyWith(color: Color(0xffff5e56))),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                height: 300.0,
                padding: EdgeInsets.only(left: 18.0),
                child: ListView.builder(
                  itemCount: makanBaikList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var news = makanBaikList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReadNewsView(news: news),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 12.0),
                        child: PrimaryCard(news: news),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 25.0),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 19.0),
                  child: Text("MAKANAN BURUK",
                      style: kNonActiveTabStyle.copyWith(color: Color(0xffff5e56))),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                height: 300.0,
                padding: EdgeInsets.only(left: 18.0),
                child: ListView.builder(
                  itemCount: makanBurukList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var recent = makanBurukList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReadNewsView(news: recent),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 12.0),
                        child: PrimaryCard(news: recent),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
