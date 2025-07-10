import 'package:hive/hive.dart';

class HiveUserService {
  static const String boxName = 'userBox';

  Future<void> saveUserEmail(String email) async {
    final box = await Hive.openBox(boxName);
    await box.put('email', email);
  }

  Future<String?> getUserEmail() async {
    final box = await Hive.openBox(boxName);
    return box.get('email');
  }

  Future<void> clearUser() async {
    final box = await Hive.openBox(boxName);
    await box.clear();
  }
}
