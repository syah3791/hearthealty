import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hearthealthy/widget/constants.dart';

class Periksa extends StatefulWidget{
  // Periksa({Key key}) : super(key: key);
  String name;
  double less;
  double greater;
  Periksa({this.name, this.less, this.greater});
  @override
  _PeriksaState createState() => _PeriksaState();
}

class _PeriksaState extends State<Periksa> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  double _nilai;
  @override
  void initState() {
    super.initState();
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
                    Center(child:Text('Pemeriksaan Hasil Lab',style: kNonActiveTabStyle.copyWith(color: Colors.red,fontWeight: FontWeight.bold),)),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => _nilai = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:widget.name,
                            hintText: widget.name,
                          ),
                          keyboardType: TextInputType.number,

                        )
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: paddingInput.copyWith(top:8.0, bottom:8.0),
                        decoration: BoxDecoration(
                          color:Colors.white,
                          border: Border(
                              top: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0
                              )
                          ),
                        ),
                        child: RaisedButton(
                          onPressed: (){
                            _onSubmit();

                          },
                          padding:paddingInput.copyWith(top:12.0, bottom:12.0),
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6.0) ),
                          color: Theme.of(context).primaryColor,
                          child: Center(
                            child: Text(
                              "Periksa",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                    ),
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

  Future<void> _onSubmit() async {
    var form = _formKey.currentState;
    bool success = true;
    if (form.validate()) {
      form.save();
      try{
        if(widget.less >= 0){
          if ( !(_nilai >= widget.less && _nilai < widget.greater)) success = false;
        }
      }catch(e){
        if (!(_nilai < widget.greater)) success = false;
      }
    _success(success);
    }

  }

  _success(isSuccess) async {
    String tinggi = _nilai > widget.greater+10 ? 'Nilai rujukan anda tinggi' : 'Nilai rujukan agak sedikit tinggi';
    isSuccess ?
    showDialog(
      // barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Peringatan"),
            content: Text('Hasil lab Normal!!\n Lanjutkan pola hidup sehat yang sesuai dan teratur'),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
    ) :
    showDialog(
      // barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Peringatan"),
            content: Text("$tinggi,\n segeralah konsultasi kedokter untuk \npemeriksaan lebih lanjut\ndan ubah pola hidup lebih teratur \ndengan istirahat yang cukup serta \nmakan – makanan yang bergizi "),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
    );
  }
}