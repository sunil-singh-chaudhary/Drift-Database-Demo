import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Database/app_db.dart';
import 'Database/databaseprovider.dart';
import 'Database/dbhelper.dart';

class DriftDatabaseDemo extends StatefulWidget {
  DriftDatabaseDemo({super.key});
  DatabaseHelper? dbHelper;

  @override
  State<DriftDatabaseDemo> createState() => _DriftDatabaseDemoState();
}

class _DriftDatabaseDemoState extends State<DriftDatabaseDemo> {
  @override
  void initState() {
    super.initState();
    final databaseProvider =
        Provider.of<DatabaseProvider>(context, listen: false);
    final database = databaseProvider.database;

    widget.dbHelper =
        DatabaseHelper(database); //init database only single instance

    // widget.dbHelper?.drop(); //call detail table show all data

    widget.dbHelper?.getDetailsData(); //call detail table show all data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Todo>>(
          future: widget.dbHelper?.getDatabaseData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final todos = snapshot.data;
              return ListView.builder(
                itemCount: todos?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(todos![index].title),
                    subtitle: Text(todos[index].description),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  // listenDatabaseChanges() async {
  //   var db = widget.databaseProvider.database;
  //   db.allItems.listen((event) {
  //     debugPrint('Listne Todo-item in database: $event');
  //   });
  // }
}
