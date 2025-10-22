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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: const MyHomePage(title: '플러터 데모 홈 페이지'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //화면 구성 단위
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: createBody(),
    );
  }
}

Widget createBody() {
  //return Center(child: createS1());
  // return Column(
  //   children: [
  //     createS2(MainAxisAlignment.start),
  //     createS2(MainAxisAlignment.center),
  //     createS2(MainAxisAlignment.end),
  //     createS2(MainAxisAlignment.spaceEvenly),
  //     createS2(MainAxisAlignment.spaceAround),
  //     createS2(MainAxisAlignment.spaceBetween),
  //     //
  //     createS3(CrossAxisAlignment.stretch),
  //     createS3(CrossAxisAlignment.start),
  //     createS3(CrossAxisAlignment.end),
  //     createS3(CrossAxisAlignment.center),
  //   ],
  // );
  //// 2qjsWo
  // return Row(
  //   children: [
  //     createS4(MainAxisAlignment.start),
  //     createS4(MainAxisAlignment.center),
  //     createS4(MainAxisAlignment.end),
  //     createS4(MainAxisAlignment.spaceEvenly),
  //     createS4(MainAxisAlignment.spaceAround),
  //     createS4(MainAxisAlignment.spaceBetween),
  //     //
  //     createS5(CrossAxisAlignment.stretch),
  //     createS5(CrossAxisAlignment.start),
  //     createS5(CrossAxisAlignment.end),
  //     createS5(CrossAxisAlignment.center),
  //   ],
  // );

  // return createS6();
  return createS8();
}

Widget createS8() {
  return Center(
    child: SizedBox(
      width: 350,
      height: 350,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.red)),
                Expanded(child: Container(color: Colors.yellow)),
              ],
            ),
          ),
          Expanded(child: Container(color: Colors.blue)),
        ],
      ),
    ),
  );
}

Widget createS7() {
  return Column(
    children: [
      Row(children: [createBox(1), createBox(1), createBox(1)]),
      Row(children: [createBox(1), createBox(2), createBox(1)]),
      Row(children: [createBox(1), createBox(2), createBox(3)]),
    ],
  );
}

Widget createBox(int flex) {
  return Expanded(
    flex: flex,
    child: Container(
      height: 40,
      color: Colors.red,
      margin: const EdgeInsets.all(5),
    ),
  );
}

Widget createS6() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ...List.generate(
        4,
        (index) => Container(
          width: 40,
          height: 40,
          color: Colors.red,
          margin: const EdgeInsets.all(5),
        ),
      ),
      Expanded(
        child: Container(
          height: 40,
          color: Colors.red,
          margin: const EdgeInsets.all(5),
        ),
      ),
    ],
  );
}

Widget createS1() {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20),
    width: 200,
    height: 50,
    color: Colors.blue,
    child: Center(child: Text('container')),
  );
}

Widget createS2(MainAxisAlignment mainAxisAlignment) {
  return Row(
    mainAxisAlignment: mainAxisAlignment,
    children: List.generate(
      5,
      (index) => Container(
        width: 40,
        height: 40,
        color: Colors.red,
        margin: const EdgeInsets.all(5),
      ),
    ),
  );
}

Widget createS3(CrossAxisAlignment crossAxisAlignment) {
  return Container(
    height: 100,
    color: Colors.blue,
    margin: const EdgeInsets.all(5),
    child: Row(
      crossAxisAlignment: crossAxisAlignment,
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

//2,3을 Row로

Widget createS4(MainAxisAlignment mainAxisAlignment) {
  return Column(
    mainAxisAlignment: mainAxisAlignment,
    children: List.generate(
      5,
      (index) => Container(
        width: 40,
        height: 40,
        color: Colors.red,
        margin: const EdgeInsets.all(5),
      ),
    ),
  );
}

Widget createS5(CrossAxisAlignment crossAxisAlignment) {
  return Container(
    width: 100,
    color: Colors.blue,
    margin: const EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: crossAxisAlignment,
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
