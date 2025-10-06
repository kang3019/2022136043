import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: '플러터 데모 페이지'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(child: createBody5()),
    );
  }
}

Widget creatBody1() {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20),
    width: 200,
    height: 100,
    color: Colors.red,
    alignment: Alignment.center,
    child: Text('Container'),
  );
}

Widget creatBody2() {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 255, 59, 98).withOpacity(0.7),
          Color.fromARGB(255, 255, 59, 98),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 255, 59, 98).withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    width: 200,
    height: 150,
    child: Center(
      child: Text('Container', style: TextStyle(color: Colors.white)),
    ),
  );
}

Widget creatBody3() {
  return Container(
    color: Colors.blue,
    height: 100,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => Container(
          width: 40,
          height: 40,
          color: Colors.red,
          margin: const EdgeInsets.all(5),
        ),
      ),
    ),
  );
}

Widget createBody4() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(
        child: Container(
          height: 40,
          color: Colors.red,
          margin: const EdgeInsets.all(5),
        ),
      ),
      ...List.generate(
        4,
        (index) => Container(
          width: 40,
          height: 40,
          color: Colors.red,
          margin: const EdgeInsets.all(5),
        ),
      ),
    ],
  );
}

Widget createBody5() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(
        flex: 1,
        child: Container(
          height: 40,
          color: Colors.red,
          margin: const EdgeInsets.all(5),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          height: 40,
          color: Colors.red,
          margin: const EdgeInsets.all(5),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          height: 40,
          color: Colors.red,
          margin: const EdgeInsets.all(5),
        ),
      ),
    ],
  );
}
