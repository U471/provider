import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning_example/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print("build" + countProvider.count.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Count'),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child) {
          print('only this widget' + value.count.toString());
          return Text(
            DateTime.now().hour.toString() +
                ":" +
                DateTime.now().minute.toString() +
                ":" +
                DateTime.now().second.toString(),
            style: TextStyle(fontSize: 50),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print("press");
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
