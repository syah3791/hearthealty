import 'package:flutter/material.dart';
import 'package:hearthealthy/widget/constants.dart';
import 'package:hearthealthy/models/news.dart';
import 'package:hearthealthy/pages/education/read_news_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hearthealthy/bloc.navigation_bloc/navigation_bloc.dart';

class OlahragaView extends StatefulWidget with NavigationStates{
  @override
  _OlahragaState createState() => _OlahragaState();
}

class _OlahragaState extends State<OlahragaView> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    final double widthScreen = mediaQueryData.size.width;
    final double heightScreen = mediaQueryData.size.height;
    return Scaffold(
        backgroundColor: Color(0xffdfd7ca),
        body: new Stack(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(image: new AssetImage("assets/images/olahraga.jpg", ), fit: BoxFit.scaleDown,),
                ),
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
                              "Olahraga",
                              style: kNonActiveTabStyle.copyWith(color: Colors.red,fontWeight: FontWeight.bold),
                            )),
                        StaggeredGridView.countBuilder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 2.0,
                          crossAxisSpacing: 4.0,
                          itemCount: olahragaList.length,
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
                                            builder: (context) => ReadNewsView(news: olahragaList[index]),
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
                                                      olahragaList[index].title,
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
                          new StaggeredTile.count(index == olahragaList.length-1 && olahragaList.length.isOdd ? 2 : 1, 1),
                        )
                      ]
                  )))
            ]
        )
    );
  }
}
