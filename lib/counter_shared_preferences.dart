import 'package:shared_preferences/shared_preferences.dart';

class CounterSharedPreferences {
  final String counterKey = 'counter';
  Future<bool> saveCounter(int value) async {
    final pref = await SharedPreferences.getInstance();

    return await pref.setInt(counterKey, value);
  }

  Future<int> getCounter() async {
    final pref = await SharedPreferences.getInstance();
    final value = pref.getInt(counterKey) ?? 0;
    return value;
  }
}
