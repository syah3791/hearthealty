import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hearthealthy/widget/constants.dart';
import 'package:hearthealthy/pages/ppg/periksa.dart';

class PeriksaView extends StatefulWidget{
  // Periksa({Key key}) : super(key: key);
  var parent;
  PeriksaView({this.parent});
  @override
  _PeriksaViewState createState() => _PeriksaViewState();
}

class Pemeriksaans {
  final String name;
  final double less;
  final double greater;

  Pemeriksaans({
    this.name,
    this.less,
    this.greater
  });
}

class _PeriksaViewState extends State<PeriksaView> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<Pemeriksaans> pemeriksaanLakiList = List<Pemeriksaans>();
  List<Pemeriksaans> pemeriksaanPeremList = List<Pemeriksaans>();
  double Agg, Hei, Wei;
  String name;
  bool gender;
  @override
  void initState() {
    super.initState();
    gender = true;
    _onInit();
    pemeriksaanLakiList = [
      //Awal
      Pemeriksaans(name:'Eritrosit', less:4.5, greater:5.5),
      Pemeriksaans(name:'Hemoglobin', less:13, greater:16),
      Pemeriksaans(name:'Hematokrit', less:45, greater:55),
      //Hitung Jenis
      Pemeriksaans(name:'Basofil', less:0, greater:1),
      Pemeriksaans(name:'Eosinofil', less:1, greater:3),
      Pemeriksaans(name:'Batang', less:2, greater:6),
      Pemeriksaans(name:'Segmen', less:50, greater:70),
      Pemeriksaans(name:'Limfosit', less:20, greater:40),
      Pemeriksaans(name:'Monosit', less:2, greater:8),
      Pemeriksaans(name:'LED', greater:10),
      Pemeriksaans(name:'Leukosit', less:5, greater:10),
      Pemeriksaans(name:'MCH/HER', less:27, greater:31),
      Pemeriksaans(name:'MCHC/KHER', less:32, greater:36),
      Pemeriksaans(name:'MCV/VER', less:80, greater:96),
      Pemeriksaans(name:'Trombosit', less:150, greater:400),
      Pemeriksaans(name:'ALT (SGPT)', greater:30),
      Pemeriksaans(name:'AST (SGOT)', greater:25),
      Pemeriksaans(name:'Alkalin Fosfatase', less:15, greater:69),
      Pemeriksaans(name:'GGT (Gamma GT)', less:5, greater:38),
      Pemeriksaans(name:'Bilirubin Total', less:0.25, greater:1),
      Pemeriksaans(name:'Bilirubin Langsung', less:0, greater:0.25),
      Pemeriksaans(name:'Protein Total', less:61, greater:82),
      Pemeriksaans(name:'Albumin', less:37, greater:52),
      //Fungsi Ginjal
      Pemeriksaans(name:'Kreatinin', less:70, greater:160),
      Pemeriksaans(name:'Urea', less:8, greater:25),
      Pemeriksaans(name:'Natrium', less:135, greater:145),
      Pemeriksaans(name:'Klorid', less:94, greater:111),
      Pemeriksaans(name:'Kalium', less:3.5, greater:5),
      //Profil Lipid
      Pemeriksaans(name:'Kolesterol Total', less:150, greater:200),
      Pemeriksaans(name:'HDL', less:35, greater:55),
      Pemeriksaans(name:'Trigliserid', less:120, greater:190),
      //DLL
      Pemeriksaans(name:'Glukosa', less:70, greater:100),
      Pemeriksaans(name:'Amilase', less:30, greater:130),
      Pemeriksaans(name:'Asam Urat', less:3.4, greater:7),
    ];
    pemeriksaanPeremList = [
      //Awal
      Pemeriksaans(name:'Eritrosit', less:4, greater:5),
      Pemeriksaans(name:'Hemoglobin', less:12, greater:14),
      Pemeriksaans(name:'Hematokrit', less:40, greater:50),
      // Hitung jenis
      Pemeriksaans(name:'Basofil', less:0, greater:1),
      Pemeriksaans(name:'Eosinofil', less:1, greater:3),
      Pemeriksaans(name:'Batang', less:2, greater:6),
      Pemeriksaans(name:'Segmen', less:50, greater:70),
      Pemeriksaans(name:'Limfosit', less:20, greater:40),
      Pemeriksaans(name:'Monosit', less:2, greater:8),
      Pemeriksaans(name:'LED', greater:15),
      Pemeriksaans(name:'Leukosit', less:5, greater:10),
      Pemeriksaans(name:'MCH/HER', less:27, greater:31),
      Pemeriksaans(name:'MCHC/KHER', less:32, greater:36),
      Pemeriksaans(name:'MCV/VER', less:80, greater:96),
      Pemeriksaans(name:'Trombosit', less:150, greater:400),
      Pemeriksaans(name:'ALT (SGPT)', greater:23),
      Pemeriksaans(name:'AST (SGOT)', greater:21),
      Pemeriksaans(name:'Alkalin Fosfatase', less:15, greater:69),
      Pemeriksaans(name:'GGT (Gamma GT)', less:5, greater:38),
      Pemeriksaans(name:'Bilirubin Total', less:0.25, greater:1),
      Pemeriksaans(name:'Bilirubin Langsung', less:0, greater:0.25),
      Pemeriksaans(name:'Protein Total', less:61, greater:82),
      Pemeriksaans(name:'Albumin', less:37, greater:52),
      //Fungsi ginjal
      Pemeriksaans(name:'Kreatinin', less:60, greater:150),
      Pemeriksaans(name:'Urea', less:8, greater:25),
      Pemeriksaans(name:'Natrium', less:135, greater:145),
      Pemeriksaans(name:'Klorid', less:94, greater:111),
      Pemeriksaans(name:'Kalium', less:3.5, greater:5),
      //Profil Lipin
      Pemeriksaans(name:'Kolesterol Total', less:150, greater:200),
      Pemeriksaans(name:'HDL', less:45, greater:65),
      Pemeriksaans(name:'Trigliserid', less:120, greater:190),
      //Dll
      Pemeriksaans(name:'Glukosa', less:70, greater:100),
      Pemeriksaans(name:'Amilase', less:30, greater:130),
      Pemeriksaans(name:'Asam Urat', less:2.4, greater:5.7),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      backgroundColor: Color(0xffdfd7ca),
      body : Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Center(child:Text('Pemeriksaan Hasil Lab $name',style: kNonActiveTabStyle.copyWith(color: Colors.red,fontWeight: FontWeight.bold),)),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        var random = gender ? pemeriksaanLakiList[index] : pemeriksaanPeremList[index];
                        return _onKlik(random);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(child:Text('Hitung Jenis',style: kNonActiveTabStyle.copyWith(color: Colors.red, fontSize: 20),)),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemCount: 20,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        var random = gender ? pemeriksaanLakiList[index+3] : pemeriksaanPeremList[index+3];
                        return _onKlik(random);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(child:Text('Fungsi Ginjal',style: kNonActiveTabStyle.copyWith(color: Colors.red, fontSize: 20),)),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        var random = gender ? pemeriksaanLakiList[index+23] : pemeriksaanPeremList[index+3];
                        return _onKlik(random);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(child:Text('Profil Lipid',style: kNonActiveTabStyle.copyWith(color: Colors.red, fontSize: 20),)),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        var random = gender ? pemeriksaanLakiList[index+28] : pemeriksaanPeremList[index+3];
                        return _onKlik(random);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(child:Text('Dll',style: kNonActiveTabStyle.copyWith(color: Colors.red, fontSize: 20),)),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        var random = gender ? pemeriksaanLakiList[index+31] : pemeriksaanPeremList[index+3];
                        return _onKlik(random);
                      },
                    )
                  ],
                ),
              )
          )
      ),
    );
  }
  // Form _mainForm(BuildContext context) {
  //   print('sss'+name);
  //   return ;
  // }

  Widget _onKlik(item) {
    return Container(
      padding: EdgeInsets.all(12),
      child: RaisedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Periksa(name:item.name,less:item.less,greater:item.greater);
              }));
            },
            padding:EdgeInsets.all(12),
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6.0) ),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                item.name,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
      )
    );

  }

  _onInit() async {
    final SharedPreferences prefs = await _prefs;
    try{
      setState(() {
        Agg = double.parse(prefs.getString('agg'));
        Hei = double.parse(prefs.getString('hei'));
        Wei = double.parse(prefs.getString('wei'));
        name = prefs.getString('nama');
        gender = prefs.getBool('gen');
      });
    }catch(e){
      _onNullVar();
    }
  }

  _onNullVar() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Peringatan"),
            content: Text("Harap lengkapi data pribadi pasien."),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.pop(context);
                  widget.parent.changeView(6);
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context);
                  widget.parent.changeView(0);
                },
              )
            ],
          );
        }
    );
  }
}