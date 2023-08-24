import 'dart:io';

import 'package:drift_second_demo/databaseprovider.dart';
import 'package:flutter/material.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'driftdatabase.dart';
import 'database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  final dbFile = File('${directory.path}/my_database.db');

  AppDatabase db = AppDatabase(NativeDatabase.createInBackground(dbFile));

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
