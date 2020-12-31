import 'package:flutter/material.dart';
import 'package:hearthealthy/widget/constants.dart';
import 'package:hearthealthy/models/news.dart';
import 'package:hearthealthy/pages/education/read_news_view.dart';
import 'package:hearthealthy/widget/primary_card.dart';
import 'package:hearthealthy/widget/secondary_card.dart';
import 'package:hearthealthy/bloc.navigation_bloc/navigation_bloc.dart';

class HomeView extends StatefulWidget with NavigationStates{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
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
                  "Beranda Jantung Sehat",
                  // textAlign: TextAlign.end,
                  style: kNonActiveTabStyle.copyWith(color: Color(0xffff5e56),fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: 300.0,
                padding: EdgeInsets.only(left: 18.0),
                child: ListView.builder(
                  itemCount: beritaList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var news = beritaList[index];
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
                  child: Text("BACAAN LAIN",
                      style: kNonActiveTabStyle.copyWith(color: Color(0xffff5e56))),
                ),
              ),
              ListView.builder(
                itemCount: randomList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  var random = randomList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadNewsView(news: random),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 135.0,
                      margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                      child: SecondaryCard(news: random),
                    ),
                  );
                },
              )
            ],
          ),
        )
    );
  }
}
