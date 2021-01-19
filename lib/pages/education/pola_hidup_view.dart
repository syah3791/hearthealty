import 'package:flutter/material.dart';
import 'package:hearthealthy/widget/constants.dart';
import 'package:hearthealthy/models/news.dart';
import 'package:hearthealthy/pages/education/read_news_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PolaHidupView extends StatefulWidget{
  @override
  _PolaHidupState createState() => _PolaHidupState();
}

class _PolaHidupState extends State<PolaHidupView> {
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
                  image: new DecorationImage(image: new AssetImage("assets/images/pola_makan.jpg", ), fit: BoxFit.scaleDown,),
                ),
              ),
              new  Container(
                  height: heightScreen,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height:10),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Center(
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                                  padding:EdgeInsets.all(4),
                                  child:Text(
                                    "Makanan Baik",
                                    style: kNonActiveTabStyle.copyWith(color: Colors.red,fontWeight: FontWeight.bold),
                                  )
                              )
                            ),
                            Center(
                                child: Container(
                                    margin: EdgeInsets.fromLTRB(30.0, 10.0, 10.0, 10.0),
                                    padding:EdgeInsets.all(4),
                                    // color: Color(0xfffffff5),
                                    child:Text(
                                      "Makanan Buruk",
                                      style: kNonActiveTabStyle.copyWith(color: Colors.red,fontWeight: FontWeight.bold),
                                    )
                                )
                            )
                          ]
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width:widthScreen/2,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  // children: <Widget>[
                                    child:ListView.builder(
                                      itemCount: makanBaikList.length,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: ScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index) {
                                        return _tombol(makanBaikList[index]);
                                      },
                                    ),
                                  // ]
                              ),
                              Container(
                                width:widthScreen/2,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                // children: <Widget>[
                                child:ListView.builder(
                                  itemCount: makanBurukList.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return _tombol(makanBurukList[index]);
                                  },
                                ),
                                // ]
                              ),
                          ]
                        )
                      ],
                    )
                  )
              )
            ]
        )
    );
  }

  Widget _tombol(item){
    return Center(
        child: Container(
          margin : EdgeInsets.all(2),
          padding:EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 10.0),
          // height: widthScreen/4,
          child:RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReadNewsView(news: item),
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
                              item.title,
                              style: TextStyle(color: Colors.black)
                          ),
                        ]
                    )
                  ]
              )
          ),
        ));
  }
}
