import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning_example/provider/dark_theam_provider.dart';

class DarkTheamSecreen extends StatefulWidget {
  const DarkTheamSecreen({super.key});

  @override
  State<DarkTheamSecreen> createState() => _DarkTheamSecreenState();
}

class _DarkTheamSecreenState extends State<DarkTheamSecreen> {
  @override
  Widget build(BuildContext context) {
    final themechanger = Provider.of<Theamprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Theam change'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile(
              title: Text("light Mode"),
              value: ThemeMode.light,
              groupValue: themechanger.thememode,
              onChanged: themechanger.settheam),
          RadioListTile(
              title: Text("dark Mode"),
              value: ThemeMode.dark,
              groupValue: themechanger.thememode,
              onChanged: themechanger.settheam),
          RadioListTile(
              title: Text("System Mode"),
              value: ThemeMode.system,
              groupValue: themechanger.thememode,
              onChanged: themechanger.settheam),
        ],
      ),
    );
  }
}
