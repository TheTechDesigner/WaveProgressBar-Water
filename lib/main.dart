import 'package:flutter/material.dart';
import 'package:waveprogressbar_flutter/waveprogressbar_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'WaveProgressBar';

  TextEditingController _controller = TextEditingController();
  WaterController _waterController = WaterController();
  double _waterHeight = 0.0; //dedfault initial value

  @override
  void initState() {
    super.initState();
    WidgetsBinding _widgetsBinding = WidgetsBinding.instance;
    _widgetsBinding.addPostFrameCallback((timeStamp) { 
      _waterController.changeWaterHeight(0.64); // height percentage you want to display
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: WaveProgressBar(
                circleStrokeWidth: 8.0,
                strokeCircleColor: Color(0xFFFBE0E6),
                waveHeight: 24.0,
                waveDistance: 48.0,
                waterColor: Color(0xFFC41A3B),
                flowSpeed: 4.0,
                percentage: _waterHeight,
                size: Size(350.0, 350.0),
                heightController: _waterController,
                textStyle: TextStyle(
                  color: Color(0xFF1B1F32).withOpacity(0.3),
                  fontSize: 64.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Height Adjustment  :',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Please Enter Height',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFC41A3B),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16.0),
              child: RaisedButton(
                padding: EdgeInsets.all(16.0),
                color: Color(0xFFC41A3B),
                onPressed: () {
                  print('Water Height is ${_controller.toString()}');
                  FocusScope.of(context).requestFocus(FocusNode());
                  _waterController.changeWaterHeight(
                    double.parse(_controller.text),
                  );
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Color(0xFFFBE0E6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
