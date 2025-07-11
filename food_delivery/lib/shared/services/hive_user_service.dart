import 'package:hive/hive.dart';

class HiveUserService {
  static const _boxName = 'userBox';

  /// İlk açılış (welcome) durumu
  Future<void> setFirstOpen() async {
    final box = await Hive.openBox(_boxName);
    await box.put('isFirstOpen', false);
  }

  Future<bool> isFirstOpen() async {
    final box = await Hive.openBox(_boxName);
    return box.get('isFirstOpen', defaultValue: true);
  }

  /// UID işlemleri
  Future<void> saveUserId(String uid) async {
    final box = await Hive.openBox(_boxName);
    await box.put('uid', uid);
  }

  Future<String?> getUserId() async {
    final box = await Hive.openBox(_boxName);
    return box.get('uid');
  }

  // sadece isFirstOpen durumunu temizler
  Future<void> clearFirstOpen() async {
    final box = await Hive.openBox(_boxName);
    await box.delete('isFirstOpen');
  }

  // sadece uid'yi siler
  Future<void> clearUserId() async {
    final box = await Hive.openBox(_boxName);
    await box.delete('uid');
  }
}
