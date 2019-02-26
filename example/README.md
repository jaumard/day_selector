```dart
import 'package:day_selector/day_selector.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DaySelector(
          onChange: (value) {
            print('value is $value');
            if (DaySelector.monday & value == DaySelector.monday) {
              print('monday selected');
            }
            if (DaySelector.tuesday & value == DaySelector.tuesday) {
              print('tuesday selected');
            }
            if (DaySelector.wednesday & value == DaySelector.wednesday) {
              print('wednesday selected');
            }
            if (DaySelector.thursday & value == DaySelector.thursday) {
              print('thursday selected');
            }
            if (DaySelector.friday & value == DaySelector.friday) {
              print('friday selected');
            }
            if (DaySelector.saturday & value == DaySelector.saturday) {
              print('saturday selected');
            }
            if (DaySelector.sunday & value == DaySelector.sunday) {
              print('sunday selected');
            }
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

```