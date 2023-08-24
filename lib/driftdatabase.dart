import 'package:drift_second_demo/database.dart';
import 'package:drift_second_demo/databaseprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DriftDatabaseDemo extends StatefulWidget {
  DriftDatabaseDemo({super.key});
  late DatabaseProvider databaseProvider;
  @override
  State<DriftDatabaseDemo> createState() => _DriftDatabaseDemoState();
}

class _DriftDatabaseDemoState extends State<DriftDatabaseDemo> {
  @override
  void initState() {
    super.initState();
    widget.databaseProvider =
        Provider.of<DatabaseProvider>(context, listen: false);
    getDatabaseData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }

  void getDatabaseData() async {
    var db = widget.databaseProvider.database;

    (await db.into(db.todos).insert(
        TodosCompanion.insert(title: 'oyeah', description: "descript")));

    (await db.into(db.todos).insert(TodosCompanion.insert(
        title: 'seoncd Title', description: "this is second descriptions")));

    (await db.select(db.todos).get()).forEach((element) {
      debugPrint('data base data is - $element');
    });
  }
}
