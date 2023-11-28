import 'package:hive/hive.dart';

class HiveHelper {
  //Save value
  Future<void> saveValue({
    required HiveInterface hive,
    required String boxName,
    required String key,
    required dynamic value,
  }) async {
    final box = await hive.openBox(boxName);
    await box.put(key, value);
    await box.close();
  }

  //Get value
  Future<T> getValue<T>({
    required HiveInterface hive,
    required String boxName,
    required String key,
  }) async {
    final box = await hive.openBox(boxName);
    final value = await box.get(key);
    await box.close();
    return value;
  }

  //Delete value
  Future<void> deleteValue({
    required HiveInterface hive,
    required String boxName,
    required String key,
  }) async {
    final box = await hive.openBox(boxName);
    await box.delete(key);
    await box.close();
  }
}
