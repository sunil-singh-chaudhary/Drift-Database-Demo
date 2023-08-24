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
        body: FutureBuilder<List<Todo>>(
            future: getDatabaseData(),
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
                return const CircularProgressIndicator();
              }
            }));
  }

  Future<List<Todo>> getDatabaseData() async {
    var db = widget.databaseProvider.database;

    // (await db.into(db.todos).insert(
    //     TodosCompanion.insert(title: 'oyeah', description: "descript")));

    return await db.select(db.todos).get();
  }
}
