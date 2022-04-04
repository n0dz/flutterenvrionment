import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './config_reader.dart';

class MyApp extends StatelessWidget {
  final String title;
  final Color? color;
  MyApp(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    print('Environment $title');
    return MaterialApp(
      title: 'Flutter CI with Codemagic',
      theme: ThemeData(
        primaryColor: title == "Development" ? Colors.blue : Colors.red,
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += ConfigReader.getIncrementAmount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              'Revealed secret:\n${ConfigReader.getSecretKey()}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child:const Icon(Icons.add),
      ),
    );
  }
}