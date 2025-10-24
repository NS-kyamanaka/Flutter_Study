import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'おみくじアプリ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'おみくじアプリ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> list = const ['大吉', '中吉', '凶'];

  String _result = '';

  void omikuji() {
    final random = Random();
    int num = random.nextInt(list.length);

    setState(() {
      _result = list[num];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('結果はこちら'),
            FortuneCard(result: _result),
            TextButton(
              onPressed: omikuji, 
              child: Text('おみくじ(無料)')),
          ],
        ),
      ),
    );
  }
}

class FortuneCard extends StatelessWidget {
  const FortuneCard({super.key,required this.result});

  final String result;
  String method(){
    String message;
    if(result == "大吉"){
      message = 'いいことありそう！';
    }else if(result == "中吉"){
      message = "いい感じ!";
    }else{
      message = '前向きに!';
    }

    return "結果は$resultでした。$message";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: ,
      child: Text(method()),
    );
  }
}