import 'package:flutter/material.dart';

class NotifyListSecreen extends StatelessWidget {
  NotifyListSecreen({super.key});
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> togel = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: togel,
              builder: (context, value, child) {
                return TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: InkWell(
                        onTap: () {
                          togel.value = !togel.value;
                          print('object');
                        },
                        child: Icon(togel.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility)),
                  ),
                  obscureText: togel.value,
                );
              }),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  _counter.value.toString(),
                  style: TextStyle(fontSize: 50),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
