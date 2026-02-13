import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../constants/app_constants.dart';

class HiveService {
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);

    // Open boxes
    await Hive.openBox(AppConstants.userBoxName);
    await Hive.openBox(AppConstants.settingsBoxName);
  }
}
