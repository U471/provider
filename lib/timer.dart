import 'dart:async';

import 'package:flutter/material.dart';

class TimerSecreen extends StatefulWidget {
  const TimerSecreen({super.key});

  @override
  State<TimerSecreen> createState() => _TimerSecreenState();
}

class _TimerSecreenState extends State<TimerSecreen> {
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      print(count);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              DateTime.now().hour.toString() +
                  ":" +
                  DateTime.now().minute.toString() +
                  ":" +
                  DateTime.now().second.toString(),
              style: TextStyle(fontSize: 50),
            ),
          ),
          Center(
            child: Text(
              count.toString(),
              style: TextStyle(fontSize: 50),
            ),
          )
        ],
      ),
    );
  }
}
