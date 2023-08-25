import 'package:drift_second_demo/Database/databaseprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Database/app_db.dart';
import 'driftdatabase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppDatabase db = AppDatabase();

  runApp(ChangeNotifierProvider(
    create: (context) => DatabaseProvider(db),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DriftDatabaseDemo(),
    );
  }
}
