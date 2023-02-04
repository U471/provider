import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning_example/provider/auth_provider.dart';
import 'package:provider_learning_example/provider/count_provider.dart';
import 'package:provider_learning_example/provider/dark_theam_provider.dart';
import 'package:provider_learning_example/provider/example_one_provider.dart';
import 'package:provider_learning_example/provider/favorite_provider.dart';
import 'package:provider_learning_example/secreen/countexample.dart';
import 'package:provider_learning_example/secreen/dark_theam.dart';
import 'package:provider_learning_example/secreen/example_one.dart';
import 'package:provider_learning_example/secreen/favorite_secreen.dart';
import 'package:provider_learning_example/secreen/login_secreen.dart';
import 'package:provider_learning_example/secreen/value_notify_lisner.dart';
import 'package:provider_learning_example/timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
          ChangeNotifierProvider(create: (_) => Theamprovider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final theamechange = Provider.of<Theamprovider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: theamechange.thememode,
            title: 'Flutter Demo',
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.deepOrange,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.red,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.teal,
              ),
            ),
            home: LoginSecreen(),
          );
        }));
  }
}
