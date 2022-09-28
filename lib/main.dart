import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController age = TextEditingController();
  double _result = 0.0;
  String bmi = "";
  void Calculate() {
    setState(() {
      int a = int.parse(age.text);
      double w = double.parse(weight.text);
      double h = double.parse(height.text);
      if ((a.toString().isNotEmpty && a > 20) ||
          (w.toString().isNotEmpty && w > 0) ||
          (height.toString().isNotEmpty && h > 0)) {
        _result = w / (h * 2);
      }
      if (_result >= 25.0 && _result < 30) {
        bmi = "Hơi thừa cân";
      } else if (_result >= 18.5 && _result < 25.0) {
        bmi = "Cân đối";
      } else if (_result >= 30) {
        bmi = "Thừa cân";
      } else {
        bmi = "Gầy";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: age,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tuổi',
                  hintText: 'Nhập độ tuổi',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: height,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Chiều cao',
                  hintText: 'Nhập chiều cao',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: weight,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Cân nặng',
                  hintText: 'Nhập cân nặng',
                ),
              ),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Xem'),
              onPressed: Calculate,
            ),
            Center(
              child: Text('Bạn có thể trạng $bmi'),
            )
          ],
        ),
      ),
    );
  }
}
