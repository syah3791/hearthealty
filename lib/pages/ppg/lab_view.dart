import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hearthealthy/widget/constants.dart';

class LabView extends StatefulWidget{
  // LabView({Key key}) : super(key: key);
  var parent;
  LabView({this.parent});
  @override
  _LabViewState createState() => _LabViewState();
}

class _LabViewState extends State<LabView> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isLoad=false;
  double Age;
  ///Input controller
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final eritrositController = TextEditingController();
  final hemoglobinController = TextEditingController();
  final hematokritController = TextEditingController();
  final basofilController = TextEditingController();
  final eosinofilController = TextEditingController();
  final batangController = TextEditingController();
  final segmenController = TextEditingController();
  final limfositController = TextEditingController();
  final monositController = TextEditingController();
  final LEDController = TextEditingController();
  final leukositController = TextEditingController();
  final mchherController = TextEditingController();
  final mchckherController = TextEditingController();
  final mcvverController = TextEditingController();
  final trombositController = TextEditingController();
  final altsgptController = TextEditingController();
  final astsgotController = TextEditingController();
  final alkalinfosfataseController = TextEditingController();
  final ggtController = TextEditingController();
  final bilirubintotalController = TextEditingController();
  final bilirubinlangsungController = TextEditingController();
  final proteintotalController = TextEditingController();
  final albuminController = TextEditingController();
  final kreatininController = TextEditingController();
  final ureaController = TextEditingController();
  final natriumController = TextEditingController();
  final kloridController = TextEditingController();
  final kaliumController = TextEditingController();
  final kolesteroltotalController = TextEditingController();
  final hdlController = TextEditingController();
  final trigliseridController = TextEditingController();
  final glukosaController = TextEditingController();
  final amilaseController = TextEditingController();
  final asamuratController = TextEditingController();
  String name;
  bool gen;
  String age;
  String height;
  String weight;
  double eritrosit;
  double hemoglobin;
  double hematokrit;
  double basofil;
  double eosinofil;
  double batang;
  double segmen;
  double limfosit;
  double monosit;
  double LED;
  double leukosit;
  double mchher;
  double mchckher;
  double mcvver;
  double trombosit;
  double altsgpt;
  double astsgot;
  double alkalinfosfatase;
  double ggt;
  double bilirubintotal;
  double bilirubinlangsung;
  double proteintotal;
  double albumin;
  double kreatinin;
  double urea;
  double natrium;
  double klorid;
  double kalium;
  double kolesteroltotal;
  double hdl;
  double trigliserid;
  double glukosa;
  double amilase;
  double asamurat;
  var controllerInput;
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
                    Center(child:Text('Hasil Lab $name',style: kNonActiveTabStyle.copyWith(color: Colors.red,fontWeight: FontWeight.bold),)),
                    SizedBox(
                      height: 10,
                    ),
                    /////////////////////////////////////INPUT////////////////////////////////////////
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: eritrositController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => eritrosit = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Eritrosit',
                            hintText: 'Eritrosit',
                            suffixText:'juta/μl',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: hemoglobinController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => hemoglobin = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Hemoglobin (Hb)',
                            hintText: 'Hemoglobin (Hb)',
                            suffixText:'g/dL',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: hematokritController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => hematokrit = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Hematokrit',
                            hintText: 'Hematokrit',
                            suffixText:'g/dL',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    SizedBox(height:10),
                    Text('Hitung Jenis', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold,),),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: basofilController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => basofil = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Basofil',
                            hintText: 'Basofil',
                            suffixText:'%',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: eosinofilController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => eosinofil = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Eosinofil',
                            hintText: 'Eosinofil',
                            suffixText:'%',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: batangController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => batang = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Batang',
                            hintText: 'Batang',
                            suffixText:'%',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: segmenController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => segmen = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Segmen',
                            hintText: 'Segmen',
                            suffixText:'%',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: limfositController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => limfosit = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Limfosit',
                            hintText: 'Limfosit',
                            suffixText:'%',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: monositController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => monosit = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Monosit',
                            hintText: 'Monosit',
                            suffixText:'%',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: LEDController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => LED = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Laju Endapan Darah',
                            hintText: 'Laju Endapan Darah',
                            suffixText:'mm/Jam',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: leukositController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => leukosit = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Leukosit',
                            hintText: 'Leukosit',
                            suffixText:'10^3/μl',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: mchherController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => mchher = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'MCH/HER',
                            hintText: 'MCH/HER',
                            suffixText:'pg',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: mchckherController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => mchckher = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'MCHC/KHER',
                            hintText: 'MCHC/KHER',
                            suffixText:'g/dL',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: mcvverController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => mcvver = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'MCV/VER',
                            hintText: 'MCV/VER',
                            suffixText:'g/dL',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: trombositController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => trombosit = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Trombosit',
                            hintText: 'Trombosit',
                            suffixText:'10^3/μl',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: altsgptController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => altsgpt = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'ALT (SGPT)',
                            hintText: 'ALT (SGPT)',
                            suffixText:'U/L',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: astsgotController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => astsgot = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'AST (SGOT)',
                            hintText: 'AST (SGOT)',
                            suffixText:'U/L',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: alkalinfosfataseController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => alkalinfosfatase = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Alkalinfosfatase',
                            hintText: 'Alkalinfosfatase',
                            suffixText:'U/L',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: ggtController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => ggt = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'GGT (Gamma GT)',
                            hintText: 'GGT (Gamma GT)',
                            suffixText:'U/L',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: bilirubintotalController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => bilirubintotal = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Bilirubin Total',
                            hintText: 'Bilirubin Total',
                            suffixText:'mg/dL',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: bilirubinlangsungController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => bilirubinlangsung = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Bilirubin Langsung',
                            hintText: 'Bilirubin Langsung',
                            suffixText:'mg/dL',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: proteintotalController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => proteintotal = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Protein Total',
                            hintText: 'Protein Total',
                            suffixText:'g/L',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: albuminController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => albumin = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Albumin',
                            hintText: 'Albumin',
                            suffixText:'g/L',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    SizedBox(height:10),
                    Text('Fungsi Ginjal', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold,),),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: kreatininController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => kreatinin = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Kreatinin',
                            hintText: 'Kreatinin',
                            suffixText:'U/L',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: ureaController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => urea = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Urea',
                            hintText: 'Urea',
                            suffixText:'mg/dL',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: natriumController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => natrium = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Natrium',
                            hintText: 'Natrium',
                            suffixText:'mmol/L',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: kloridController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => klorid = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Klorid',
                            hintText: 'Klorid',
                            suffixText:'mmol/L',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: kaliumController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => kalium = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Kalium',
                            hintText: 'Kalium',
                            suffixText:'mmol/L',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    SizedBox(height:10),
                    Text('Profil Lipid', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold,),),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: kolesteroltotalController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => kolesteroltotal = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Kolesterol Total',
                            hintText: 'Kolesterol Total',
                            suffixText:'mg/dL',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: hdlController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => hdl = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'HDL',
                            hintText: 'HDL',
                            suffixText:'mg/dL',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: trigliseridController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => trigliserid = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Trigliserid',
                            hintText: 'Trigliserid',
                            suffixText:'mg/dL',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    SizedBox(height:10),
                    Text('Lain', style: TextStyle(fontSize:20, fontWeight: FontWeight.bold,),),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: glukosaController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => glukosa = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Glukosa (darah, puasa)',
                            hintText: 'Glukosa (darah, puasa)',
                            suffixText:'mg/dL',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: amilaseController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => amilase = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Amilase',
                            hintText: 'Amilase',
                            suffixText:'U/L',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    Container(
                        padding: paddingInput,
                        color:Colors.white,
                        child: TextFormField(
                          controller: asamuratController,
                          validator: (val) =>
                          (val.length == 0 ? 'Isi data dahulu' : null),
                          onSaved: (val) => setState(() => asamurat = double.parse(val)),
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelText:'Asam Urat',
                            hintText: 'Asam Urat',
                            suffixText:'mg/dL',
                          ),
                          keyboardType: TextInputType.number,
                        )
                    ),
                    /////////////////////////////////////////////////////
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
//Ketika menekan tombol simpan
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
      //_data
      await prefs.setDouble('eritrosit', eritrosit);
      await prefs.setDouble('hemoglobin', hemoglobin);
      await prefs.setDouble('hematokrit', hematokrit);
      await prefs.setDouble('basofil', basofil);
      await prefs.setDouble('eosinofil', eosinofil);
      await prefs.setDouble('batang', batang);
      await prefs.setDouble('segmen', segmen);
      await prefs.setDouble('limfosit', limfosit);
      await prefs.setDouble('monosit', monosit);
      await prefs.setDouble('LED', LED);
      await prefs.setDouble('leukosit', leukosit);
      await prefs.setDouble('mchher', mchher);
      await prefs.setDouble('mchckher', mchckher);
      await prefs.setDouble('mcvver', mcvver);
      await prefs.setDouble('trombosit', trombosit);
      await prefs.setDouble('altsgpt', altsgpt);
      await prefs.setDouble('astsgot', astsgot);
      await prefs.setDouble('alkalinfosfatase', alkalinfosfatase);
      await prefs.setDouble('ggt', ggt);
      await prefs.setDouble('bilirubintotal', bilirubintotal);
      await prefs.setDouble('bilirubinlangsung', bilirubinlangsung);
      await prefs.setDouble('proteintotal', proteintotal);
      await prefs.setDouble('albumin', albumin);
      await prefs.setDouble('kreatinin', kreatinin);
      await prefs.setDouble('urea', urea);
      await prefs.setDouble('natrium', natrium);
      await prefs.setDouble('klorid', klorid);
      await prefs.setDouble('kalium', kalium);
      await prefs.setDouble('kolesteroltotal', kolesteroltotal);
      await prefs.setDouble('hdl', hdl);
      await prefs.setDouble('trigliserid', trigliserid);
      await prefs.setDouble('glukosa', glukosa);
      await prefs.setDouble('amilase', amilase);
      await prefs.setDouble('asamurat', asamurat);
      _check();
    }
  }
  // Mengecek data
  _check(){
    print(gen);
    bool success = true;
    if(gen){
      if(!(eritrosit >= 4.5 && eritrosit <= 5.5)) success = false;
      if(!(hemoglobin >= 13 && hemoglobin <= 16)) success = false;
      if(!(hematokrit >= 45 && hematokrit <= 55)) success = false;
      if(!(LED < 10)) success = false;
      if(!(altsgpt < 30)) success = false;
      if(!(astsgot <=25)) success = false;
      if(!(kreatinin >= 70 && kreatinin <= 160)) success = false;
      if(!(hdl >= 35 && hdl <= 55)) success = false;
      if(!(asamurat >= 3.4 && asamurat <= 7)) success = false;
    }else{
      if(!(eritrosit >= 4 && eritrosit <= 5)) success = false;
      if(!(hemoglobin >= 12 && hemoglobin <= 14)) success = false;
      if(!(hematokrit >= 40 && hematokrit <= 50)) success = false;
      if(!(LED < 15)) success = false;
      if(!(altsgpt < 23)) success = false;
      if(!(astsgot < 21)) success = false;
      if(!(kreatinin >= 60 && kreatinin <= 150)) success = false;
      if(!(hdl >= 45 && hdl <= 65)) success = false;
      if(!(asamurat >= 2.4 && asamurat <= 5.7)) success = false;
    }
    //Semua sama
    if(!(basofil >= 0 && basofil <= 1)) success = false;
    if(!(eosinofil >= 1 && eosinofil <= 3)) success = false;
    if(!(batang >= 2 && batang <= 6)) success = false;
    if(!(segmen >= 50 && segmen <= 70)) success = false;
    if(!(limfosit >= 20 && limfosit <= 40)) success = false;
    if(!(monosit >= 2 && monosit <= 8)) success = false;
    if(!(leukosit >= 5 && leukosit <= 10)) success = false;
    if(!(mchher >= 27 && mchher <= 31)) success = false;
    if(!(mchckher >= 32 && mchckher <= 36)) success = false;
    if(!(mcvver >= 80 && mcvver <= 96)) success = false;
    if(!(trombosit >= 150 && trombosit <= 400)) success = false;
    if(!(alkalinfosfatase >= 15 && alkalinfosfatase <= 69)) success = false;
    if(!(ggt >= 5 && ggt <= 38)) success = false;
    if(!(bilirubintotal >= 0.25 && bilirubintotal <= 1)) success = false;
    if(!(bilirubinlangsung >= 0 && bilirubinlangsung <= 0.25)) success = false;
    if(!(proteintotal >= 61 && proteintotal <= 82)) success = false;
    if(!(albumin >= 37 && albumin <= 52)) success = false;
    if(!(urea >= 8 && urea <= 25)) success = false;
    if(!(natrium >= 135 && natrium <= 145)) success = false;
    if(!(klorid >= 94 && klorid <= 111)) success = false;
    if(!(kalium >= 3.5 && kalium <= 5)) success = false;
    if(!(kolesteroltotal >= 150 && kolesteroltotal <= 200)) success = false;
    if(!(trigliserid >= 120 && trigliserid <= 190)) success = false;
    if(!(glukosa >= 70 && glukosa <= 100)) success = false;
    if(!(amilase >= 30 && amilase <= 130)) success = false;
    _success(success);
  }
  _success(isSuccess) async {
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
            content: Text("Nilai rujukan tinggi,\n segeralah konsultasi kedokter untuk \npemeriksaan lebih lanjut\ndan ubah pola hidup lebih teratur \ndengan istirahat yang cukup serta \nmakan – makanan yang bergizi "),
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
  //Mengambil data dar shared_preferences
  Future<bool> _onInit() async {
    final SharedPreferences prefs = await _prefs;
    try{
      setState(() {
        Age = double.parse(prefs.getString('agg'));
        name =  prefs.getString('nama');
        gen =  prefs.getBool('gen') ?? true;
        age =  prefs.getString('agg');
        height =  prefs.getString('hei');
        weight =  prefs.getString('wei');
        eritrosit =  prefs.getDouble('eritrosit');
        hemoglobin =  prefs.getDouble('hemoglobin');
        hematokrit =  prefs.getDouble('hematokrit');
        basofil =  prefs.getDouble('basofil');
        eosinofil =  prefs.getDouble('eosinofil');
        batang =  prefs.getDouble('batang');
        segmen =  prefs.getDouble('segmen');
        limfosit =  prefs.getDouble('limfosit');
        monosit =  prefs.getDouble('monosit');
        LED =  prefs.getDouble('LED');
        leukosit =  prefs.getDouble('leukosit');
        mchher =  prefs.getDouble('mchher');
        mchckher =  prefs.getDouble('mchckher');
        mcvver =  prefs.getDouble('mcvver');
        trombosit =  prefs.getDouble('trombosit');
        altsgpt =  prefs.getDouble('altsgpt');
        astsgot =  prefs.getDouble('astsgot');
        alkalinfosfatase =  prefs.getDouble('alkalinfosfatase');
        ggt =  prefs.getDouble('ggt');
        bilirubintotal =  prefs.getDouble('bilirubintotal');
        bilirubinlangsung =  prefs.getDouble('bilirubinlangsung');
        proteintotal =  prefs.getDouble('proteintotal');
        albumin =  prefs.getDouble('albumin');
        kreatinin =  prefs.getDouble('kreatinin');
        urea =  prefs.getDouble('urea');
        natrium =  prefs.getDouble('natrium');
        klorid =  prefs.getDouble('klorid');
        kalium =  prefs.getDouble('kalium');
        kolesteroltotal =  prefs.getDouble('kolesteroltotal');
        hdl =  prefs.getDouble('hdl');
        trigliserid =  prefs.getDouble('trigliserid');
        glukosa =  prefs.getDouble('glukosa');
        amilase =  prefs.getDouble('amilase');
        asamurat =  prefs.getDouble('asamurat');
      });
      nameController.text = name;
      ageController.text = age;
      heightController.text = height;
      weightController.text = weight;
      if (!(eritrosit.toString() == 'null')){
      eritrositController.text = eritrosit.toString();
      hemoglobinController.text = hemoglobin.toString();
      hematokritController.text = hematokrit.toString();
      basofilController.text = basofil.toString();
      eosinofilController.text = eosinofil.toString();
      batangController.text = batang.toString();
      segmenController.text = segmen.toString();
      limfositController.text = limfosit.toString();
      monositController.text = monosit.toString();
      LEDController.text = LED.toString();
      leukositController.text = leukosit.toString();
      mchherController.text = mchher.toString();
      mchckherController.text = mchckher.toString();
      mcvverController.text = mcvver.toString();
      trombositController.text = trombosit.toString();
      altsgptController.text = altsgpt.toString();
      astsgotController.text = astsgot.toString();
      alkalinfosfataseController.text = alkalinfosfatase.toString();
      ggtController.text = ggt.toString();
      bilirubintotalController.text = bilirubintotal.toString();
      bilirubinlangsungController.text = bilirubinlangsung.toString();
      proteintotalController.text = proteintotal.toString();
      albuminController.text = albumin.toString();
      kreatininController.text = kreatinin.toString();
      ureaController.text = urea.toString();
      natriumController.text = natrium.toString();
      kloridController.text = klorid.toString();
      kaliumController.text = kalium.toString();
      kolesteroltotalController.text = kolesteroltotal.toString();
      hdlController.text = hdl.toString();
      trigliseridController.text = trigliserid.toString();
      glukosaController.text = glukosa.toString();
      amilaseController.text = amilase.toString();
      asamuratController.text = asamurat.toString();}
    }catch(e){
      _onNullVar();
    }
  }
  //Warning jika data belum ada
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