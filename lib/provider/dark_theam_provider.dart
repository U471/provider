import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Theamprovider with ChangeNotifier {
  var _theammod = ThemeMode.light;
  ThemeMode get thememode => _theammod;
  void settheam(ThemeMpde) {
    _theammod = ThemeMpde;
    notifyListeners();
  }
}
