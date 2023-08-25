import 'package:flutter/material.dart';

import 'app_db.dart';

class DatabaseProvider extends ChangeNotifier {
  final AppDatabase database; // Your database instance

  DatabaseProvider(this.database);
}
