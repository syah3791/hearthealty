import 'dart:async';
import 'dart:math';

import 'package:flutter_better_camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chart.dart';
import 'package:simple_timer/simple_timer.dart';


class PPGView extends StatefulWidget{
  var parent;
  PPGView({this.parent});
  @override
  PPGViewState createState() {
    return PPGViewState();
  }
}

class PPGViewState extends State<PPGView> with SingleTickerProviderStateMixin {
  bool _toggled = false; // toggle button value
  List<SensorValue> _data = List<SensorValue>(); // array to store the values
  CameraController _controller;
  double _alpha = 0.3; // factor for the mean value
  AnimationController _animationController;
  double _iconScale = 1;
  int _bpm = 0; // beats per minute
  int _fs = 30; // sampling frequency (fps)
  int _windowLen = 30 * 6; // window length to display - 6 seconds
  CameraImage _image; // store the last camera image
  double _avg; // store the average value during calculation
  DateTime _now; // store the now Datetime
  Timer _timer; // timer for image processing
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TimerController _timerController;
  double Agg, Hei, Wei;
  double SamplingFreq;
  double Q = 4.5;
  int SP = 0, DP = 0;

  @override
  void initState() {
    super.initState();
    _onInit();
    _timerController = TimerController(this);
    // _animationController =
    //     AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    // _animationController
    //   ..addListener(() {
    //     setState(() {
    //       _iconScale = 1.0 + _animationController.value * 0.4;
    //     });
    //   });
  }
 //Mengambil data dari shared_preferences
  _onInit() async {
    final SharedPreferences prefs = await _prefs;
    try{
      setState(() {
        Agg = double.parse(prefs.getString('agg'));
        Hei = double.parse(prefs.getString('hei'));
        Wei = double.parse(prefs.getString('wei'));
        if (prefs.getBool('gen') == true) {
          Q = 5;
        }
      });
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

  @override
  void dispose() {
    _timer?.cancel();
    _toggled = false;
    _disposeController();
    Wakelock.disable();
    // _animationController?.stop();
    // _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdfd7ca),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height:10),
            Center(child:Text('Photoplethysmography',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),)),
            SizedBox(height:15),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: Alignment.center,
                            children: <Widget>[
                              _controller != null && _toggled
                                  ? AspectRatio(
                                aspectRatio:
                                _controller.value.aspectRatio,
                                child: CameraPreview(_controller),
                              )
                                  : Container(
                                padding: EdgeInsets.all(12),
                                alignment: Alignment.center,
                                color: Colors.grey,
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(4),
                                child: _toggled ? Text(
                                  "Tutupi kamera dan flash dengan jari Anda",
                                  style: TextStyle(
                                      backgroundColor: _toggled
                                          ? Colors.white
                                          : Colors.transparent),
                                  textAlign: TextAlign.center,
                                ): Container(
                                  child : Center(
                                    child: Table(
                                      children: [
                                        TableRow(
                                          children:[
                                            Text(
                                              "BPM",
                                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              (_bpm > 30 && _bpm < 200 ? _bpm.toString() : "--"),
                                              style: TextStyle(
                                                  fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                          ]
                                        ),
                                        TableRow(
                                            children: [
                                              Text(
                                                "Keterangan",
                                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                (_bpm == 0 ? '--' : _bpm > 30 ? _bpm < 90 ? 'Normal': "Diatas normal" : "Dibawah normal"),
                                                style: TextStyle(
                                                    fontSize: 18, fontWeight: FontWeight.bold),
                                              ),
                                            ]
                                        ),
                                        TableRow(
                                          children: [
                                            Text(
                                              "High mm Hg",
                                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              (SP > 0  ? SP.toString() : "--"),
                                              style: TextStyle(
                                                  fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                          ]
                                        ),
                                        TableRow(
                                          children: [
                                            Text(
                                              "Low mm Hg",
                                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              (DP > 0  ? DP.toString() : "--"),
                                              style: TextStyle(
                                                  fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                          ]
                                        ),
                                        TableRow(
                                            children: [
                                              Text(
                                                "Tekanan darah",
                                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                (SP == 0 && DP ==0 ? '--' : SP <= 120 && DP <=80 ? 'Normal' : SP <= 120 && DP <=80 ? 'Tinggi (Sebelum prehipertensi)' : SP <= 130 && DP <=89 ? 'Hypertens tahap 1': 'Hypertens tahap 2'),
                                                style: TextStyle(
                                                    fontSize: 18, fontWeight: FontWeight.bold),
                                              ),
                                            ]
                                        )
                                      ]
                                    )
                                ),
                              )
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 1,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                        height:150.0,
                        width:150.0,
                        child: SimpleTimer(
                          onStart: () => _toggle(),
                          onEnd: () => _untoggle(),
                          controller: _timerController,
                          duration: const Duration(seconds: 30),
                        )
                    )
                  ),
                  Center(
                    child: !_toggled ? Container(
                      height:200.0,
                      width:200.0,
                      color: Color(0xffdfd7ca),
                      child: IconButton(
                        icon:
                        Icon(Icons.favorite_border),
                        color: Colors.red,
                        iconSize: 150,
                        onPressed: _timerController.start,
                      ),
                    ):
                        Container()
                  )
                ]
              )
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                    color: Colors.black),
                child: Chart(_data),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _clearData() {
    // create array of 128 ~= 255/2
    _data.clear();
    int now = DateTime.now().millisecondsSinceEpoch;
    for (int i = 0; i < _windowLen; i++)
      _data.insert(
          0,
          SensorValue(
              DateTime.fromMillisecondsSinceEpoch(now - i * 1000 ~/ _fs), 128));
  }

  void _toggle() {
    _clearData();
    _initController().then((onValue) {
      Wakelock.enable();

      // _animationController?.repeat(reverse: true);

      setState(() {
        _toggled = true;
      });

      // after is toggled
      _initTimer();
      _updateBPM();
    });
  }

  void _untoggle() {
    _disposeController();
    Wakelock.disable();
    // _animationController?.stop();
    // _animationController?.value = 0.0;
    setState(() {
      _toggled = false;
    });
    _timerController.reset();
  }

  void _disposeController() {
    _controller?.dispose();
    _controller = null;
  }

  Future<void> _initController() async {
    try {
      List _cameras = await availableCameras();
      _controller = CameraController(_cameras.first, ResolutionPreset.low);
      await _controller.initialize();
      Future.delayed(Duration(milliseconds: 100)).then((onValue) {
        _controller.setFlashMode(FlashMode.torch);
      });
      _controller.startImageStream((CameraImage image) {
        _image = image;
      });
    } catch (Exception) {
      debugPrint(Exception);
    }
  }

  void _initTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 1000 ~/ _fs), (timer) {
      if (_toggled) {
        if (_image != null) _scanImage(_image);
      } else {
        timer.cancel();
      }
    });
  }

  void _scanImage(CameraImage image) {
    _now = DateTime.now();
    _avg =
        image.planes.first.bytes.reduce((value, element) => value + element) /
            image.planes.first.bytes.length;
    if (_data.length >= _windowLen) {
      _data.removeAt(0);
    }
    setState(() {
      _data.add(SensorValue(_now, _avg));
    });
  }

  void _updateBPM() async {
    // Bear in mind that the method used to calculate the BPM is very rudimentar
    // feel free to improve it :)

    // Since this function doesn't need to be so "exact" regarding the time it executes,
    // I only used the a Future.delay to repeat it from time to time.
    // Ofc you can also use a Timer object to time the callback of this function
    List<SensorValue> _values;
    double _avg;
    int _n;
    double _m;
    double _threshold;
    double _bpm;
    int _counter;
    int _previous;
    while (_toggled) {
      _values = List.from(_data); // create a copy of the current data array
      _avg = 0;
      _n = _values.length;
      _m = 0;
      _values.forEach((SensorValue value) {
        _avg += value.value / _n;
        if (value.value > _m) _m = value.value;
      });
      _threshold = (_m + _avg) / 2;
      _bpm = 0;
      _counter = 0;
      _previous = 0;
      for (int i = 1; i < _n; i++) {
        if (_values[i - 1].value < _threshold &&
            _values[i].value > _threshold) {
          if (_previous != 0) {
            _counter++;
            _bpm += 60 *
                1000 /
                (_values[i].time.millisecondsSinceEpoch - _previous);
          }
          _previous = _values[i].time.millisecondsSinceEpoch;
        }
      }
      if (_counter > 0) {
        _bpm = _bpm / _counter;
        print(_bpm);
        _bpm = ((1 - _alpha) * this._bpm + _alpha * _bpm);
        if (_bpm < 150){
          print(_bpm);
          double ROB = 18.5;
          double ET = (364.5 - 1.23 * _bpm.toInt());
          double BSA = 0.007184 * (pow(Wei, 0.425)) * (pow(Hei, 0.725));
          double SV = (-6.6 + (0.25 * (ET - 35)) - (0.62 * _bpm.toInt()) + (40.4 * BSA) - (0.51 * Agg));
          double PP = SV / ((0.013 * Wei - 0.007 * Agg - 0.004 * _bpm.toInt()) + 1.307);
          double MPP = Q * ROB;
          setState(() {
            this._bpm = _bpm.toInt();
            this.SP = (MPP + 3 / 2 * PP).toInt();
            this.DP = (MPP - PP / 3).toInt();
          });
        }

      }
      await Future.delayed(Duration(
          milliseconds:
          1000 * _windowLen ~/ _fs)); // wait for a new set of _data values
    }
  }

  // void _updateBPM() async {
  //   // Bear in mind that the method used to calculate the BPM is very rudimentar
  //   // feel free to improve it :)
  //
  //   // Since this function doesn't need to be so "exact" regarding the time it executes,
  //   // I only used the a Future.delay to repeat it from time to time.
  //   // Ofc you can also use a Timer object to time the callback of this function
  //   List<SensorValue> _values;
  //   double _avg;
  //   int _n;
  //   double _m;
  //   double _threshold;
  //   double _bpm;
  //   int _counter;
  //   int _previous;
  //   while (_toggled) {
  //     _values = List.from(_data); // create a copy of the current data array
  //     _avg = 0;
  //     _n = _values.length;
  //     _m = 0;
  //     _values.forEach((SensorValue value) {
  //       _avg += value.value / _n;
  //       if (value.value > _m) _m = value.value;
  //     });
  //     _threshold = (_m + _avg) / 2;
  //     _bpm = 0;
  //     _counter = 0;
  //     _previous = 0;
  //     for (int i = 1; i < _n; i++) {
  //       if (_values[i - 1].value < _threshold &&
  //           _values[i].value > _threshold) {
  //         if (_previous != 0) {
  //           _counter++;
  //           double totalTimeInSecs = (_values.first.time.millisecondsSinceEpoch - _values[i].time.millisecondsSinceEpoch) / 1000;
  //           SamplingFreq = (_counter / totalTimeInSecs);
  //           double HRFreq = FFT(_values, _counter, SamplingFreq); // send the green array and get its fft then return the amount of heartrate per second
  //           double bpm = (HRFreq * 60).ceil().toDouble();
  //           print('_counter');
  //           print(_counter);
  //           print('totalTimeInSecs');
  //           print(totalTimeInSecs);
  //           print('SamplingFreq');
  //           print(SamplingFreq);
  //           print('HRFreq');
  //           print(HRFreq);
  //           print('bpm');
  //           print(bpm);
  //           if ((bpm > 45 || bpm < 200)) {
  //             double ROB = 18.5;
  //             double ET = (364.5 - 1.23 * bpm.toInt());
  //             double BSA = 0.007184 * (pow(Wei, 0.425)) * (pow(Hei, 0.725));
  //             double SV = (-6.6 + (0.25 * (ET - 35)) - (0.62 * bpm.toInt()) + (40.4 * BSA) - (0.51 * Agg));
  //             double PP = SV / ((0.013 * Wei - 0.007 * Agg - 0.004 * bpm.toInt()) + 1.307);
  //             double MPP = Q * ROB;
  //             setState(() {
  //               this._bpm = bpm.toInt();
  //               this.SP = (MPP + 3 / 2 * PP).toInt();
  //               this.DP = (MPP - PP / 3).toInt();
  //             });
  //           }
  //         }
  //         _previous = _values[i].time.millisecondsSinceEpoch;
  //       }
  //     }
  //     await Future.delayed(Duration(
  //         milliseconds:
  //         1000 * _windowLen ~/ _fs)); // wait for a new set of _data values
  //   }
  // }
  // double FFT(List<SensorValue> input, int size, double samplingFrequency) {
  //   double temp = 0;
  //   double POMP = 0;
  //   double frequency;
  //   List<double> output = List<double>();
  //
  //   for(int i=0;i<output.length;i++)
  //     output[i]= 0;
  //
  //   for(int x=0;x<size;x++){
  //     output.add(double.parse(input[x].value.toString())) ;
  //   }
  //
  // // DoubleFft1d fft = new DoubleFft1d(size);
  // // fft.realForward(output);
  //
  //   print('size1');
  //   print(output.length);
  //
  //   for(int x=0;x<size;x++){
  //     output.add(double.parse(output[x].toString()));
  //   }
  //   print('size2');
  //   print(output.length);
  //   for(int p=35; p<size; p++) {// 12 was chosen because it is a minimum frequency that we think people can get to determine heart rate.
  //     if(temp < double.parse(output[p].toString())) {
  //       temp = double.parse(output[p].toString());
  //       POMP = p.toDouble();
  //     }
  //   }
  //
  //   if (POMP < 35) {
  //     POMP = 0;
  //   }
  //   frequency = POMP*samplingFrequency/(2*size);
  //   return frequency;
  // }
}
