import 'package:drift_second_demo/database.dart';
import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier {
  final AppDatabase database; // Your database instance

  DatabaseProvider(this.database);
}
