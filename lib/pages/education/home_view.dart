import 'package:flutter/material.dart';
import 'package:hearthealthy/widget/constants.dart';
import 'package:hearthealthy/models/news.dart';
import 'package:hearthealthy/pages/education/read_news_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeView extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    final double widthScreen = mediaQueryData.size.width;
    final double heightScreen = mediaQueryData.size.height;
    return Scaffold(
        backgroundColor: Color(0xffdfd7ca),
        body: new Stack(
          children: <Widget>[
            new Center(
              child:Container(
                height: heightScreen/2,
                width: widthScreen/2,
                decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("assets/images/heart_beating_0.gif", ), fit: BoxFit.scaleDown,),
                ),
              )
            ),
            new  Container(
              height: heightScreen,
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10,),
                        Center(
                            child:Text(
                              "Beranda Jantung Sehat",
                              style: kNonActiveTabStyle.copyWith(color: Colors.red,fontWeight: FontWeight.bold),
                            )),
                        StaggeredGridView.countBuilder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                          itemCount: beritaList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                                child: Container(
                                  padding:EdgeInsets.fromLTRB(15.0, 35.0, 10.0, 35.0),
                                  width: widthScreen/2,
                                  // height: widthScreen/4,
                                  child:RaisedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ReadNewsView(news: beritaList[index]),
                                          ),
                                        );
                                      },
                                      padding:EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6.0) ),
                                      color: Color(0xffddffff),
                                      child: Table(
                                          children: [
                                            TableRow(
                                                children: [
                                                  Text(
                                                    beritaList[index].title,
                                                    style: TextStyle(color: Colors.black)
                                                  ),
                                                ]
                                            )
                                          ]
                                      )
                                  ),
                                ));
                          },
                          staggeredTileBuilder: (int index) =>
                          new StaggeredTile.count(index == beritaList.length-1 && beritaList.length.isOdd ? 2 : 1, 1),
                        )
                ]
            )))
          ]
        )
    );
  }
}
