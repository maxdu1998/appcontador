import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData tm = ThemeData(
      primarySwatch: Colors.lime,
    );
    MyHomePage myHP = const MyHomePage(title: 'Contador de Pessoas');
    MaterialApp matapp = MaterialApp(
      title: 'Flutter Demo',
      theme: tm,
      home: myHP,
    );
    return matapp;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _alertaPessoas = "";
  final _maxPessoas = 10;

  void _incrementCounter() {
    setState(() {
      _counter++;

      if (_counter > _maxPessoas) _alertaPessoas = "Limite Ultrapassado!";
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;

        if (_counter <= _maxPessoas) _alertaPessoas = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppBar meuAppBar = AppBar(
      title: Text(widget.title),
    );

    Center meuCenter = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _alertaPessoas,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            'Número de Pessoas:',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );

    FloatingActionButton meuButton1 = FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Adiciona Pessoas',
        child: Icon(Icons.add));

    FloatingActionButton meuButton2 = FloatingActionButton(
        onPressed: _decrementCounter,
        tooltip: 'Remove Pessoas',
        child: Icon(Icons.remove));

    Column botoes = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        meuButton1,
        const SizedBox(
          height: 10,
        ),
        meuButton2
      ],
    );

    return Scaffold(
        appBar: meuAppBar, body: meuCenter, floatingActionButton: botoes);
  }
}
