import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../constants/app_constants.dart';
import '../../features/dashboard/data/models/todo_model.dart';

class HiveService {
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);

    // Register Adapters
    Hive.registerAdapter(TodoModelAdapter());

    // Open boxes
    await Hive.openBox(AppConstants.userBoxName);
    await Hive.openBox(AppConstants.settingsBoxName);
    await Hive.openBox<TodoModel>(AppConstants.todoBoxName);
  }
}
