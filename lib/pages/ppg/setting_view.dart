import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hearthealthy/widget/constants.dart';

class SettingView extends StatefulWidget{
  // SettingView({Key key}) : super(key: key);
  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  String name;
  bool gen;
  String age;
  String height;
  String weight;
  @override
  void initState() {
    super.initState();
    _onInit();
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
                    Center(child:Text('Data Diri Pasien',style: kNonActiveTabStyle.copyWith(color: Colors.red,fontWeight: FontWeight.bold),)),
                    SizedBox(
                      height: 10,
                    ),
                    //////////////////////////////INPUT //////////////////
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: nameController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => name = val),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Nama',
                            hintText: 'Masukkan nama',
                          ),
                          textCapitalization: TextCapitalization.sentences,

                        )
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Jenis Kelamin',
                              ),
                              RadioListTile(
                                title: Text('Laki-laki'),
                                value: true,
                                dense:true,
                                groupValue: gen,
                                onChanged: (var newValue) {
                                  setState(() {
                                    gen = newValue;
                                  });
                                },
                              ),
                              Divider(thickness: 1.0),
                              RadioListTile(
                                title: Text('Perempuan'),
                                value: false,
                                dense:true,
                                groupValue: gen,
                                onChanged: (var newValue) {
                                  setState(() {
                                    gen = newValue;
                                  });
                                },
                              ),
                            ]
                        )
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: ageController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => age = val),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Umur',
                            hintText: 'Masukkan umur',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: heightController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => height = val),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Tinggi badan',
                            hintText: 'Masukkan tinggi badan',
                            suffixText: 'CM'
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: weightController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => weight = val),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Berat badan',
                            hintText: 'Masukkan berat badan',
                            suffixText:'Kg'
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    ////////////////////////////////////////////////////////////////////////
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
                              "Simpan",
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
///Keteki mengnekan tombol simpan
  Future<void> _onSubmit() async {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      final SharedPreferences prefs = await _prefs;
      await prefs.setString('nama', name);
      await prefs.setBool('gen', gen);
      await prefs.setString('agg', age);
      await prefs.setString('hei', height);
      await prefs.setString('wei', weight);
      _success();
    }

  }

  _success() async {
    showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Peringatan"),
            content: Text("Data berhasil disimpan."),
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
  Future<bool> _onInit() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      name =  prefs.getString('nama');
      gen =  prefs.getBool('gen') ?? true;
      age =  prefs.getString('agg');
      height =  prefs.getString('hei');
      weight =  prefs.getString('wei');
    });
    nameController.text = name;
    ageController.text = age;
    heightController.text = height;
    weightController.text = weight;
  }
}