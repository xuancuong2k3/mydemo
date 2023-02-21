import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _counter = "0";
  String Show2 = "";
  String dau = "";
  String dautruoc = "";
  bool nhapmoi = true;
  double str = 0;

  String toChuoi(double value) {
    String str;
    return str = value == value.roundToDouble()
        ? value.toInt().toString()
        : value.toString();
  }

  @override
  Widget build(BuildContext context) {
    var myButtonStyle = ElevatedButton.styleFrom(
      primary: Color.fromARGB(255, 136, 150, 185),
      fixedSize: Size(90, 90),
    );
    var mButtonStyle = ElevatedButton.styleFrom(
      primary: Color.fromARGB(255, 228, 172, 224),
      fixedSize: Size(90, 90),
    );
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 58, 58, 58),
      appBar: AppBar(
        title: Text('Demo calculator'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 360,
              height: 20,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 143, 208, 222),
              ),
              child: Text(
                '$Show2',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 52, 52, 52)
                ),
              ),
            ),
            Container(
              width: 360,
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 143, 208, 222),
              ),
              child: Text(
              '$_counter',
              style: TextStyle(
                fontSize: 58,
                
              ),
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter = "";
                      Show2 = "";
                      dau = "";
                      dautruoc = "";
                      nhapmoi = true;
                      str = 0;
                    });
                  },
                  child: Text('AC'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    fixedSize: Size(90, 90),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _counter = "0";
                    });
                  },
                  style: mButtonStyle,
                  child: Text('C'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_counter.length > 0) {
                      setState(() {
                        _counter = _counter.substring(0, _counter.length - 1);
                      });
                    }
                  },
                  child: Text('<'),
                  style: mButtonStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (dau == '+' || dau == '-' || dau == '*') {
                      setState(() {
                        Show2 = _counter + '/';
                      });
                      nhapmoi = true;
                    } else if (dautruoc == "+") {
                      setState(() {
                        _counter = toChuoi(str + double.parse(_counter));
                        Show2 = _counter + '/';
                      });
                      str = double.parse(_counter);
                      dau = "/";
                      nhapmoi = true;
                    } else if (dautruoc == "-") {
                      setState(() {
                        _counter = toChuoi(str - double.parse(_counter));
                        Show2 = _counter + '/';
                      });
                      str = double.parse(_counter);
                      dau = "/";
                      nhapmoi = true;
                    } else if (dautruoc == "*") {
                      setState(() {
                        _counter = toChuoi(str * double.parse(_counter));
                        Show2 = _counter + '/';
                      });
                      str = double.parse(_counter);
                      dau = "/";
                      nhapmoi = true;
                    } else if (dautruoc == "/") {
                      setState(() {
                        _counter = toChuoi(str / double.parse(_counter));
                        Show2 = _counter + '/';
                      });
                      str = double.parse(_counter);
                      dau = "/";
                      nhapmoi = true;
                    } else if (dau != null) {
                      str = double.parse(_counter);
                      setState(() {
                        dau = '/';
                        Show2 = toChuoi(str) + dau;
                      });
                      nhapmoi = true;
                    }
                  },
                  child: Text('/'),
                  style: mButtonStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (nhapmoi == true) {
                      dautruoc = dau;
                      setState(() {
                        _counter = '9';
                        dau = "";
                      });
                      nhapmoi = false;
                    } else {
                      setState(() {
                        _counter += '9';
                      });
                    }
                  },
                  child: Text(
                    '9',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: myButtonStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nhapmoi == true) {
                      dautruoc = dau;
                      setState(() {
                        _counter = '8';
                        dau = "";
                      });
                      nhapmoi = false;
                    } else {
                      setState(() {
                        _counter += '8';
                      });
                    }
                  },
                  child: Text(
                    '8',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: myButtonStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nhapmoi == true) {
                      dautruoc = dau;
                      setState(() {
                        _counter = '7';
                        dau = "";
                      });
                      nhapmoi = false;
                    } else {
                      setState(() {
                        _counter += '7';
                      });
                    }
                  },
                  child: Text(
                    '7',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: myButtonStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (dau == '+' || dau == '-' || dau == '/') {
                      setState(() {
                        Show2 = _counter + '*';
                      });
                      nhapmoi = true;
                    } else if (dautruoc == "+") {
                      setState(() {
                        _counter = toChuoi(str + double.parse(_counter));
                        Show2 = _counter + '*';
                      });
                      str = double.parse(_counter);
                      dau = "*";
                      nhapmoi = true;
                    } else if (dautruoc == "-") {
                      setState(() {
                        _counter = toChuoi(str - double.parse(_counter));
                        Show2 = _counter + '*';
                      });
                      str = double.parse(_counter);
                      dau = "*";
                      nhapmoi = true;
                    } else if (dautruoc == "*") {
                      setState(() {
                        _counter = toChuoi(str * double.parse(_counter));
                        Show2 = _counter + '*';
                      });
                      str = double.parse(_counter);
                      dau = "*";
                      nhapmoi = true;
                    } else if (dautruoc == "/") {
                      setState(() {
                        _counter = toChuoi(str / double.parse(_counter));
                        Show2 = _counter + '*';
                      });
                      str = double.parse(_counter);
                      dau = "*";
                      nhapmoi = true;
                    } else if (dau != null) {
                      str = double.parse(_counter);
                      setState(() {
                        dau = '*';
                        Show2 = toChuoi(str) + dau;
                      });
                      nhapmoi = true;
                    }
                  },
                  style: mButtonStyle,
                  child: Text('*'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (nhapmoi == true) {
                      dautruoc = dau;
                      setState(() {
                        _counter = '6';
                        dau = "";
                      });
                      nhapmoi = false;
                    } else {
                      setState(() {
                        _counter += '6';
                      });
                    }
                  },
                  child: Text(
                    '6',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: myButtonStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nhapmoi == true) {
                      dautruoc = dau;
                      setState(() {
                        _counter = '5';
                        dau = "";
                      });
                      nhapmoi = false;
                    } else {
                      setState(() {
                        _counter += '5';
                      });
                    }
                  },
                  child: Text(
                    '5',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: myButtonStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nhapmoi == true) {
                      dautruoc = dau;
                      setState(() {
                        _counter = '4';
                        dau = "";
                      });
                      nhapmoi = false;
                    } else {
                      setState(() {
                        _counter += '4';
                      });
                    }
                  },
                  child: Text(
                    '4',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: myButtonStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (dau == '+' || dau == '*' || dau == '/') {
                      setState(() {
                        Show2 = _counter + '-';
                      });
                      nhapmoi = true;
                    } else if (dautruoc == "+") {
                      setState(() {
                        _counter = toChuoi(str + double.parse(_counter));
                        Show2 = _counter + '-';
                      });
                      str = double.parse(_counter);
                      dau = "-";
                      nhapmoi = true;
                    } else if (dautruoc == "-") {
                      setState(() {
                        _counter = toChuoi(str - double.parse(_counter));
                        Show2 = _counter + '-';
                      });
                      str = double.parse(_counter);
                      dau = "-";
                      nhapmoi = true;
                    } else if (dautruoc == "*") {
                      setState(() {
                        _counter = toChuoi(str * double.parse(_counter));
                        Show2 = _counter + '-';
                      });
                      str = double.parse(_counter);
                      dau = "-";
                      nhapmoi = true;
                    } else if (dautruoc == "/") {
                      setState(() {
                        _counter = toChuoi(str / double.parse(_counter));
                        Show2 = _counter + '-';
                      });
                      str = double.parse(_counter);
                      dau = "-";
                      nhapmoi = true;
                    } else if (dau != null) {
                      str = double.parse(_counter);
                      setState(() {
                        dau = '-';
                        Show2 = toChuoi(str) + dau;
                      });
                      nhapmoi = true;
                    }
                  },
                  style: mButtonStyle,
                  child: Text('-'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (nhapmoi == true) {
                      dautruoc = dau;
                      setState(() {
                        _counter = '3';
                        dau = "";
                      });
                      nhapmoi = false;
                    } else {
                      setState(() {
                        _counter += '3';
                      });
                    }
                  },
                  child: Text(
                    '3',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: myButtonStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nhapmoi == true) {
                      dautruoc = dau;
                      setState(() {
                        _counter = '2';
                        dau = "";
                      });
                      nhapmoi = false;
                    } else {
                      setState(() {
                        _counter += '2';
                      });
                    }
                  },
                  child: Text(
                    '2',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: myButtonStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nhapmoi == true) {
                      dautruoc = dau;
                      setState(() {
                        _counter = '1';
                        dau = "";
                      });
                      nhapmoi = false;
                    } else {
                      setState(() {
                        _counter += '1';
                      });
                    }
                  },
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: myButtonStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (dau == '-' || dau == '*' || dau == '/') {
                      setState(() {
                        Show2 = _counter + '+';
                      });
                      nhapmoi = true;
                    } else if (dautruoc == "+") {
                      setState(() {
                        _counter = toChuoi(str + double.parse(_counter));
                        Show2 = _counter + '+';
                      });
                      str = double.parse(_counter);
                      dau = "+";
                      nhapmoi = true;
                    } else if (dautruoc == "-") {
                      setState(() {
                        _counter = toChuoi(str - double.parse(_counter));
                        Show2 = _counter + '+';
                      });
                      str = double.parse(_counter);
                      dau = "+";
                      nhapmoi = true;
                    } else if (dautruoc == "*") {
                      setState(() {
                        _counter = toChuoi(str * double.parse(_counter));
                        Show2 = _counter + '+';
                      });
                      str = double.parse(_counter);
                      dau = "+";
                      nhapmoi = true;
                    } else if (dautruoc == "/") {
                      setState(() {
                        _counter = toChuoi(str / double.parse(_counter));
                        Show2 = _counter + '+';
                      });
                      str = double.parse(_counter);
                      dau = "+";
                      nhapmoi = true;
                    } else if (dau != null) {
                      str = double.parse(_counter);
                      setState(() {
                        dau = "+";
                        Show2 = toChuoi(str) + dau;
                      });
                      nhapmoi = true;
                    }
                  },
                  style: mButtonStyle,
                  child: Text('+'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (nhapmoi == true) {
                      dautruoc = dau;
                      setState(() {
                        _counter = '0';
                        dau = "";
                      });
                      nhapmoi = false;
                    } else {
                      setState(() {
                        _counter += '0';
                      });
                    }
                  },
                  child: Text(
                    '0',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: myButtonStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_counter != null) {
                      setState(() {
                        _counter += ".";
                      });
                    }
                  },
                  child: Text('.'),
                  style: myButtonStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nhapmoi == true) {
                      dautruoc = dau;
                      setState(() {
                        _counter = '00';
                        dau = "";
                      });
                      nhapmoi = false;
                    } else {
                      setState(() {
                        _counter += '00';
                      });
                    }
                  },
                  child: Text(
                    '00',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: myButtonStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (dautruoc == "+") {
                      setState(() {
                        Show2 = toChuoi(str) + "+" + _counter + "=";
                        _counter = toChuoi(str + double.parse(_counter));
                      });
                      str = double.parse(_counter);
                      dau = "";
                      dautruoc = "";
                      nhapmoi = true;
                    } else if (dautruoc == "-") {
                      setState(() {
                        Show2 = toChuoi(str) + "-" + _counter + "=";
                        _counter = toChuoi(str - double.parse(_counter));
                      });
                      str = double.parse(_counter);
                      dau = "";
                      dautruoc = "";
                      nhapmoi = true;
                    } else if (dautruoc == "*") {
                      setState(() {
                        Show2 = toChuoi(str) + "*" + _counter + "=";
                        _counter = toChuoi(str * double.parse(_counter));
                      });
                      str = double.parse(_counter);
                      dau = "";
                      dautruoc = "";
                      nhapmoi = true;
                    } else if (dautruoc == "/") {
                      setState(() {
                        Show2 = toChuoi(str) + "/" + _counter + "=";
                        _counter = toChuoi(str / double.parse(_counter));
                      });
                      str = double.parse(_counter);
                      dau = "";
                      dautruoc = "";
                      nhapmoi = true;
                    }
                  },
                  child: Text('='),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 149, 234, 200),
                    fixedSize: Size(90, 90),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
