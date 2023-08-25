import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Database/app_db.dart';
import 'Database/databaseprovider.dart';
import 'Database/dbhelper.dart';
import 'Utils/db_utils.dart';

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

    //init database only single instance
    widget.dbHelper = DatabaseHelper(database);

    // widget.dbHelper?.drop(); //call detail table show all data
    widget.dbHelper?.getAllTodos(); //call detail table show all data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Todo>>(
          future: widget.dbHelper?.getAllTodos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final todos = snapshot.data;
              return ListView.builder(
                itemCount: todos?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(child: Center(child: Text('$index'))),
                    title: Text(todos![index].title),
                    subtitle: Text(todos[index].description),
                    trailing: SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            alignment: Alignment.centerRight,
                            onPressed: () async {
                              int id = snapshot.data![index].id;
                              debugPrint('click edit $id');

                              await widget.dbHelper
                                  ?.getTodoWithID(id)
                                  .then((todoItem) {
                                openDialog(
                                  context: context,
                                  isUpdate: true,
                                  db: widget.dbHelper,
                                  callback: () {
                                    setState(() {});
                                  },
                                  list: todoItem,
                                );
                              });
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            alignment: Alignment.centerRight,
                            onPressed: () {
                              int id = snapshot.data![index].id;
                              debugPrint('click delete $id');

                              widget.dbHelper
                                  ?.deleteTodo(id); //add ? else error throws
                              debugPrint('deleted successfully $id');
                              setState(() {});
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          openDialog(
            context: context,
            isUpdate: false,
            db: widget.dbHelper,
            callback: () {
              setState(() {});
            },
          );
        },
      ),
    );
  }

  // listenDatabaseChanges() async {
  //   var db = widget.databaseProvider.database;
  //   db.allItems.listen((event) {
  //     debugPrint('Listne Todo-item in database: $event');
  //   });
  // }
}
