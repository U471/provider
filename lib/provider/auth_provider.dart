import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      Response response = await post(
          Uri.parse('https://www.virtualsoft.pk/jobiees/jobseeker/User/login'),
          body: {
            'auth_key': 'usama@321',
            'email': email,
            'password': password
          });
      if (response.statusCode == 200) {
        setLoading(false);
        print("successfull login");
      } else {
        setLoading(false);
        print("faild");
      }
    } catch (e) {
      setLoading(false);

      print(e.toString());
    }
  }
}
