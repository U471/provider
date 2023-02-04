import 'package:flutter/foundation.dart';

class FavoriteProvider with ChangeNotifier {
  List<int> _seletedItem = [];
  List<int> get selectedItem => _seletedItem;
  void addItem(int value) {
    _seletedItem.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _seletedItem.remove(value);
    notifyListeners();
  }
}
