import 'package:shared_preferences/shared_preferences.dart';


class LocalDataSource {

  Future<void> incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int counter = (prefs.getInt('counter') ?? 0) + 1;
    prefs.setInt("counter", counter);
  }

  Future<int> getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("counter")??0;
  }


}


